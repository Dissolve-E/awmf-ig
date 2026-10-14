#!/usr/bin/env bash
# Install the latest successfully tested AWMF/EBM Publisher, or a pinned release.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cache="$script_dir/input-cache"
publisher="$cache/publisher.jar"
repository="${PUBLISHER_REPOSITORY:-glichtner/fhir-ig-publisher}"
tag="${PUBLISHER_TAG:-}"

if [[ "${PUBLISHER_OFFLINE:-0}" == 1 ]]; then
  cd "$cache"
  sha256sum --check publisher.jar.sha256
  exit 0
fi

curl_options=(--fail --silent --show-error --location --retry 3 --connect-timeout 20 --max-time 600)
if [[ -z "$tag" ]]; then
  release_url="$(curl "${curl_options[@]}" --head --output /dev/null --write-out '%{url_effective}' \
    "https://github.com/$repository/releases/latest")"
  release_prefix="https://github.com/$repository/releases/tag/"
  if [[ "$release_url" != "$release_prefix"* ]]; then
    echo "Cannot resolve latest patched Publisher release: $release_url" >&2
    exit 1
  fi
  tag="${release_url#"$release_prefix"}"
fi
if [[ "$tag" != patched-* || "$tag" == *[!a-zA-Z0-9._-]* ]]; then
  echo "Expected a patched Publisher release tag, got: $tag" >&2
  exit 1
fi

mkdir -p "$cache"
download_dir="$(mktemp -d "$cache/.publisher.XXXXXX")"
trap 'rm -rf "$download_dir"' EXIT
download_url="https://github.com/$repository/releases/download/$tag"
curl "${curl_options[@]}" "$download_url/publisher.jar.sha256" --output "$download_dir/publisher.jar.sha256"
read -r expected_checksum checksum_file < "$download_dir/publisher.jar.sha256"
if [[ ! "$expected_checksum" =~ ^[a-f0-9]{64}$ || "$checksum_file" != publisher.jar ]]; then
  echo "Invalid Publisher checksum file from $download_url" >&2
  exit 1
fi

if [[ -f "$publisher" && "$(sha256sum "$publisher" | cut -d ' ' -f 1)" == "$expected_checksum" ]]; then
  cp "$download_dir/publisher.jar.sha256" "$cache/publisher.jar.sha256"
  echo "Patched Publisher is up to date: $tag"
  exit 0
fi

echo "Downloading patched Publisher: $tag"
curl "${curl_options[@]}" "$download_url/publisher.jar" --output "$download_dir/publisher.jar"
(cd "$download_dir" && sha256sum --check publisher.jar.sha256)
# Replace the existing JAR only after a complete download and checksum check.
mv "$download_dir/publisher.jar" "$publisher"
mv "$download_dir/publisher.jar.sha256" "$cache/publisher.jar.sha256"
echo "Patched Publisher ready: $publisher ($tag)"
