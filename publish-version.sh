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
# Usage:
#   ./publish-version.sh <version> [options]
#
# Arguments:
#   version       The semantic version to publish (e.g., 1.0.0, 1.1.0-beta.1)
#
# Options:
#   --mode        Publication mode: milestone (default), working, technical-correction
#   --status      Release status: trial-use (default), draft, release, ballot
#   --sequence    Release sequence name (default: "Releases")
#   --desc        Description of this release
#   --first       Set to 'true' for first publication (default: auto-detect)
#   --dry-run     Build but don't deploy
#   --local       Use local webroot instead of rsync to server
#   --use-go-publish  EXPERIMENTAL: Use IG Publisher's -go-publish mode
#
# Examples:
#   ./publish-version.sh 1.0.0 --mode milestone --status trial-use
#   ./publish-version.sh 1.1.0-beta.1 --mode working --status draft --dry-run
#

set -euo pipefail

# Configuration
CANONICAL="http://fhir.awmf.org/awmf.ig"
PACKAGE_ID="awmf.ig"
IG_TITLE="Dissolve-E: FHIR Implementation Guide for the AWMF Guideline Registry"
CATEGORY="Clinical Practice Guidelines"
CI_BUILD="http://fhir.awmf.org/awmf.ig"

# Remote server config (matches existing ig-publish.yml)
REMOTE_USER="awmf_ig_publisher"
REMOTE_HOST="register.awmf.org"
REMOTE_PORT="221"
REMOTE_PATH="./awmf.ig"

# Local directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUBLICATION_DIR="${SCRIPT_DIR}/.publication"
WEBROOT="${PUBLICATION_DIR}/webroot"
TEMP_DIR="${PUBLICATION_DIR}/temp"
HISTORY_DIR="${PUBLICATION_DIR}/history"
TEMPLATES_DIR="${PUBLICATION_DIR}/templates"

# Default values
VERSION=""
MODE="milestone"
STATUS="trial-use"
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
            --sequence)
                SEQUENCE="$2"
                shift 2
                ;;
            --desc)
                DESC="$2"
                shift 2
                ;;
            --first)
                FIRST="$2"
                shift 2
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

    log_info "Configuration:"
    log_info "  Version:  $VERSION"
    log_info "  Mode:     $MODE"
    log_info "  Status:   $STATUS"
    log_info "  Sequence: $SEQUENCE"
    log_info "  First:    $FIRST"
    log_info "  Dry-run:  $DRY_RUN"
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
    
    # Update releaseLabel based on status
    local release_label
    case "$STATUS" in
        draft)
            release_label="draft"
            ;;
        ballot)
            release_label="ballot"
            ;;
        trial-use)
            release_label="trial-use"
            ;;
        release|normative)
            release_label="release"
            ;;
        *)
            release_label="$STATUS"
            ;;
    esac
    
    sed -i.bak "s/^releaseLabel: .*/releaseLabel: ${release_label}/" "$sushi_config"
    rm -f "${sushi_config}.bak"
    
    log_info "Updated sushi-config.yaml"
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
    
    # Setup the complete publication environment required by -go-publish
    setup_go_publish_environment
    
    # Fetch existing webroot from server if not local-only and webroot is empty
    if [ "$LOCAL_ONLY" = "false" ] && [ -z "$(ls -A "$WEBROOT" 2>/dev/null)" ]; then
        log_info "Fetching existing publications from server..."
        fetch_existing_publications || log_warn "Could not fetch existing publications (this may be the first publication)"
    fi
    
    # Run the IG Publisher with -go-publish
    log_info "Executing IG Publisher -go-publish..."
    java -Xmx6g -jar "$publisher" -go-publish \
        -source "$SCRIPT_DIR" \
        -web "$WEBROOT" \
        -history "$HISTORY_DIR" \
        -registry "${WEBROOT}/fhir-ig-list.json" \
        -temp "$TEMP_DIR" \
        -templates "$TEMPLATES_DIR"
    
    log_info "IG Publisher -go-publish completed"
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
        local templates_repo="https://github.com/HL7/fhir-web-templates/archive/refs/heads/master.zip"
        local temp_zip="${PUBLICATION_DIR}/web-templates.zip"
        
        curl -L "$templates_repo" -o "$temp_zip"
        unzip -o "$temp_zip" -d "$PUBLICATION_DIR"
        
        # Copy template files
        cp "${PUBLICATION_DIR}/fhir-web-templates-master/"*template* "$TEMPLATES_DIR/" 2>/dev/null || true
        rm -rf "${PUBLICATION_DIR}/fhir-web-templates-master" "$temp_zip"
        
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
      "npm": "awmf.ig",
      "canonical": "${CANONICAL}",
      "destination": "/awmf.ig"
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
    
    log_info "Publication environment setup complete"
}

# Customize the web templates for AWMF branding
customize_templates() {
    log_info "Customizing templates for AWMF..."
    
    # Update header template with AWMF branding
    if [ -f "${TEMPLATES_DIR}/header.template" ]; then
        cat > "${TEMPLATES_DIR}/header.template" << 'EOF'
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>{{title}} - Publication History</title>
  <link href="{{path}}fhir.css" rel="stylesheet"/>
  <link rel="icon" type="image/png" href="{{path}}assets/ico/favicon.png"/>
</head>
<body>
<div id="segment-header" class="segment">
  <div class="container">
    <div style="display: flex; justify-content: space-between; align-items: center;">
      <div style="display: flex; align-items: center;">
        <a href="https://www.awmf.org" target="_blank">
          <span style="font-weight: bold; font-size: 1.2em; color: #0066cc;">AWMF</span>
        </a>
        <span style="margin-left: 20px; font-size: 0.9em;">Guideline Registry</span>
      </div>
      <div>
        <a href="{{canonical}}" style="font-size: 0.9em;">Current Build</a>
      </div>
    </div>
  </div>
</div>
EOF
    fi
    
    # Update preamble template
    if [ -f "${TEMPLATES_DIR}/preamble.template" ]; then
        cat > "${TEMPLATES_DIR}/preamble.template" << 'EOF'
<div id="segment-content" class="segment">
<div class="container">
<div class="row">
<div class="inner-wrapper">
<div class="col-12">
EOF
    fi
    
    # Update postamble template
    if [ -f "${TEMPLATES_DIR}/postamble.template" ]; then
        cat > "${TEMPLATES_DIR}/postamble.template" << 'EOF'
</div>
</div>
</div>
</div>
</div>
<div id="segment-footer" class="segment">
  <div class="container">
    <div class="inner-wrapper">
      <p>
        &copy; AWMF e.V. | 
        <a href="https://www.awmf.org/impressum">Impressum</a> | 
        <a href="https://www.awmf.org/datenschutz">Datenschutz</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
EOF
    fi
    
    # Create index template
    cat > "${TEMPLATES_DIR}/index.template" << 'EOF'
<h1>{{title}}</h1>
<p>{{introduction}}</p>
<h2>Publication History</h2>
EOF
    
    # Create search form template (optional)
    cat > "${TEMPLATES_DIR}/searchform.template.html" << 'EOF'
<form action="search.html" method="get">
  <input type="text" name="q" placeholder="Search..."/>
  <button type="submit">Search</button>
</form>
EOF
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
    local fhir_version=$(yq eval '.fhirVersion' "${SCRIPT_DIR}/sushi-config.yaml")
    
    # Create new version entry
    local new_entry=$(cat << EOF
{
  "version": "${VERSION}",
  "date": "${pub_date}",
  "desc": "${DESC}",
  "path": "${CANONICAL}/${VERSION}",
  "status": "${STATUS}",
  "sequence": "${SEQUENCE}",
  "fhirversion": "${fhir_version}",
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
    
    log_info "Deploying to ${REMOTE_HOST}..."
    
    local ssh_key="${SSH_KEY_PATH:-/tmp/awmf_ig_publisher.id_ed25519}"
    
    if [ ! -f "$ssh_key" ]; then
        log_error "SSH key not found at: ${ssh_key}"
        log_error "Set SSH_KEY_PATH environment variable or use --local mode"
        exit 1
    fi
    
    rsync -av --delete \
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
