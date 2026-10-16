# Profile rendering

Profile and extension content pages render the compact FHIR structure in their
initial HTML. The build uses the existing IG Publisher and Jekyll pipeline; there
is no additional build command, preprocessing script, or Publisher/SUSHI patch.

## How it works

1. `sushi-config.yaml` enables the Publisher's built-in
   [`produce-jekyll-data`](https://build.fhir.org/ig/FHIR/fhir-tools-ig/en/CodeSystem-ig-parameters.html#ig-parameters-produce-jekyll-data)
   parameter. The template's `config.json` restricts that export to
   StructureDefinitions. Publisher writes each completed resource, including its
   snapshot, to Jekyll's `_data/StructureDefinition-<id>.json`.
2. `config.json` selects `layout-awmf-profile.html` or `layout-awmf-ext.html` for
   the normal content page. These layouts retain the inherited template's page
   metadata, introductions and notes, and include `awmf-profile-viewer.html`
   where the standard structure tabs used to appear.
3. The `awmf-profile-*.html` Liquid includes render all rows, their hierarchy,
   differential highlights, links and element details. CSS is linked in the
   document head, so the initial table already has the intended appearance.
4. The deferred JavaScript enables search, view selection, expand/collapse and
   hover/pinned details. It operates on existing rows. It does not fetch a
   StructureDefinition, reconstruct the table, load `spec.internals`, or replace
   the page's initial design. Popup content comes from pre-rendered HTML
   `template` elements.

The initial view is always Hybrid, with common elements hidden and nested
branches collapsed. Preferences from the former client-side renderer are no
longer restored from local storage, avoiding a change immediately after loading.
Explicit view hashes still select the requested mode. With JavaScript disabled,
the CSS `scripting: none` media query displays every row and hides interactive
controls; element links lead to the full definitions page.

## Standard Publisher views

The inherited layouts remain available at
`StructureDefinition-<id>-publisher.html`. The compact page links to this page
for the original tables, terminology bindings and constraints. That page links
back to the compact view. Definitions, mappings and other resource pages retain
their standard layouts.

Legacy `#tabs-diff`, `#tabs-snap` and `#tabs-key` links select the corresponding
compact view. A legacy terminology/constraint hash (`#tx`, `#inv`, `#inv-*`)
scrolls to the link to the Publisher page and carries the hash onto that link.

Both views use the same generated snapshot. This does not change FHIR profile
semantics or fix upstream `contentReferenceProfile`/nested-section expansion.
The compact page contains one table whose existing rows serve all three modes.
The native layout includes separate key, differential and snapshot tables, then
repeats them in its "All Tables" tab. Moving those native tables to a separate
page removes that duplication from the compact page. Every snapshot element is
still rendered; collapsing branches only hides rows and does not reduce the
download size. The browser also no longer downloads the resource JSON to build
the table.

This rendering approach can stay when upstream snapshot generation is fixed.
When the profiles use less deeply nested definitions and produce smaller
snapshots, the same template will render fewer rows automatically. Until then,
a large snapshot still produces substantial HTML. The separate Publisher page
retains the original tables and the Publisher still generates their fragments.

## Data and language limits

Local canonical links resolve through the Publisher's `site.data.resources`.
Inherited properties are muted in Hybrid and hidden in Differential. Ancestors
of changed elements remain visible in Differential. Elements absent from the
snapshot but present in the differential are included with a warning.

The native data export was checked with unmodified IG Publisher 3.0.0 and
Jekyll 4.4.1, including Unicode text. Publisher 3.0.0 overwrites the same `_data`
filename for each language in a multilingual build; the last language wins and
primitive translation extensions are removed during export. The template
therefore falls back to a link to the native Publisher page when the exported
resource declares a different language from the requested page. Missing snapshot
data uses the same fallback. A resource without a declared language is assumed
to match the page; available primitive translation extensions are honored.
The current guide's English-only output is unaffected by the multilingual limit.

## Verification

The browser tests run the actual Liquid includes through standard Jekyll, then
exercise the resulting HTML in Chromium. They cover initial rendering while a
response is still streaming, disabled JavaScript, row identity across interactions,
hierarchy and slicing, translated/escaped text, links, modes and hover/pinned
details with both the native Popover API and its fallback.

Prerequisites: Node.js 20+, Jekyll 4+, Playwright and Chromium.

```sh
node --test tests/profile-viewer.browser.cjs
```

`NODE_PATH` can select an existing Playwright installation. `JEKYLL_BIN` and
`PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH` can select existing executables. The small
fixture builder in the tests runs only for tests; it is not part of publishing.

For integration checks, run the normal Publisher build and inspect both
`StructureDefinition-<id>.html` and `StructureDefinition-<id>-publisher.html`,
including a profile and an extension. The compact HTML should contain populated
`tr[data-element-id]` rows and no native `div#tabs`; the separate Publisher page
should contain the native tabs. Review `output/qa.html` for broken links and HTML
errors after template changes.
