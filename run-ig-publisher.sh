#!/bin/bash

# This bash script is used to publish an Implementation Guide (IG) using the IG Publisher tool.
#
# Usage:
#   ./run-ig-publisher.sh <targetUrl> [--ci-build]
#
# Arguments:
#   targetUrl     The canonical URL of the IG
#   --ci-build    Run as CI build (no -publish flag, releaseLabel=ci-build)
#                 Without this flag, runs as release build with -publish flag
#
# The key difference:
#   - CI build: No -publish flag → shows "continuous build" banner
#   - Release build: With -publish flag → shows "Downloaded Version X.X.X" banner

set -euo pipefail               # ← abort on any non-zero exit

cd "$(dirname "${BASH_SOURCE[0]}")"

# Parse arguments
CI_BUILD=false
targetUrl=""

for arg in "$@"; do
  case $arg in
    --ci-build)
      CI_BUILD=true
      shift
      ;;
    *)
      if [ -z "$targetUrl" ]; then
        targetUrl="$arg"
      fi
      ;;
  esac
done

if [ -z "$targetUrl" ]; then
  echo "Error: Target URL is required."
  echo "Usage: $0 <targetUrl> [--ci-build]"
  exit 1
fi

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

# Fetch and build both upstream dependencies with the same Publisher as AWMF.
./build-dependencies.sh
publisher="$PWD/input-cache/publisher.jar"

if [ "$CI_BUILD" = true ]; then
  # CI build - no -publish flag generates "continuous build" banner
  echo "Running CI build..."
  set_release_label "ci-build"
  java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -ig .
else
  # Release build - with -publish flag generates "Downloaded Version" banner
  echo "Running release build..."
  set_release_label "qa-preview"
  java -Duser.home="$HOME" -Xmx6g -jar "$publisher" -ig . -publish "$targetUrl"
fi

test -s output/package.tgz
mkdir -p output/dependencies
cp input-cache/dependency-packages/*.tgz input-cache/dependency-packages/build-info.json output/dependencies/
