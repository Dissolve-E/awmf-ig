# Releasing a version

Versions are published to <http://fhir.awmf.org/awmf.ig> with the IG Publisher's
`-go-publish` process, by the workflow *Publish IG Version*
([ig-publish-version.yml](.github/workflows/ig-publish-version.yml)), which runs
[publish-version.sh](publish-version.sh). The CI build of `main` is published
separately at `ci-build/` by [ig-publish.yml](.github/workflows/ig-publish.yml).

## 1. Prepare the release in a pull request

In `sushi-config.yaml`, set `version` and `releaseLabel` (the label in the page
header, for example `Draft`; the CI build replaces it with `ci-build`).

Add or update `publication-request.json` in the repository root:

```json
{
  "package-id": "awmf.ig",
  "version": "0.3.0",
  "path": "http://fhir.awmf.org/awmf.ig/0.3.0",
  "mode": "working",
  "status": "draft",
  "sequence": "STU1",
  "desc": "One sentence about this version",
  "first": false,
  "allow-current-dependencies": true
}
```

- `mode`: `working` publishes the version at its path only. `milestone` also makes
  it the current version at the canonical and marks the earlier versions as
  outdated. `technical-correction` replaces the current milestone.
- `status` and `sequence` appear in the version history and in the publish box of
  every page. 0.2.0 is `draft` in the sequence `STU1`.
- `allow-current-dependencies`: needed as long as the IG depends on the EBM
  packages as `current`, because no R6 version of them is published. The GitHub
  release of each version carries the EBM packages it was built with.
- `first` is `true` only for the first publication on a website.

The QA report of the CI build (`qa.html`, section *Publication Request*) checks
the request against the published versions. `publish-version.sh` checks it again
before it builds.

## 2. Tag the merge commit

```sh
git fetch origin
git tag v0.3.0 origin/main
git push origin v0.3.0
```

The tag must be `v` followed by the version, and it must be on `main`.

## 3. Dry run

Run *Publish IG Version* with `release_ref` set to the tag and `publish` unchecked.
The run downloads the website from the server, builds the IG and runs
`-go-publish` on the copy. That means two builds for a working release and three
for a milestone. Nothing is uploaded. Review:

- the job summary, which lists the files that would be uploaded per folder;
- the artifact `publication-review-<tag>`: `qa.html`, the `-go-publish` log and
  announcement, the new `package-list.json` and `upload-changes.txt` (every file
  that would be uploaded).

## 4. Publish

Run the workflow again with `publish` checked. The run waits for approval in the
`publication` environment and repeats the dry run. Then it:

- stops if `package-list.json` on the server changed during the build;
- uploads the staged website, sending `package-list.json`, the history page and
  the feeds last, and never deletes anything on the server;
- checks the published files over HTTPS;
- creates the GitHub release for the tag with the AWMF package and the EBM
  packages.

## The website

`./awmf.ig` on register.awmf.org is the web folder of `-go-publish`:

- `package-list.json`, `history.html`, `package-feed.xml`, `publication-feed.xml`
  and `package-registry.json` are maintained by `-go-publish`.
  `publish-setup.json` configures it; `publish-version.sh` creates it, the feeds
  and the registry when they are missing.
- Every version has its own folder. A milestone is also copied to the root.
- `ci-build/` belongs to the CI workflow. The release workflow neither downloads
  nor uploads it.

Canonical URLs such as
`http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline` redirect with
static HTML pages (`"server": "cloud"` in `publish-setup.json`). 0.2.0 was
published with PHP redirects, which the server does not execute.

## Running it locally

`-go-publish` copies the whole source folder for its builds, including
`input-cache/`, so run it from a clean checkout of the tag. It needs Java, Node.js,
Ruby and curl, as in the `hl7fhir/ig-publisher-base` image.

```sh
rsync -a -e 'ssh -p 221' --exclude /ci-build/ \
  awmf_ig_publisher@register.awmf.org:./awmf.ig/ ../site/
./publish-version.sh --web ../site --work ../work
```

The script changes only `../site` and `../work`.

## One-time setup

- Settings > Environments: create `publication` and add the required reviewers.
  Otherwise GitHub creates the environment on the first run without protection.
- The secret `AWMF_IG_SSH_KEY`, which the CI workflow also uses.
