#!/usr/bin/env bash
# Regenerate input/data/ig.yml, the Jekyll data file (site.data.ig) that the
# page includes read (example-list-generator.md, *-reference.md), from the
# ImplementationGuide that SUSHI generates. The file is not kept in git because
# a committed copy drifted from the FSH (removed examples stayed listed).
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"

if ! command -v sushi >/dev/null 2>&1; then
  echo "sushi not found on PATH; cannot regenerate input/data/ig.yml" >&2
  exit 1
fi
sushi .

ig_json=(fsh-generated/resources/ImplementationGuide-*.json)
if [ "${#ig_json[@]}" -ne 1 ] || [ ! -f "${ig_json[0]}" ]; then
  echo "Expected exactly one fsh-generated ImplementationGuide, found: ${ig_json[*]}" >&2
  exit 1
fi
mkdir -p input/data
ruby -ryaml -rjson -e 'File.write(ARGV[1], YAML.dump(JSON.parse(File.read(ARGV[0]))))' "${ig_json[0]}" input/data/ig.yml
echo "Regenerated input/data/ig.yml from ${ig_json[0]}"
