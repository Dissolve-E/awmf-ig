#!/bin/bash
#
# publish-version.sh - Publish a versioned release of the AWMF IG
#
# This script orchestrates the publication of a specific version of the IG.
# It creates versioned directories and maintains a history of all published versions.
#
# Two publication modes are available:
#   1. Simple mode (DEFAULT, RECOMMENDED): Builds the IG and organizes output into
#      versioned directories with package-list.json and history.html generation.
#   2. -go-publish mode (EXPERIMENTAL): Uses IG Publisher's official publication
#      workflow designed for HL7 infrastructure. May not work for custom deployments.
#
# Publication modes (--mode):
#   - milestone:  Official releases that become the "current" version. Output is
#                 copied to both /{version}/ and the root directory. Recommended
#                 for stable releases (e.g., 1.0.0, 2.0.0).
#   - working:    Draft/in-progress versions. Only published to /{version}/, does
#                 not replace the current release. Use for pre-releases (e.g., 1.1.0-beta.1).
#   - technical-correction: Minor fixes to existing releases. Like working mode,
#                 published to /{version}/ only.
#
# Usage:
#   ./publish-version.sh <version> [options]
#
# Arguments:
#   version       The semantic version to publish (e.g., 1.0.0, 1.1.0-beta.1)
#
# Options:
#   --mode        Publication mode: milestone (default), working, technical-correction
#   --status      Release status: trial-use (default), draft, release, ballot
#   --release-label  User-facing release label (e.g., "STU 1", "2024 Edition", "Ballot")
#                    If not specified, derived from --status (e.g., trial-use → "STU")
#   --sequence    Release sequence name (default: "Releases")
#   --desc        Description of this release
#   --first       Mark as first publication (default: auto-detect from package-list.json)
#   --dry-run     Build but don't deploy
#   --local       Use local webroot instead of rsync to server
#   --use-go-publish  EXPERIMENTAL: Use IG Publisher's -go-publish mode
#
# Configuration is read from sushi-config.yaml (canonical, id, title).
# Requires: yq (brew install yq / snap install yq) for local runs.
#           In CI, config values can be passed via environment variables:
#           IG_CANONICAL, IG_PACKAGE_ID, IG_TITLE, IG_FHIR_VERSION
#
# Examples:
#   ./publish-version.sh 1.0.0 --mode milestone --status trial-use
#   ./publish-version.sh 1.0.0 --mode milestone --status trial-use --release-label "STU 1"
#   ./publish-version.sh 1.1.0-beta.1 --mode working --status draft --dry-run
#

set -euo pipefail

# Local directories (defined first as they're needed for config loading)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUBLICATION_DIR="${SCRIPT_DIR}/.publication"
WEBROOT="${PUBLICATION_DIR}/webroot"
TEMP_DIR="${PUBLICATION_DIR}/temp"
HISTORY_DIR="${PUBLICATION_DIR}/history"
TEMPLATES_DIR="${PUBLICATION_DIR}/templates"

# Read configuration from environment variables (set by CI) or sushi-config.yaml
SUSHI_CONFIG="${SCRIPT_DIR}/sushi-config.yaml"
if [ ! -f "$SUSHI_CONFIG" ]; then
    echo "ERROR: sushi-config.yaml not found at ${SUSHI_CONFIG}"
    exit 1
fi

# Use environment variables if set (from CI workflow), otherwise read from sushi-config.yaml
if [ -n "${IG_CANONICAL:-}" ]; then
    CANONICAL="$IG_CANONICAL"
elif command -v yq &> /dev/null; then
    CANONICAL=$(yq eval '.canonical' "$SUSHI_CONFIG")
else
    echo "ERROR: IG_CANONICAL not set and yq not available"
    exit 1
fi

if [ -n "${IG_PACKAGE_ID:-}" ]; then
    PACKAGE_ID="$IG_PACKAGE_ID"
elif command -v yq &> /dev/null; then
    PACKAGE_ID=$(yq eval '.id' "$SUSHI_CONFIG")
else
    echo "ERROR: IG_PACKAGE_ID not set and yq not available"
    exit 1
fi

if [ -n "${IG_TITLE:-}" ]; then
    # IG_TITLE is already set from environment
    :
elif command -v yq &> /dev/null; then
    IG_TITLE=$(yq eval '.title' "$SUSHI_CONFIG")
else
    echo "ERROR: IG_TITLE not set and yq not available"
    exit 1
fi

# FHIR version - used in package-list.json
if [ -n "${IG_FHIR_VERSION:-}" ]; then
    FHIR_VERSION="$IG_FHIR_VERSION"
elif command -v yq &> /dev/null; then
    FHIR_VERSION=$(yq eval '.fhirVersion' "$SUSHI_CONFIG")
else
    # Default fallback if neither env var nor yq available
    FHIR_VERSION="4.0.1"
fi

# Other configuration
CATEGORY="Clinical Practice Guidelines"
CI_BUILD="${CANONICAL}"

# Remote server config (matches existing ig-publish.yml)
REMOTE_USER="awmf_ig_publisher"
REMOTE_HOST="register.awmf.org"
REMOTE_PORT="221"
REMOTE_PATH="./${PACKAGE_ID}"

# Default values
VERSION=""
MODE="milestone"
STATUS="trial-use"
RELEASE_LABEL=""  # User-facing label (e.g., "STU 1", "Ballot", "2024 Edition")
SEQUENCE="Releases"
DESC=""
FIRST="auto"
DRY_RUN="false"
LOCAL_ONLY="false"
USE_GO_PUBLISH="false"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

usage() {
    head -40 "$0" | grep -E "^#" | sed 's/^# \?//'
    exit 1
}

parse_args() {
    if [ $# -eq 0 ]; then
        usage
    fi

    VERSION="$1"
    shift

    while [[ $# -gt 0 ]]; do
        case $1 in
            --mode)
                MODE="$2"
                shift 2
                ;;
            --status)
                STATUS="$2"
                shift 2
                ;;
            --release-label)
                RELEASE_LABEL="$2"
                shift 2
                ;;
            --sequence)
                SEQUENCE="$2"
                shift 2
                ;;
            --desc)
                DESC="$2"
                shift 2
                ;;
            --first)
                FIRST="true"
                shift
                ;;
            --dry-run)
                DRY_RUN="true"
                shift
                ;;
            --local)
                LOCAL_ONLY="true"
                shift
                ;;
            --use-go-publish)
                USE_GO_PUBLISH="true"
                shift
                ;;
            --help|-h)
                usage
                ;;
            *)
                log_error "Unknown option: $1"
                usage
                ;;
        esac
    done

    # Override from environment variables if set (used by CI workflow)
    # This avoids shell quoting issues when passing args through Docker
    [ -n "${PUB_MODE:-}" ] && MODE="$PUB_MODE"
    [ -n "${PUB_STATUS:-}" ] && STATUS="$PUB_STATUS"
    [ -n "${PUB_SEQUENCE:-}" ] && SEQUENCE="$PUB_SEQUENCE"
    [ -n "${PUB_RELEASE_LABEL:-}" ] && RELEASE_LABEL="$PUB_RELEASE_LABEL"
    [ -n "${PUB_DESCRIPTION:-}" ] && DESC="$PUB_DESCRIPTION"
    [ "${PUB_FIRST:-}" = "true" ] && FIRST="true"
    [ "${PUB_USE_GO_PUBLISH:-}" = "true" ] && USE_GO_PUBLISH="true"

    # Validate version format
    if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[a-zA-Z0-9.]+)?$ ]]; then
        log_error "Invalid version format: $VERSION"
        log_error "Expected format: X.Y.Z or X.Y.Z-prerelease"
        exit 1
    fi

    # Validate mode
    if [[ ! "$MODE" =~ ^(working|milestone|technical-correction)$ ]]; then
        log_error "Invalid mode: $MODE"
        log_error "Valid modes: working, milestone, technical-correction"
        exit 1
    fi

    # Auto-detect first publication
    if [ "$FIRST" = "auto" ]; then
        if [ -f "${SCRIPT_DIR}/package-list.json" ]; then
            # Check if there are any non-ci-build versions
            PUBLISHED_COUNT=$(jq '[.list[] | select(.status != "ci-build")] | length' "${SCRIPT_DIR}/package-list.json")
            if [ "$PUBLISHED_COUNT" -eq 0 ]; then
                FIRST="true"
            else
                FIRST="false"
            fi
        else
            FIRST="true"
        fi
    fi

    # Set default description
    if [ -z "$DESC" ]; then
        if [ "$FIRST" = "true" ]; then
            DESC="Initial release of the AWMF Guideline Registry Implementation Guide"
        else
            DESC="Release version ${VERSION}"
        fi
    fi

    # Set default release label if not specified
    # The releaseLabel is a user-facing text shown at the top of pages
    # See: https://hl7.org/fhir/tools/0.9.0/CodeSystem-ig-parameters.html
    if [ -z "$RELEASE_LABEL" ]; then
        case "$STATUS" in
            draft)
                RELEASE_LABEL="Draft"
                ;;
            ballot)
                RELEASE_LABEL="Ballot"
                ;;
            trial-use)
                RELEASE_LABEL="STU"
                ;;
            release|normative)
                RELEASE_LABEL="Release"
                ;;
            *)
                RELEASE_LABEL="$STATUS"
                ;;
        esac
    fi

    log_info "Configuration:"
    log_info "  Version:       $VERSION"
    log_info "  Mode:          $MODE"
    log_info "  Status:        $STATUS"
    log_info "  Release Label: $RELEASE_LABEL"
    log_info "  Sequence:      $SEQUENCE"
    log_info "  First:         $FIRST"
    log_info "  Dry-run:       $DRY_RUN"
}

setup_directories() {
    log_info "Setting up publication directories..."
    
    mkdir -p "$WEBROOT"
    mkdir -p "$TEMP_DIR"
    mkdir -p "$HISTORY_DIR"
    mkdir -p "$TEMPLATES_DIR"

    # Create default history templates if they don't exist
    if [ ! -f "${TEMPLATES_DIR}/header.template" ]; then
        cat > "${TEMPLATES_DIR}/header.template" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{title}} - Publication History</title>
  <link rel="stylesheet" href="fhir.css"/>
</head>
<body>
EOF
    fi

    if [ ! -f "${TEMPLATES_DIR}/index.template" ]; then
        cat > "${TEMPLATES_DIR}/index.template" << 'EOF'
<h1>{{title}}</h1>
<p>{{introduction}}</p>
<h2>Publication History</h2>
EOF
    fi

    if [ ! -f "${TEMPLATES_DIR}/postamble.template" ]; then
        cat > "${TEMPLATES_DIR}/postamble.template" << 'EOF'
</body>
</html>
EOF
    fi
}

create_publication_request() {
    log_info "Creating publication-request.json..."
    
    local pub_request="${SCRIPT_DIR}/publication-request.json"
    local path="${CANONICAL}/${VERSION}"
    
    if [ "$FIRST" = "true" ]; then
        cat > "$pub_request" << EOF
{
  "package-id": "${PACKAGE_ID}",
  "version": "${VERSION}",
  "path": "${path}",
  "mode": "${MODE}",
  "status": "${STATUS}",
  "sequence": "${SEQUENCE}",
  "desc": "${DESC}",
  "first": true,
  "title": "${IG_TITLE}",
  "ci-build": "${CI_BUILD}",
  "category": "${CATEGORY}",
  "introduction": "This implementation guide defines FHIR profiles for German clinical practice guidelines, enabling structured, FAIR, and interoperable representation."
}
EOF
    else
        cat > "$pub_request" << EOF
{
  "package-id": "${PACKAGE_ID}",
  "version": "${VERSION}",
  "path": "${path}",
  "mode": "${MODE}",
  "status": "${STATUS}",
  "sequence": "${SEQUENCE}",
  "desc": "${DESC}",
  "first": false
}
EOF
    fi
    
    log_info "Created publication-request.json"
    cat "$pub_request"
}

update_sushi_config() {
    log_info "Updating sushi-config.yaml with version ${VERSION}..."

    local sushi_config="${SCRIPT_DIR}/sushi-config.yaml"

    # Update version
    sed -i.bak "s/^version: .*/version: ${VERSION}/" "$sushi_config"

    # Update releaseLabel - use the configured RELEASE_LABEL
    # This is the user-facing label shown at the top of published pages
    sed -i.bak "s/^releaseLabel: .*/releaseLabel: ${RELEASE_LABEL}/" "$sushi_config"
    rm -f "${sushi_config}.bak"

    log_info "Updated sushi-config.yaml (version: ${VERSION}, releaseLabel: ${RELEASE_LABEL})"
}

download_publisher() {
    log_info "Ensuring IG Publisher is available..."
    
    local publisher="${SCRIPT_DIR}/input-cache/publisher.jar"
    
    if [ ! -f "$publisher" ]; then
        log_info "Downloading IG Publisher..."
        mkdir -p "${SCRIPT_DIR}/input-cache"
        curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar \
            -o "$publisher"
    fi
    
    log_info "IG Publisher ready: $publisher"
}

download_dependencies() {
    log_info "Downloading EBM IG dependency..."
    "${SCRIPT_DIR}/download-ebm-ig.sh"
}

run_go_publish() {
    log_info "Running IG Publisher in -go-publish mode..."

    local publisher="${SCRIPT_DIR}/input-cache/publisher.jar"
    local source_package_list="${SCRIPT_DIR}/package-list.json"
    local backup_package_list="${PUBLICATION_DIR}/package-list.json.backup"
    local venv_dir="${SCRIPT_DIR}/.venv"
    # IMPORTANT: Backup location must be OUTSIDE the source directory tree
    # because -go-publish copies the entire source directory to temp
    local backup_venv_dir="/tmp/awmf-ig-venv-backup-$$"

    # Track what we've backed up for the trap handler
    local backed_up_package_list="false"
    local backed_up_venv="false"

    # Setup the complete publication environment required by -go-publish
    setup_go_publish_environment

    # Fetch existing webroot from server if not local-only and webroot is empty
    # Skip in CI - the workflow handles fetching before Docker runs (Docker doesn't have SSH access)
    if [ "$LOCAL_ONLY" = "false" ] && [ "${CI:-}" != "true" ] && [ -z "$(ls -A "$WEBROOT" 2>/dev/null)" ]; then
        log_info "Fetching existing publications from server..."
        fetch_existing_publications || log_warn "Could not fetch existing publications (this may be the first publication)"
    fi

    # STEP 1: Build the IG first (required before -go-publish)
    # -go-publish expects the IG to already be built with output/ and output/qa.json
    log_info "Building IG before publication..."
    java -Xmx6g -jar "$publisher" -ig "$SCRIPT_DIR" -publish "${CANONICAL}"

    if [ ! -f "${SCRIPT_DIR}/output/qa.json" ]; then
        log_error "IG build failed - output/qa.json not found"
        return 1
    fi
    log_info "IG build completed successfully"

    # IMPORTANT: -go-publish mode requires that package-list.json does NOT exist in the source directory
    # The IG Publisher manages package-list.json in the webroot, not in source
    # We temporarily move it out of the way and restore it afterward (for version control)
    if [ -f "$source_package_list" ]; then
        log_info "Temporarily moving package-list.json out of source directory..."
        mv "$source_package_list" "$backup_package_list"
        backed_up_package_list="true"
    fi

    # IMPORTANT: -go-publish tries to zip the entire source directory including .venv
    # Python virtual environments contain symlinks that cause "Case mismatch" errors
    # on case-insensitive filesystems (macOS). Move .venv out temporarily.
    if [ -d "$venv_dir" ]; then
        log_info "Temporarily moving .venv out of source directory..."
        mv "$venv_dir" "$backup_venv_dir"
        backed_up_venv="true"
    fi

    # Set up a trap to restore package-list.json and .venv even if the script fails
    # Use the tracking variables to know what to restore
    trap '
        if [ "$backed_up_package_list" = "true" ] && [ -f "$backup_package_list" ]; then
            mv "$backup_package_list" "$source_package_list" 2>/dev/null || true
        fi
        if [ "$backed_up_venv" = "true" ] && [ -d "$backup_venv_dir" ]; then
            mv "$backup_venv_dir" "$venv_dir" 2>/dev/null || true
        fi
    ' EXIT

    # STEP 2: Run the IG Publisher with -go-publish to organize output
    log_info "Executing IG Publisher -go-publish..."
    java -Xmx6g -jar "$publisher" -go-publish \
        -source "$SCRIPT_DIR" \
        -web "$WEBROOT" \
        -history "$HISTORY_DIR" \
        -registry "${WEBROOT}/fhir-ig-list.json" \
        -temp "$TEMP_DIR" \
        -templates "$TEMPLATES_DIR"

    local exit_code=$?

    # Copy updated package-list.json from webroot to source directory (for version control)
    # The -go-publish updates/creates package-list.json in the webroot
    local webroot_package_list="${WEBROOT}/${PACKAGE_ID}/package-list.json"
    if [ -f "$webroot_package_list" ]; then
        log_info "Copying updated package-list.json from webroot to source..."
        cp "$webroot_package_list" "$source_package_list"
        backed_up_package_list="false"
        # Remove the backup since we have the updated version
        rm -f "$backup_package_list"
    elif [ "$backed_up_package_list" = "true" ] && [ -f "$backup_package_list" ]; then
        # Fallback: restore backup if webroot doesn't have package-list.json
        log_warn "No package-list.json in webroot, restoring backup..."
        mv "$backup_package_list" "$source_package_list"
        backed_up_package_list="false"
    fi

    # Restore .venv to source directory
    if [ "$backed_up_venv" = "true" ] && [ -d "$backup_venv_dir" ]; then
        log_info "Restoring .venv to source directory..."
        mv "$backup_venv_dir" "$venv_dir"
        backed_up_venv="false"
    fi

    # Remove the trap
    trap - EXIT

    if [ $exit_code -ne 0 ]; then
        log_error "IG Publisher -go-publish failed with exit code $exit_code"
        return $exit_code
    fi

    # Copy history assets to webroot (IG Publisher doesn't always do this)
    copy_history_assets

    # For non-milestone modes, ensure there's a redirect to ci-build if no milestone exists
    if [ "$MODE" != "milestone" ]; then
        create_ci_build_redirect
    fi

    log_info "IG Publisher -go-publish completed"
}

# Copy history template assets to the IG webroot
# The history.html page requires these assets to render properly
copy_history_assets() {
    local ig_webroot="${WEBROOT}/${PACKAGE_ID}"
    
    if [ ! -d "$ig_webroot" ]; then
        log_warn "IG webroot not found at ${ig_webroot}, skipping history assets copy"
        return
    fi
    
    log_info "Copying history template assets to IG webroot..."
    
    # Copy directories
    if [ -d "${HISTORY_DIR}/assets-hist" ]; then
        cp -r "${HISTORY_DIR}/assets-hist" "${ig_webroot}/"
    fi
    
    if [ -d "${HISTORY_DIR}/dist-hist" ]; then
        cp -r "${HISTORY_DIR}/dist-hist" "${ig_webroot}/"
    fi
    
    # Copy CSS and JS files
    for file in history.css jquery-ui.css jquery-ui.js; do
        if [ -f "${HISTORY_DIR}/${file}" ]; then
            cp "${HISTORY_DIR}/${file}" "${ig_webroot}/"
        fi
    done
    
    log_info "History assets copied"
}

# Setup the complete publication environment required by -go-publish mode
# Based on: https://build.fhir.org/ig/ElliotSilver/how-to-publish/setup.html
setup_go_publish_environment() {
    log_info "Setting up -go-publish publication environment..."
    
    # 1. Clone or update the history templates if not present
    if [ ! -f "${HISTORY_DIR}/template/history.html" ]; then
        log_info "Downloading IG history templates..."
        local history_repo="https://github.com/HL7/fhir-ig-history-template/archive/refs/heads/master.zip"
        local temp_zip="${PUBLICATION_DIR}/history-template.zip"
        
        curl -L "$history_repo" -o "$temp_zip"
        unzip -o "$temp_zip" -d "$PUBLICATION_DIR"
        
        # Move contents to history directory
        rm -rf "${HISTORY_DIR:?}/"*
        mv "${PUBLICATION_DIR}/fhir-ig-history-template-master/"* "$HISTORY_DIR/"
        rm -rf "${PUBLICATION_DIR}/fhir-ig-history-template-master" "$temp_zip"
        
        log_info "History templates installed"
    fi
    
    # 2. Download web templates if templates directory is empty
    if [ ! -f "${TEMPLATES_DIR}/header.template" ] || [ ! -f "${TEMPLATES_DIR}/preamble.template" ]; then
        log_info "Downloading web templates..."
        local templates_repo="https://github.com/HL7/fhir-web-templates/archive/refs/heads/main.zip"
        local temp_zip="${PUBLICATION_DIR}/web-templates.zip"
        
        curl -L "$templates_repo" -o "$temp_zip"
        unzip -o "$temp_zip" -d "$PUBLICATION_DIR"
        
        # Copy all template files (*.template and *.html) to templates directory
        cp "${PUBLICATION_DIR}/fhir-web-templates-main/"*.template "${TEMPLATES_DIR}/" 2>/dev/null || true
        cp "${PUBLICATION_DIR}/fhir-web-templates-main/"*.html "${TEMPLATES_DIR}/" 2>/dev/null || true
        rm -rf "${PUBLICATION_DIR}/fhir-web-templates-main" "$temp_zip"
        
        # Customize templates for AWMF
        customize_templates
        
        log_info "Web templates installed"
    fi
    
    # 3. Create publish-setup.json with proper structure
    log_info "Creating publish-setup.json..."
    local base_url="${CANONICAL%/*}"  # http://fhir.awmf.org
    cat > "${WEBROOT}/publish-setup.json" << EOF
{
  "website": {
    "style": "fhir.layout",
    "url": "${base_url}",
    "server": "apache",
    "org": "AWMF e.V.",
    "search-template": "searchform.template.html",
    "index-template": "index.template",
    "clone-xml-json": true,
    "no-registry": true
  },
  "feeds": {
    "package": "package-feed.xml",
    "publication": "publication-feed.xml"
  },
  "layout-rules": [
    {
      "npm": "${PACKAGE_ID}",
      "canonical": "${CANONICAL}",
      "destination": "/${PACKAGE_ID}"
    },
    {
      "npm": "awmf.*",
      "canonical": "${base_url}/{npm.1}",
      "destination": "/{npm.1}"
    }
  ]
}
EOF
    
    # 4. Create RSS feed files
    local build_date=$(date -R)
    
    if [ ! -f "${WEBROOT}/publication-feed.xml" ]; then
        log_info "Creating publication-feed.xml..."
        cat > "${WEBROOT}/publication-feed.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:content="http://purl.org/rss/1.0/modules/content/"
     xmlns:fhir="http://hl7.org/fhir/feed"
     xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
  <channel>
    <title>AWMF FHIR Implementation Guides</title>
    <description>FHIR Implementation Guides published by AWMF e.V.</description>
    <link>${base_url}</link>
    <generator>AWMF e.V.</generator>
    <lastBuildDate>${build_date}</lastBuildDate>
    <atom:link href="${base_url}/publication-feed.xml" rel="self" type="application/rss+xml"/>
    <pubDate>${build_date}</pubDate>
    <language>en</language>
    <ttl>600</ttl>
    <item>
    </item>
  </channel>
</rss>
EOF
    fi
    
    if [ ! -f "${WEBROOT}/package-feed.xml" ]; then
        log_info "Creating package-feed.xml..."
        cat > "${WEBROOT}/package-feed.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:content="http://purl.org/rss/1.0/modules/content/"
     xmlns:fhir="http://hl7.org/fhir/feed"
     xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
  <channel>
    <title>AWMF FHIR Implementation Guide Packages</title>
    <description>FHIR packages for Implementation Guides published by AWMF e.V.</description>
    <link>${base_url}</link>
    <generator>AWMF e.V.</generator>
    <lastBuildDate>${build_date}</lastBuildDate>
    <atom:link href="${base_url}/package-feed.xml" rel="self" type="application/rss+xml"/>
    <pubDate>${build_date}</pubDate>
    <language>en</language>
    <ttl>600</ttl>
    <item>
    </item>
  </channel>
</rss>
EOF
    fi
    
    # 5. Generate package-registry.json
    if [ ! -f "${WEBROOT}/package-registry.json" ]; then
        log_info "Generating package-registry.json..."
        java -jar "$publisher" -generate-package-registry "$WEBROOT" 2>/dev/null || \
            echo '{"packages":[]}' > "${WEBROOT}/package-registry.json"
    fi
    
    # 6. Create a dummy fhir-ig-list.json (ig-registry) for -go-publish
    # This is needed because -go-publish requires -registry parameter
    # but we're not publishing to the official FHIR registry
    if [ ! -f "${WEBROOT}/fhir-ig-list.json" ]; then
        log_info "Creating local fhir-ig-list.json..."
        cat > "${WEBROOT}/fhir-ig-list.json" << EOF
{
  "guides": []
}
EOF
    fi
    
    # 7. Create the IG destination directory with initial package-list.json
    # For first publication, the IG Publisher expects an initial package-list.json in destination
    local ig_dest="${WEBROOT}/${PACKAGE_ID}"
    
    if [ ! -d "$ig_dest" ]; then
        log_info "Creating IG destination directory: ${ig_dest}"
        mkdir -p "$ig_dest"
    fi
    
    if [ ! -f "${ig_dest}/package-list.json" ]; then
        log_info "Creating initial package-list.json in destination..."
        cat > "${ig_dest}/package-list.json" << EOF
{
  "package-id": "${PACKAGE_ID}",
  "title": "${IG_TITLE}",
  "canonical": "${CANONICAL}",
  "introduction": "This implementation guide defines FHIR profiles for German clinical practice guidelines, enabling structured, FAIR, and interoperable representation.",
  "category": "${CATEGORY}",
  "list": [
    {
      "version": "current",
      "desc": "Continuous Integration Build (latest in version control)",
      "path": "${CI_BUILD}",
      "status": "ci-build",
      "current": true
    }
  ]
}
EOF
    fi
    
    log_info "Publication environment setup complete"
}

# Use the standard HL7 web templates for history page
# These templates are included in the fhir-ig-history-template and contain
# all required elements (id="ig-title", id="ig-footer") for history.js
customize_templates() {
    log_info "Setting up web templates from HL7 history template..."
    
    # Copy the HL7 templates directly - they have all required elements
    if [ -d "${HISTORY_DIR}/hl7" ]; then
        cp "${HISTORY_DIR}/hl7/header.template" "${TEMPLATES_DIR}/"
        cp "${HISTORY_DIR}/hl7/preamble.template" "${TEMPLATES_DIR}/"
        cp "${HISTORY_DIR}/hl7/postamble.template" "${TEMPLATES_DIR}/"
        log_info "HL7 templates copied to ${TEMPLATES_DIR}"
    else
        log_warn "HL7 templates not found in ${HISTORY_DIR}/hl7, history page may not render correctly"
    fi
}

# Create a redirect page at the root when no milestone has been published yet
# This redirects users to the ci-build until a proper release is made
create_ci_build_redirect() {
    local ig_webroot="${WEBROOT}/${PACKAGE_ID}"
    local redirect_file="${ig_webroot}/index.html"

    # Only create redirect if no milestone version exists at root
    # Check if there's already a proper IG index (not a template/redirect)
    if [ -f "$redirect_file" ]; then
        # Check if it's already a real IG page (contains ImplementationGuide) vs a template/redirect
        if grep -q "ImplementationGuide\|ig-title" "$redirect_file" 2>/dev/null; then
            log_info "Root already has a published IG, not creating redirect"
            return 0
        fi
    fi

    log_info "Creating ci-build redirect at root (no milestone published yet)..."

    mkdir -p "$ig_webroot"
    cat > "$redirect_file" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="0; url=ci-build/index.html">
    <title>${IG_TITLE} - Redirecting...</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; max-width: 600px; margin: 50px auto; padding: 20px; text-align: center; }
        h1 { color: #333; }
        a { color: #0066cc; }
        .note { background: #f5f5f5; padding: 15px; border-radius: 5px; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>${IG_TITLE}</h1>
    <p>Redirecting to the current development build...</p>
    <p>If you are not redirected automatically, <a href="ci-build/index.html">click here</a>.</p>
    <div class="note">
        <p><strong>Note:</strong> No official release has been published yet.</p>
        <p>View the <a href="history.html">publication history</a> for available versions.</p>
    </div>
</body>
</html>
EOF

    log_info "Created ci-build redirect at ${redirect_file}"
}

# Alternative: Simple build + manual directory organization
# Use this if -go-publish doesn't work well in CI
run_simple_publish() {
    log_info "Running simple publication build..."
    
    local publisher="${SCRIPT_DIR}/input-cache/publisher.jar"
    
    # Build the IG with -publish flag
    java -Xmx6g -jar "$publisher" -ig "$SCRIPT_DIR" -publish "${CANONICAL}"
    
    # Create version directory structure
    local version_dir="${WEBROOT}/${VERSION}"
    mkdir -p "$version_dir"
    
    # Copy output to version directory
    cp -r "${SCRIPT_DIR}/output/"* "$version_dir/"
    
    # Update publish box in version directory
    update_publish_box "$version_dir" "$VERSION" "false"
    
    # If milestone mode, also copy to root (current version)
    if [ "$MODE" = "milestone" ]; then
        cp -r "${SCRIPT_DIR}/output/"* "${WEBROOT}/"
        # Update publish box in root to show as current
        update_publish_box "${WEBROOT}" "$VERSION" "true"
    else
        # For non-milestone modes, create a redirect to ci-build if no milestone exists
        create_ci_build_redirect
    fi

    # Update package-list.json
    update_package_list
    
    # Generate history page
    generate_history_page
    
    log_info "Simple publication completed"
}

# Update the publish box in all HTML files to show proper version info
update_publish_box() {
    local target_dir="$1"
    local version="$2"
    local is_current="$3"
    
    log_info "Updating publish box in ${target_dir}..."
    
    # Determine the status label
    local status_label
    case "$STATUS" in
        draft)
            status_label="Draft"
            ;;
        ballot)
            status_label="Ballot"
            ;;
        trial-use)
            status_label="STU"
            ;;
        release|normative)
            status_label="Release"
            ;;
        *)
            status_label="Version"
            ;;
    esac
    
    # Build the replacement text
    local version_text
    if [ "$is_current" = "true" ]; then
        version_text="${status_label} ${version}"
    else
        version_text="${status_label} ${version}"
    fi
    
    # The publish box looks like:
    # "Dissolve-E: FHIR Implementation Guide for the AWMF Guideline Registry - Downloaded Version 1.0.0 See the..."
    # We want to replace "Downloaded Version X.Y.Z" with "STU X.Y.Z" or similar
    
    # Find and replace using perl for cross-platform compatibility
    local file_count=0
    while IFS= read -r -d '' html_file; do
        if grep -q "Downloaded Version" "$html_file" 2>/dev/null; then
            perl -i -pe "s/Downloaded Version ${version}/\Q${version_text}\E/g" "$html_file"
            ((file_count++)) || true
        fi
    done < <(find "$target_dir" -name "*.html" -type f -print0)
    
    log_info "Publish box updated to '${version_text}' in ${file_count} files"
}

update_package_list() {
    log_info "Updating package-list.json..."

    local package_list="${SCRIPT_DIR}/package-list.json"
    local pub_date=$(date +%Y-%m-%d)

    # Create new version entry
    local new_entry=$(cat << EOF
{
  "version": "${VERSION}",
  "date": "${pub_date}",
  "desc": "${DESC}",
  "path": "${CANONICAL}/${VERSION}",
  "status": "${STATUS}",
  "sequence": "${SEQUENCE}",
  "fhirversion": "${FHIR_VERSION}",
  "current": $([ "$MODE" = "milestone" ] && echo "true" || echo "false")
}
EOF
)
    
    # Check if version already exists
    local exists=$(jq --arg v "$VERSION" '[.list[] | select(.version == $v)] | length' "$package_list")
    
    if [ "$exists" -gt 0 ]; then
        log_warn "Version ${VERSION} already exists in package-list.json, updating..."
        # Update existing entry
        jq --argjson entry "$new_entry" --arg v "$VERSION" \
            '.list = [.list[] | if .version == $v then $entry else . end]' \
            "$package_list" > "${package_list}.tmp" && mv "${package_list}.tmp" "$package_list"
    else
        # Insert new entry after ci-build entry
        jq --argjson entry "$new_entry" \
            '.list = [.list[0]] + [$entry] + .list[1:]' \
            "$package_list" > "${package_list}.tmp" && mv "${package_list}.tmp" "$package_list"
    fi
    
    # If milestone, update current flags
    if [ "$MODE" = "milestone" ]; then
        jq --arg v "$VERSION" \
            '.list = [.list[] | if .version == "current" then . elif .version == $v then .current = true else .current = false end]' \
            "$package_list" > "${package_list}.tmp" && mv "${package_list}.tmp" "$package_list"
    fi
    
    # Copy to webroot
    cp "$package_list" "${WEBROOT}/package-list.json"
    
    log_info "Updated package-list.json"
}

generate_history_page() {
    log_info "Generating history.html..."
    
    local package_list="${SCRIPT_DIR}/package-list.json"
    local history_file="${WEBROOT}/history.html"
    local title=$(jq -r '.title' "$package_list")
    local intro=$(jq -r '.introduction' "$package_list")
    
    cat > "$history_file" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - Publication History</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; max-width: 900px; margin: 0 auto; padding: 20px; }
        h1 { color: #333; border-bottom: 2px solid #0066cc; padding-bottom: 10px; }
        h2 { color: #666; margin-top: 30px; }
        .intro { background: #f5f5f5; padding: 15px; border-radius: 5px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #0066cc; color: white; }
        tr:hover { background: #f5f5f5; }
        .status { padding: 3px 8px; border-radius: 3px; font-size: 0.85em; }
        .status-ci-build { background: #ffd700; color: #333; }
        .status-draft { background: #ccc; color: #333; }
        .status-trial-use { background: #90EE90; color: #333; }
        .status-release { background: #0066cc; color: white; }
        .status-ballot { background: #ffa500; color: #333; }
        .current { font-weight: bold; }
        a { color: #0066cc; }
    </style>
</head>
<body>
    <h1>${title}</h1>
    <div class="intro">
        <p>${intro}</p>
    </div>
    
    <h2>Current Versions</h2>
    <table>
        <thead>
            <tr>
                <th>Version</th>
                <th>Date</th>
                <th>Status</th>
                <th>Sequence</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
EOF
    
    # Add current versions (ci-build and current release)
    jq -r '.list[] | select(.current == true) | @json' "$package_list" | while read -r entry; do
        local v=$(echo "$entry" | jq -r '.version')
        local d=$(echo "$entry" | jq -r '.date // "continuous"')
        local s=$(echo "$entry" | jq -r '.status')
        local seq=$(echo "$entry" | jq -r '.sequence // "-"')
        local desc=$(echo "$entry" | jq -r '.desc')
        local path=$(echo "$entry" | jq -r '.path')
        
        cat >> "$history_file" << EOF
            <tr class="current">
                <td><a href="${path}">${v}</a></td>
                <td>${d}</td>
                <td><span class="status status-${s}">${s}</span></td>
                <td>${seq}</td>
                <td>${desc}</td>
            </tr>
EOF
    done
    
    cat >> "$history_file" << EOF
        </tbody>
    </table>
    
    <h2>All Versions</h2>
    <table>
        <thead>
            <tr>
                <th>Version</th>
                <th>Date</th>
                <th>Status</th>
                <th>Sequence</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
EOF
    
    # Add all versions
    jq -r '.list[] | @json' "$package_list" | while read -r entry; do
        local v=$(echo "$entry" | jq -r '.version')
        local d=$(echo "$entry" | jq -r '.date // "continuous"')
        local s=$(echo "$entry" | jq -r '.status')
        local seq=$(echo "$entry" | jq -r '.sequence // "-"')
        local desc=$(echo "$entry" | jq -r '.desc')
        local path=$(echo "$entry" | jq -r '.path')
        local current=$(echo "$entry" | jq -r '.current // false')
        local row_class=$([ "$current" = "true" ] && echo "current" || echo "")
        
        cat >> "$history_file" << EOF
            <tr class="${row_class}">
                <td><a href="${path}">${v}</a></td>
                <td>${d}</td>
                <td><span class="status status-${s}">${s}</span></td>
                <td>${seq}</td>
                <td>${desc}</td>
            </tr>
EOF
    done
    
    cat >> "$history_file" << EOF
        </tbody>
    </table>
    
    <footer style="margin-top: 40px; padding-top: 20px; border-top: 1px solid #ddd; color: #666; font-size: 0.9em;">
        <p>Generated on $(date '+%Y-%m-%d %H:%M:%S %Z')</p>
        <p>Published by <a href="https://www.awmf.org">AWMF e.V.</a></p>
    </footer>
</body>
</html>
EOF
    
    log_info "Generated history.html"
}

fetch_existing_publications() {
    log_info "Fetching existing publications from server..."
    
    local ssh_key="${SSH_KEY_PATH:-}"
    
    if [ -n "$ssh_key" ]; then
        rsync -av --ignore-existing \
            -e "ssh -p ${REMOTE_PORT} -i ${ssh_key}" \
            "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/" \
            "${WEBROOT}/"
    else
        log_warn "SSH_KEY_PATH not set, skipping fetch of existing publications"
        return 1
    fi
}

deploy_to_server() {
    if [ "$DRY_RUN" = "true" ]; then
        log_info "Dry-run mode: skipping deployment"
        log_info "Built content is available at: ${WEBROOT}"
        return 0
    fi
    
    if [ "$LOCAL_ONLY" = "true" ]; then
        log_info "Local-only mode: skipping remote deployment"
        log_info "Built content is available at: ${WEBROOT}"
        return 0
    fi

    # In CI, the workflow handles deployment after Docker runs (Docker doesn't have SSH access)
    if [ "${CI:-}" = "true" ]; then
        log_info "CI mode: skipping deployment (workflow handles this step)"
        log_info "Built content is available at: ${WEBROOT}"
        return 0
    fi

    log_info "Deploying to ${REMOTE_HOST}..."
    
    local ssh_key="${SSH_KEY_PATH:-/tmp/awmf_ig_publisher.id_ed25519}"
    
    if [ ! -f "$ssh_key" ]; then
        log_error "SSH key not found at: ${ssh_key}"
        log_error "Set SSH_KEY_PATH environment variable or use --local mode"
        exit 1
    fi
    
    # Exclude ci-build/ as it's managed separately by the CI workflow
    rsync -av --delete --exclude 'ci-build/' \
        -e "ssh -p ${REMOTE_PORT} -i ${ssh_key}" \
        "${WEBROOT}/" \
        "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/"
    
    log_info "Deployment completed!"
    log_info "Published to: ${CANONICAL}"
    log_info "Version URL:  ${CANONICAL}/${VERSION}"
}

cleanup_publication_request() {
    log_info "Cleaning up publication-request.json..."
    rm -f "${SCRIPT_DIR}/publication-request.json"
}

main() {
    parse_args "$@"
    setup_directories
    
    # Save original sushi-config for restoration
    cp "${SCRIPT_DIR}/sushi-config.yaml" "${SCRIPT_DIR}/sushi-config.yaml.orig"
    
    # Trap to restore on failure
    trap 'mv "${SCRIPT_DIR}/sushi-config.yaml.orig" "${SCRIPT_DIR}/sushi-config.yaml" 2>/dev/null; cleanup_publication_request' EXIT
    
    create_publication_request
    update_sushi_config
    download_publisher
    download_dependencies
    
    # Choose publication method
    if [ "$USE_GO_PUBLISH" = "true" ]; then
        log_info "Using IG Publisher -go-publish mode (official HL7 approach)"
        run_go_publish
    else
        log_info "Using simple publish mode"
        run_simple_publish
    fi
    
    deploy_to_server
    
    # Keep the updated sushi-config if successful
    rm -f "${SCRIPT_DIR}/sushi-config.yaml.orig"
    trap - EXIT
    cleanup_publication_request
    
    log_info "========================================="
    log_info "Publication complete!"
    log_info "Version ${VERSION} published to:"
    log_info "  ${CANONICAL}/${VERSION}"
    if [ "$MODE" = "milestone" ]; then
        log_info "  ${CANONICAL} (current)"
    fi
    log_info "========================================="
}

main "$@"
