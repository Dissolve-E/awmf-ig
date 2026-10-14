#!/usr/bin/env bash
# Build the upstream dependency packages used by this AWMF build.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$repo_dir/input-cache"
work_dir="$(mktemp -d "$repo_dir/input-cache/ig-dependencies.XXXXXX")"
packages_dir="$repo_dir/input-cache/dependency-packages"
mkdir -p "$packages_dir"
publisher="$repo_dir/input-cache/publisher.jar"
build_id="${GITHUB_RUN_ID:-$(date -u +%Y%m%d%H%M%S)}.${GITHUB_RUN_ATTEMPT:-1}"

bash "$repo_dir/download-publisher.sh"
git clone --quiet --depth 1 --branch main \
  https://github.com/HL7/ebm-incubator.git "$work_dir/ebm-incubator"
git clone --quiet --depth 1 --branch master \
  https://github.com/HL7/ebm.git "$work_dir/ebm"

prepare_config() {
  ruby -ryaml -rjson -rrexml/document -e '
    path, build_id, incubator_version = ARGV
    config = YAML.load_file(path)
    abort "Expected FHIR 6.0.0-snapshot1 in #{path}" unless config["fhirVersion"] == "6.0.0-snapshot1"
    config["version"] = "#{config.fetch("version")}-awmf.#{build_id}"
    config["parameters"] ||= {}
    config["parameters"]["version-comparison"] = "n/a"
    unless incubator_version.to_s.empty?
      config.fetch("dependencies")["hl7.fhir.uv.ebm-incubator"] = incubator_version
    end

    # Additional resource definitions must use the IG version. Update their
    # versioned references too, including resourceDefinition on XML examples.
    root = File.dirname(path)
    references = {}
    Array(config["parameters"]["additional-resource"]).each do |relative_path|
      resource_path = File.join(root, relative_path)
      case File.extname(resource_path)
      when ".json"
        definition = JSON.parse(File.read(resource_path))
        abort "Expected StructureDefinition in #{resource_path}" unless definition["resourceType"] == "StructureDefinition"
        url = definition.fetch("url")
        old_version = definition["version"]
        if old_version
          definition["version"] = config.fetch("version")
          File.write(resource_path, JSON.pretty_generate(definition) + "\n")
        end
      when ".xml"
        definition = REXML::Document.new(File.read(resource_path))
        abort "Expected FHIR StructureDefinition in #{resource_path}" unless
          definition.root.name == "StructureDefinition" && definition.root.namespace == "http://hl7.org/fhir"
        url = definition.root.elements["url"].attributes.fetch("value")
        version_element = definition.root.elements["version"]
        old_version = version_element&.attributes&.fetch("value", nil)
        if version_element
          version_element.attributes["value"] = config.fetch("version")
          File.write(resource_path, definition.to_s)
        end
      else
        abort "Expected JSON or XML additional resource: #{resource_path}"
      end
      references["#{url}|#{old_version}"] = "#{url}|#{config.fetch("version")}" unless old_version.to_s.empty?
    end
    unless references.empty?
      pattern = /(?:#{Regexp.union(references.keys).source})(?=["\x27<\s]|$)/
      Dir.glob(File.join(root, "input", "**", "*.{xml,json,fsh}")).each do |source|
        text = File.read(source)
        updated = text.gsub(pattern) { |reference| references.fetch(reference) }
        File.write(source, updated) unless updated == text
      end
    end
    File.write(path, YAML.dump(config))
    puts config["version"]
  ' "$@"
}

install_package() {
  local checkout=$1 package_id=$2 version=$3
  local cache_dir="$HOME/.fhir/packages/$package_id#$version"
  test -s "$checkout/output/package.tgz"
  mkdir -p "$cache_dir"
  tar -xzf "$checkout/output/package.tgz" -C "$cache_dir" package
  ruby -rjson -e '
    path, id, version, incubator_version = ARGV
    package = JSON.parse(File.read(path))
    abort "Unexpected dependency package metadata in #{path}" unless
      package["name"] == id && package["version"] == version &&
      package["fhirVersions"] == ["6.0.0-snapshot1"]
    unless incubator_version.to_s.empty?
      abort "EBM did not use the freshly built Incubator package" unless
        package.fetch("dependencies")["hl7.fhir.uv.ebm-incubator"] == incubator_version
    end
  ' "$cache_dir/package/package.json" "$package_id" "$version" "${4:-}"
  cp "$checkout/output/package.tgz" "$packages_dir/$package_id.tgz"
}

incubator_version="$(prepare_config "$work_dir/ebm-incubator/sushi-config.yaml" "$build_id")"
java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -ig "$work_dir/ebm-incubator"
install_package "$work_dir/ebm-incubator" hl7.fhir.uv.ebm-incubator "$incubator_version"

ebm_version="$(prepare_config "$work_dir/ebm/sushi-config.yaml" "$build_id" "$incubator_version")"
java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -ig "$work_dir/ebm"
install_package "$work_dir/ebm" hl7.fhir.uv.ebm "$ebm_version" "$incubator_version"

# Pin the AWMF build to these exact packages; preserve the source file formatting.
ruby -e '
  path, ebm_version, incubator_version = ARGV
  text = File.read(path)
  {"hl7.fhir.uv.ebm" => ebm_version, "hl7.fhir.uv.ebm-incubator" => incubator_version}.each do |id, version|
    pattern = /^(  #{Regexp.escape(id)}:) .+$/
    abort "Missing AWMF dependency #{id}" unless text.match?(pattern)
    text = text.sub(pattern) { "#{$1} #{version}" }
  end
  File.write(path, text)
' "$repo_dir/sushi-config.yaml" "$ebm_version" "$incubator_version"

ruby -rjson -rdigest -e '
  output, incubator, ebm, publisher, incubator_version, ebm_version = ARGV
  dependencies = [["hl7.fhir.uv.ebm-incubator", incubator, incubator_version], ["hl7.fhir.uv.ebm", ebm, ebm_version]]
  info = {"fhirVersion" => "6.0.0-snapshot1", "publisher_sha256" => Digest::SHA256.file(publisher).hexdigest,
          "packages" => dependencies.map do |id, source, version|
            file = "#{id}.tgz"
            {"id" => id, "version" => version, "file" => file,
             "source_commit" => IO.popen(["git", "-C", source, "rev-parse", "HEAD"], &:read).strip,
             "sha256" => Digest::SHA256.file(File.join(output, file)).hexdigest}
          end}
  File.write(File.join(output, "build-info.json"), JSON.pretty_generate(info) + "\n")
' "$packages_dir" "$work_dir/ebm-incubator" "$work_dir/ebm" "$publisher" "$incubator_version" "$ebm_version"

# Publish these files as static IG content, so download links are checked too.
mkdir -p "$repo_dir/input/pagecontent/dependencies"
cp "$packages_dir"/*.tgz "$packages_dir/build-info.json" "$repo_dir/input/pagecontent/dependencies/"
