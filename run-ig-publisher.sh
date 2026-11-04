#!/bin/bash
# Build the IG as the continuous integration build (releaseLabel ci-build).
# Versions are published with publish-version.sh, see RELEASING.md.
#
# Usage: ./run-ig-publisher.sh

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

function set_release_label() {
  local release_label=$1
  local sushi_config_file="sushi-config.yaml"

  if [ ! -f "$sushi_config_file" ]; then
    echo "Error: File $sushi_config_file does not exist."
    return 1
  fi

  sed -i "s/^releaseLabel: .*/releaseLabel: $release_label/g" "$sushi_config_file"
}

mkdir -p input-cache
config_backup="$(mktemp input-cache/sushi-config.XXXXXX)"
cp sushi-config.yaml "$config_backup"
trap 'cp "$config_backup" sushi-config.yaml; rm -f "$config_backup"' EXIT

./download-publisher.sh
publisher="$PWD/input-cache/publisher.jar"
# Install the build.fhir.org packages of the EBM dependencies and add them to the downloads.
./download-dependencies.sh

# Build AWMF with the SUSHI fix from FHIR/sushi#1653.
PATH="$(./install-sushi.sh):$PATH"
export PATH

# Regenerate the Jekyll data file for the page includes from the current FSH.
./update-ig-data.sh

set_release_label "ci-build"
java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -ig .

test -s output/package.tgz
./download-dependencies.sh --verify
