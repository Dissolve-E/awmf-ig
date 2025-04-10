#!/bin/bash

# this script downloads the CI build of the EBM IG

package_version=$(grep -A1 'hl7.fhir.uv.ebm:' sushi-config.yaml | head -n1 | awk '{ print $2}')
echo "Detected package version: $package_version"

filename="package.tgz"

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

package_url="https://build.fhir.org/ig/HL7/ebm/$filename"

mkdir -p "$HOME/.fhir/packages"

path="$HOME/.fhir/packages/hl7.fhir.uv.ebm#$package_version"

# Remove path and all contents if it exists
if [ -d "$path" ]; then
    echo "Removing existing path: $path"
    rm -rf "$path"
fi

echo "Downloading to: $path"
mkdir -p "$path"
cd "$path" || exit

echo "Downloading $filename..."
curl -L -o "$filename" -s "$package_url"
tar -zxf "$filename"
rm "$filename"
