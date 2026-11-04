#!/usr/bin/env bash
# Install the build.fhir.org packages of the EBM dependencies as #current and publish
# them with the IG as downloads, together with their build dates and checksums.
# With --verify, check after the build that the package cache still holds them.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
packages_dir="$repo_dir/input-cache/dependency-packages"
assets_dir="$repo_dir/input/assets/dependencies"
cache_root="$HOME/.fhir/packages"
# Package id and build.fhir.org path of each dependency that sushi-config.yaml takes as current.
dependencies=(
  "hl7.fhir.uv.ebm-incubator HL7/ebm-incubator"
  "hl7.fhir.uv.ebm HL7/ebm"
)

if [[ "${1:-}" == "--verify" ]]; then
  # The Publisher and SUSHI replace a cached current package whose date differs from
  # build.fhir.org, so a new upstream build during this build would not match the downloads.
  for dependency in "${dependencies[@]}"; do
    read -r package_id _ <<<"$dependency"
    ruby -rjson -e '
      bundled, cached, id = ARGV
      expected = JSON.parse(IO.popen(["tar", "-xzOf", bundled, "package/package.json"], &:read)).fetch("date")
      actual = JSON.parse(File.read(cached)).fetch("date")
      abort "#{id}: the build used the build.fhir.org package from #{actual}, but the downloads " \
            "contain the one from #{expected}. build.fhir.org published a new package during " \
            "the build; run the build again." unless actual == expected
    ' "$packages_dir/$package_id.tgz" "$cache_root/$package_id#current/package/package.json" "$package_id"
  done
  echo "The dependency downloads match the packages used by the build"
  exit 0
fi

curl_options=(--fail --silent --show-error --location --retry 3 --connect-timeout 20 --max-time 600)
rm -rf "$packages_dir"
mkdir -p "$packages_dir"
package_urls=()
for dependency in "${dependencies[@]}"; do
  read -r package_id repository <<<"$dependency"
  url="https://build.fhir.org/ig/$repository/package.tgz"
  echo "Downloading $package_id#current from $url"
  curl "${curl_options[@]}" "$url" --output "$packages_dir/$package_id.tgz"
  # Replace the whole folder so that resources removed upstream do not linger.
  cache_dir="$cache_root/$package_id#current"
  rm -rf "$cache_dir"
  mkdir -p "$cache_dir"
  tar -xzf "$packages_dir/$package_id.tgz" -C "$cache_dir" package
  package_urls+=("$package_id" "$url")
done

ruby -ryaml -rjson -rdigest -rdate -e '
  config, output, *package_urls = ARGV
  fhir_version = YAML.load_file(config).fetch("fhirVersion")
  packages = package_urls.each_slice(2).map do |id, url|
    file = "#{id}.tgz"
    package = JSON.parse(IO.popen(["tar", "-xzOf", File.join(output, file), "package/package.json"], &:read))
    abort "Unexpected package metadata in #{url}" unless
      package["name"] == id && package["fhirVersions"] == [fhir_version]
    {"id" => id, "version" => package.fetch("version"), "file" => file, "url" => url,
     "build_date" => DateTime.strptime(package.fetch("date"), "%Y%m%d%H%M%S").strftime("%Y-%m-%dT%H:%M:%SZ"),
     "sha256" => Digest::SHA256.file(File.join(output, file)).hexdigest}
  end
  File.write(File.join(output, "build-info.json"),
             JSON.pretty_generate({"fhirVersion" => fhir_version, "packages" => packages}) + "\n")
' "$repo_dir/sushi-config.yaml" "$packages_dir" "${package_urls[@]}"

# The template copies assets unchanged, including into the language directories.
# Make downloads available before link checking and full-ig.zip generation.
rm -rf "$assets_dir"
mkdir -p "$assets_dir"
cp "$packages_dir"/*.tgz "$packages_dir/build-info.json" "$assets_dir/"
