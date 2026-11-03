#!/usr/bin/env bash
# Install the pinned HL7 IG Publisher release.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cache="$script_dir/input-cache"
publisher="$cache/publisher.jar"
version="${PUBLISHER_VERSION:-3.0.2}"

if [[ "$version" == *[!a-zA-Z0-9._-]* ]]; then
  echo "Invalid Publisher version: $version" >&2
  exit 1
fi

if [[ -f "$publisher" && "$(java -jar "$publisher" -v 2>/dev/null | tail -n 1)" == "$version" ]]; then
  echo "IG Publisher is up to date: $version"
  exit 0
fi
if [[ "${PUBLISHER_OFFLINE:-0}" == 1 ]]; then
  echo "IG Publisher $version is not in $cache" >&2
  exit 1
fi

curl_options=(--fail --silent --show-error --location --retry 3 --connect-timeout 20 --max-time 600)
mkdir -p "$cache"
download_dir="$(mktemp -d "$cache/.publisher.XXXXXX")"
trap 'rm -rf "$download_dir"' EXIT

echo "Downloading IG Publisher: $version"
curl "${curl_options[@]}" "https://github.com/HL7/fhir-ig-publisher/releases/download/$version/publisher.jar" \
  --output "$download_dir/publisher.jar"
# Replace the existing JAR only after a complete download.
mv "$download_dir/publisher.jar" "$publisher"
echo "IG Publisher ready: $publisher ($version)"
