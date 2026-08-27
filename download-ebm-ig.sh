#!/bin/bash

# This script installs the latest GitHub release package of the EBM IG.
# It deliberately does not use the FHIR package registry or build.fhir.org.

set -euo pipefail

package_version=$(grep -A1 'hl7.fhir.uv.ebm:' sushi-config.yaml | head -n1 | awk '{ print $2}')
echo "Detected package version: $package_version"

# Check if the string was found
if [ -z "$package_version" ]; then
    echo "EBM package version not found in sushi-config.yaml"
    exit 1
fi

# Ensure the script only runs if the package version is exactly "ci-build"
if [ "$package_version" != "ci-build" ]; then
    echo "Package version is not 'ci-build'. Nothing to do."
    exit 0
fi

release_api_url="https://api.github.com/repos/HL7/ebm/releases?per_page=20"
package_url=$(curl -fsSL "$release_api_url" \
  | grep '"browser_download_url":' \
  | grep -E 'package\.tgz|\.tgz' \
  | head -n 1 \
  | cut -d '"' -f 4)

if [ -z "$package_url" ]; then
    echo "Could not find a package.tgz asset in the latest HL7/ebm GitHub release"
    exit 1
fi

filename="package.tgz"
mkdir -p "$HOME/.fhir/packages"

path="$HOME/.fhir/packages/hl7.fhir.uv.ebm#$package_version"

# Remove path and all contents if it exists
if [ -d "$path" ]; then
    echo "Removing existing path: $path"
    rm -rf "$path"
fi

echo "Installing to: $path"
mkdir -p "$path"
cd "$path" || exit

echo "Downloading $filename from GitHub release..."
curl -fL -o "$filename" "$package_url"
tar -zxf "$filename"
rm "$filename"
test -f "$path/package/package.json"
