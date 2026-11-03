#!/usr/bin/env bash
# Install the latest HL7 IG Publisher release, or the release in PUBLISHER_VERSION.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cache="$script_dir/input-cache"
publisher="$cache/publisher.jar"
repository_url="https://github.com/HL7/fhir-ig-publisher"
version="${PUBLISHER_VERSION:-}"

cached_version() {
  if [[ -f "$publisher" ]]; then
    java -jar "$publisher" -v 2>/dev/null | tail -n 1
  fi
}

if [[ "${PUBLISHER_OFFLINE:-0}" == 1 ]]; then
  cached="$(cached_version)"
  if [[ -n "$cached" && ( -z "$version" || "$cached" == "$version" ) ]]; then
    echo "Using cached IG Publisher: $cached"
    exit 0
  fi
  echo "IG Publisher ${version:-release} is not in $cache" >&2
  exit 1
fi

curl_options=(--fail --silent --show-error --location --retry 3 --connect-timeout 20 --max-time 600)
if [[ -z "$version" ]]; then
  release_url="$(curl "${curl_options[@]}" --head --output /dev/null --write-out '%{url_effective}' \
    "$repository_url/releases/latest")"
  release_prefix="$repository_url/releases/tag/"
  if [[ "$release_url" != "$release_prefix"* ]]; then
    echo "Cannot resolve the latest Publisher release: $release_url" >&2
    exit 1
  fi
  version="${release_url#"$release_prefix"}"
fi
if [[ -z "$version" || "$version" == *[!a-zA-Z0-9._-]* ]]; then
  echo "Invalid Publisher version: $version" >&2
  exit 1
fi

if [[ "$(cached_version)" == "$version" ]]; then
  echo "IG Publisher is up to date: $version"
  exit 0
fi

mkdir -p "$cache"
download_dir="$(mktemp -d "$cache/.publisher.XXXXXX")"
trap 'rm -rf "$download_dir"' EXIT

echo "Downloading IG Publisher: $version"
curl "${curl_options[@]}" "$repository_url/releases/download/$version/publisher.jar" \
  --output "$download_dir/publisher.jar"
# Replace the existing JAR only after a complete download.
mv "$download_dir/publisher.jar" "$publisher"
echo "IG Publisher ready: $publisher ($version)"
