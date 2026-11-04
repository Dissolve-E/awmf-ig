#!/usr/bin/env bash
# Publish the version that publication-request.json describes with the IG Publisher's
# -go-publish process. See RELEASING.md.
#
# Usage: ./publish-version.sh --web <dir> --work <dir>
#
#   --web   the complete website at the canonical, http://fhir.awmf.org/awmf.ig without
#           ci-build/. -go-publish adds the new version and updates package-list.json,
#           the history page, the feeds and the publish boxes of earlier versions.
#   --work  a folder for the history template, the publication builds and their logs
#           (the logs end up in <work>/zips).
#
# Both folders must be outside this repository, because -go-publish copies the
# repository for its builds. The script uploads nothing.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# HL7/fhir-ig-history-template, master on 2026-11-04.
history_template_commit="8a90b35a2d839cc463eaf3d1c04a02ea60abb998"

usage() {
  echo "Usage: $0 --web <dir> --work <dir>" >&2
  exit 1
}

web=""
work=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --web) web="${2:-}"; shift 2 || usage ;;
    --work) work="${2:-}"; shift 2 || usage ;;
    *) usage ;;
  esac
done
[[ -n "$web" && -n "$work" ]] || usage
mkdir -p "$web" "$work"
web="$(cd "$web" && pwd)"
work="$(cd "$work" && pwd)"
for dir in "$web" "$work"; do
  if [[ "$dir/" == "$repo_dir/"* ]]; then
    echo "$dir is inside the repository; -go-publish copies the repository for its builds" >&2
    exit 1
  fi
done

cd "$repo_dir"
if [[ ! -f publication-request.json ]]; then
  echo "publication-request.json is missing; see RELEASING.md" >&2
  exit 1
fi

# Check the request against sushi-config.yaml and the website before the long builds;
# -go-publish checks most of this only after its first build.
ruby -ryaml -rjson -e '
  web = ARGV[0]
  config = YAML.load_file("sushi-config.yaml")
  request = JSON.parse(File.read("publication-request.json"))
  version = config.fetch("version").to_s
  canonical = config.fetch("canonical")
  errors = []
  errors << "package-id must be #{config["id"]}" unless request["package-id"] == config["id"]
  errors << "version #{request["version"]} differs from #{version} in sushi-config.yaml" unless request["version"] == version
  errors << "path must be #{canonical}/#{version}" unless request["path"] == "#{canonical}/#{version}"
  errors << "mode must be working, milestone or technical-correction" unless
    %w[working milestone technical-correction].include?(request["mode"])
  %w[status sequence desc].each { |key| errors << "#{key} is missing" if request[key].to_s.empty? }
  current = (config["dependencies"] || {}).select do |_, dependency|
    %w[current dev].include?((dependency.is_a?(Hash) ? dependency["version"] : dependency).to_s)
  end
  if current.any? && request["allow-current-dependencies"] != true
    errors << "allow-current-dependencies must be true, the IG depends on " +
              current.keys.map { |id| "#{id}#current" }.join(", ")
  end
  if config["releaseLabel"].to_s == "ci-build"
    errors << "set releaseLabel in sushi-config.yaml for the release (it is ci-build)"
  end
  package_list = File.join(web, "package-list.json")
  if File.exist?(package_list)
    list = JSON.parse(File.read(package_list))
    errors << "first must be false, the website already has a package-list.json" if request["first"] == true
    errors << "the website has the canonical #{list["canonical"]}, not #{canonical}" unless list["canonical"] == canonical
    errors << "version #{version} is already published" if list["list"].any? { |entry| entry["version"] == version }
  elsif request["first"] != true
    errors << "first must be true, the website has no package-list.json"
  end
  abort errors.map { |error| "publication-request.json: #{error}" }.join("\n") unless errors.empty?
' "$web"

./download-publisher.sh
publisher="$repo_dir/input-cache/publisher.jar"

# Website configuration that -go-publish reads from the web folder. It is created only
# where it is missing and then lives on the server with the publications.
ruby -ryaml -rjson -rtime -e '
  web = ARGV[0]
  config = YAML.load_file("sushi-config.yaml")
  canonical = config.fetch("canonical")
  setup_file = File.join(web, "publish-setup.json")
  unless File.exist?(setup_file)
    # The web folder is the canonical itself, so the IG goes to its root. "cloud" writes
    # static HTML redirects for the canonical URLs; the server does not run PHP.
    setup = {
      "website" => {"style" => "fhir.layout", "url" => canonical, "server" => "cloud",
                    "org" => config.fetch("publisher").fetch("name"), "clone-xml-json" => false},
      "feeds" => {"package" => "package-feed.xml", "publication" => "publication-feed.xml"},
      "layout-rules" => [{"npm" => config.fetch("id"), "canonical" => canonical, "destination" => "/"}]
    }
    File.write(setup_file, JSON.pretty_generate(setup) + "\n")
    puts "Created #{setup_file}"
  end
  setup = JSON.parse(File.read(setup_file))
  rule = setup.fetch("layout-rules").find { |r| r["npm"] == config["id"] }
  abort "#{setup_file} must publish #{config["id"]} at #{canonical}" unless
    setup.dig("website", "url") == canonical && rule && rule["destination"] == "/"
  setup.fetch("feeds").each do |kind, file|
    path = File.join(web, file)
    next if File.exist?(path)
    now = Time.now.utc.rfc2822
    File.write(path, <<~RSS)
      <?xml version="1.0" encoding="UTF-8"?>
      <rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:fhir="http://hl7.org/fhir/feed" xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
        <channel>
          <title>#{config.fetch("title")}: #{kind == "package" ? "packages" : "publications"}</title>
          <description>FHIR #{kind == "package" ? "packages" : "publications"} of #{config.fetch("title")}</description>
          <link>#{canonical}</link>
          <generator>#{config.fetch("publisher").fetch("name")}</generator>
          <lastBuildDate>#{now}</lastBuildDate>
          <atom:link href="#{canonical}/#{file}" rel="self" type="application/rss+xml"/>
          <pubDate>#{now}</pubDate>
          <language>en</language>
          <ttl>600</ttl>
        </channel>
      </rss>
    RSS
    puts "Created #{path}"
  end
  # The CI build is published at ci-build/ (ig-publish.yml), not at the canonical.
  package_list = File.join(web, "package-list.json")
  if File.exist?(package_list)
    list = JSON.parse(File.read(package_list))
    ci_build = list.fetch("list").find { |entry| entry["version"] == "current" }
    if ci_build && ci_build["path"] != "#{canonical}/ci-build"
      ci_build["path"] = "#{canonical}/ci-build"
      File.write(package_list, JSON.pretty_generate(list) + "\n")
      puts "Pointed the ci-build entry of #{package_list} to #{canonical}/ci-build"
    end
  end
' "$web"
if [[ ! -f "$web/package-registry.json" ]]; then
  java -jar "$publisher" -generate-package-registry "$web"
fi

history_template="$work/history-template"
rm -rf "$history_template"
mkdir -p "$history_template"
curl --fail --silent --show-error --location --retry 3 \
  "https://github.com/HL7/fhir-ig-history-template/archive/$history_template_commit.tar.gz" |
  tar -xz --strip-components 1 -C "$history_template"
# -go-publish records the publication in an IG registry file; AWMF is not listed in the
# FHIR IG registry, so it gets an empty one.
printf '{\n  "guides" : []\n}\n' > "$work/fhir-ig-list.json"
rm -rf "$work/temp" "$work/zips"

# Install the build.fhir.org packages of the EBM dependencies and add them to the downloads.
./download-dependencies.sh
# Build AWMF with the SUSHI fix from FHIR/sushi#1653. The -go-publish builds run in the
# same process and use it too.
PATH="$(./install-sushi.sh):$PATH"
export PATH
# Regenerate the Jekyll data file for the page includes from the current FSH.
./update-ig-data.sh

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"
read -r version mode publication_path < <(ruby -rjson -e '
  request = JSON.parse(File.read("publication-request.json"))
  puts request.values_at("version", "mode", "path").join(" ")
')
# -go-publish starts from a finished build of the source. Its own builds of a copy must
# not report more errors, warnings or hints than this one.
java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -ig . -publish "$publication_path"
test -s output/package.tgz
test -s output/qa.json

java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -go-publish \
  -source "$repo_dir" \
  -web "$web" \
  -history "$history_template" \
  -registry "$work/fhir-ig-list.json" \
  -temp "$work/temp" \
  -templates "$repo_dir/publication/templates" \
  -zips "$work/zips"
./download-dependencies.sh --verify

# Check the staged website before anything is uploaded.
ruby -rjson -e '
  web, version, path, mode = ARGV
  errors = []
  list = JSON.parse(File.read(File.join(web, "package-list.json")))
  entry = list.fetch("list").find { |e| e["version"] == version }
  if entry.nil?
    errors << "package-list.json has no entry for #{version}"
  else
    errors << "package-list.json lists #{version} at #{entry["path"]}" unless entry["path"] == path
    errors << "package-list.json does not mark #{version} as current" if mode != "working" && entry["current"] != true
  end
  package = File.join(web, version, "package.tgz")
  if File.size?(package)
    manifest = JSON.parse(IO.popen(["tar", "-xzOf", package, "package/package.json"], &:read))
    errors << "#{package} is #{manifest["name"]}##{manifest["version"]}" unless
      manifest["name"] == list["package-id"] && manifest["version"] == version
  else
    errors << "#{package} is missing"
  end
  errors << "#{version}/index.html is missing" unless File.size?(File.join(web, version, "index.html"))
  errors << "history.html does not list #{version}" unless File.read(File.join(web, "history.html")).include?(path)
  %w[package-feed.xml publication-feed.xml].each do |feed|
    errors << "#{feed} has no entry for #{version}" unless File.read(File.join(web, feed)).include?(path)
  end
  # Versions published before the switch to static redirects keep their index.php files.
  old_versions = list.fetch("list").map { |e| e["path"].to_s.delete_prefix(list["canonical"] + "/") } - [version]
  php = Dir.glob("**/*.php", base: web).reject { |file| old_versions.any? { |v| file.start_with?("#{v}/") } }
  errors << "PHP redirects in #{php.first(3).join(", ")}" if php.any?
  abort errors.map { |error| "Staged website: #{error}" }.join("\n") unless errors.empty?
  puts "Staged website: #{version} at #{path}, mode #{mode}"
' "$web" "$version" "$publication_path" "$mode"
