#!/bin/bash
#
# download-publisher.sh - Download the IG Publisher JAR if not already present
#
# Downloads to input-cache/publisher.jar. Skips download if the file already exists.
#
# TEMPORARY: Uses a custom-built publisher from glichtner/fhir-ig-publisher
# to work around a bug in the official HL7 publisher.
# Revert to official publisher once the bug is fixed by replacing the curl/jq
# block below with:
#   curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar \
#       -o "$publisher" --create-dirs

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
publisher="${SCRIPT_DIR}/input-cache/publisher.jar"

if [ -f "$publisher" ]; then
    echo "IG Publisher already present: $publisher"
    exit 0
fi

echo "Downloading IG Publisher..."
mkdir -p "${SCRIPT_DIR}/input-cache"

download_url=$(curl -s https://api.github.com/repos/glichtner/fhir-ig-publisher/releases \
    | jq -r '.[0].assets[] | select(.name | test("^org\\.hl7\\.fhir\\.publisher\\.cli-.*\\.jar$")) | select(.name | test("sources|javadoc") | not) | .browser_download_url')

if [ -z "$download_url" ]; then
    echo "ERROR: Could not find publisher JAR in latest release"
    exit 1
fi

echo "Downloading from: $download_url"
curl -L "$download_url" -o "$publisher"
echo "IG Publisher ready: $publisher"
