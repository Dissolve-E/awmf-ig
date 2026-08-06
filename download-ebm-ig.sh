#!/bin/bash

# This script installs the EBM IG (and EBM Incubator) packages from the
# rolling "ci-build" GitHub releases of the glichtner forks, which are built
# on FHIR R6 ballot5 with the patched IG publisher.
# It deliberately does not use the FHIR package registry or build.fhir.org
# (neither serves ballot5-based builds of these IGs).

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

install_rolling_release() {
    local repo="$1"        # e.g. glichtner/ebm
    local package_id="$2"  # e.g. hl7.fhir.uv.ebm
    local version="$3"     # cache version label, e.g. ci-build or dev

    local package_url="https://github.com/${repo}/releases/download/ci-build/package.tgz"
    local path="$HOME/.fhir/packages/${package_id}#${version}"

    echo "Installing ${package_id}#${version} from ${package_url}"
    rm -rf "$path"
    mkdir -p "$path"
    curl -fL "$package_url" | tar -xz -C "$path"
    test -f "$path/package/package.json"
}

mkdir -p "$HOME/.fhir/packages"

install_rolling_release glichtner/ebm hl7.fhir.uv.ebm ci-build
install_rolling_release glichtner/ebm-incubator hl7.fhir.uv.ebm-incubator dev
