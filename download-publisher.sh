#!/bin/bash
#
# download-publisher.sh - Download the IG Publisher JAR if not already present
#
# Downloads to input-cache/publisher.jar. Skips download if the file already exists.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
publisher="${SCRIPT_DIR}/input-cache/publisher.jar"

if [ -f "$publisher" ]; then
    echo "IG Publisher already present: $publisher"
    exit 0
fi

echo "Downloading IG Publisher..."
mkdir -p "${SCRIPT_DIR}/input-cache"

download_url="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"

echo "Downloading from: $download_url"
curl -L "$download_url" -o "$publisher"
echo "IG Publisher ready: $publisher"
