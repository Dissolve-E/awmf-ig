#!/usr/bin/env bash
# Install SUSHI 3.21.0 with the fix from FHIR/sushi#1653: a slice that constrains an
# extension copied from its slicing entry keeps the extension's profile in the
# differential. Prints the directory that contains the sushi command.
# Remove this script once a SUSHI release contains the fix.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repository_url="https://github.com/glichtner/sushi"
commit="e8e9d15d8ebb81489143c94a6440d2e9fedee434"
install_dir="$script_dir/input-cache/sushi/$commit"
bin_dir="$install_dir/bin"

if [[ ! -x "$bin_dir/sushi" ]]; then
  echo "Building SUSHI from $repository_url at $commit" >&2
  rm -rf "$install_dir"
  source_dir="$install_dir/source"
  git init --quiet "$source_dir"
  git -C "$source_dir" fetch --quiet --depth 1 "$repository_url" "$commit"
  git -C "$source_dir" checkout --quiet FETCH_HEAD
  # npm ci runs the prepare script, which builds dist/.
  (cd "$source_dir" && npm ci --no-audit --no-fund --loglevel=error >&2 &&
    npm prune --omit=dev --no-audit --no-fund --loglevel=error >&2)
  mkdir -p "$bin_dir"
  # Write the command last: its presence marks a complete installation.
  cat > "$bin_dir/sushi.tmp" <<'EOF'
#!/usr/bin/env bash
exec node "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/../source/dist/app.js" "$@"
EOF
  chmod +x "$bin_dir/sushi.tmp"
  mv "$bin_dir/sushi.tmp" "$bin_dir/sushi"
fi

echo "Using $("$bin_dir/sushi" --version | tail -n 1), built from $repository_url at $commit" >&2
echo "$bin_dir"
