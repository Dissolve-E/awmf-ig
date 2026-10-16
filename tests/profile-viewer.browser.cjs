/* Standard Jekyll renders the production Liquid includes; Chromium exercises
 * their actual HTML. This fixture builder is test-only. Publishing uses the
 * Publisher's produce-jekyll-data and its existing Jekyll invocation.
 *
 * Prerequisites: Node 20+, Jekyll 4+, Playwright and Chromium. Run:
 *   node --test tests/profile-viewer.browser.cjs
 * NODE_PATH may point to an existing Playwright installation. JEKYLL_BIN and
 * PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH can select existing executables.
 */
const assert = require("node:assert/strict");
const { before, after, test } = require("node:test");
const { createServer } = require("node:http");
const { cpSync, mkdtempSync, mkdirSync, readFileSync, rmSync, writeFileSync } = require("node:fs");
const { readFile } = require("node:fs/promises");
const { tmpdir } = require("node:os");
const { spawnSync } = require("node:child_process");
const path = require("node:path");
const { chromium } = require("playwright");

const root = path.resolve(__dirname, "..");
const profile = JSON.parse(readFileSync(path.join(__dirname, "fixtures/profile-viewer.json"), "utf8"));
const elementIds = [...new Set([...profile.snapshot.element, ...profile.differential.element].map(e => e.id))];
const row = (page, id) => page.locator(`tr[data-element-id="${id}"]`);
const visibleIds = page => page.locator("tr[data-element-id]:visible").evaluateAll(rows => rows.map(r => r.dataset.elementId));
const tab = (page, mode) => page.locator(`.apv-mode-tabs a[data-mode="${mode}"]`);
const visibleDescriptions = page => page.locator(".apv-description:visible").evaluateAll(items => items.map(item => item.dataset.mode));
const footerMarker = "<!-- fixture-footer -->";
let directory, rendered, browser;
const renderedVariants = {};

before(async () => {
  directory = mkdtempSync(path.join(tmpdir(), "awmf-profile-viewer-test-"));
  const source = path.join(directory, "source"), destination = path.join(directory, "output");
  mkdirSync(path.join(source, "_data"), { recursive: true });
  cpSync(path.join(root, "awmf-template/includes"), path.join(source, "_includes"), { recursive: true });
  writeFileSync(path.join(source, "_config.yml"), "encoding: utf-8\nliquid:\n  error_mode: strict\n  strict_filters: true\n");
  for (const [name, data] of Object.entries({
    "StructureDefinition-fixture": profile,
    info: { assets: "", spec: "https://hl7.org/fhir/R5/" },
    resources: {
      "StructureDefinition-fixture": { url: profile.url, path: "StructureDefinition-fixture.html" },
      "StructureDefinition-local": { url: "https://example.org/StructureDefinition/local", path: "StructureDefinition-local.html" },
      "ValueSet-local": { url: "https://example.org/ValueSet/local", path: "ValueSet-local.html" }
    }
  })) writeFileSync(path.join(source, `_data/${name}.json`), JSON.stringify(data));
  writeFileSync(path.join(source, "_data/StructureDefinition-wrong-language.json"), JSON.stringify({ ...profile, id: "wrong-language", language: "en" }));
  const publisherLink = readFileSync(path.join(root, "awmf-template/layouts/layout-awmf-profile.html"), "utf8")
    .match(/<p class="apv-publisher-link">.*<\/p>/)[0].replaceAll("{{[id]}}", "{{ page.viewer_id }}");
  const pageTemplate = `---
viewer_id: FIXTURE_ID
---
<!doctype html><html lang="de"><head><meta charset="utf-8">
<style>body { font: 16px Arial; color: #222; } table { font: 13px Arial; }
.ui-tabs-nav { display: flex; gap: 20px; list-style: none; }</style>
{% include _append.fragment-css.html %}
</head><body><main id="content"><h3 id="profile">Formal profile</h3>
{% include awmf-profile-viewer.html id=page.viewer_id lang="de" %}
${publisherLink}
${footerMarker}<p id="after-viewer">Content after the static viewer</p>
</main><script>window.footerLoaded = true;</script></body></html>`;
  for (const variant of ["fixture", "wrong-language", "missing-resource"]) {
    writeFileSync(path.join(source, `StructureDefinition-${variant}.html`), pageTemplate.replace("FIXTURE_ID", variant));
  }
  const result = spawnSync(process.env.JEKYLL_BIN || "jekyll", [
    "build", "--safe", "--quiet", "--disable-disk-cache", "--source", source, "--destination", destination
  ], { encoding: "utf8", timeout: 60000 });
  assert.equal(result.status, 0, `Standard Jekyll must render the production includes:\n${result.stdout}\n${result.stderr?.slice(0, 2500)}\n${result.error || ""}`);
  for (const variant of ["fixture", "wrong-language", "missing-resource"]) {
    renderedVariants[variant] = readFileSync(path.join(destination, `StructureDefinition-${variant}.html`), "utf8");
  }
  rendered = renderedVariants.fixture;
  browser = await chromium.launch({ headless: true,
    ...(process.env.PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH ? { executablePath: process.env.PLAYWRIGHT_CHROMIUM_EXECUTABLE_PATH } : {}) });
});
after(async () => {
  await browser?.close();
  if (directory) rmSync(directory, { recursive: true, force: true });
});

async function fixture(t, { stream = false, javaScriptEnabled = true, fallbackPopover = false, stripBooleanHidden = false, variant = "fixture" } = {}) {
  const pending = new Set(), requests = [];
  let released = !stream;
  // The Publisher's HTML checker can discard valueless boolean attributes.
  // First paint must therefore stay correct even after its normalization pass.
  const html = stripBooleanHidden ? renderedVariants[variant].replace(/\shidden(?=[\s>])/g, "") : renderedVariants[variant];
  const split = html.indexOf(footerMarker), prefix = html.slice(0, split), suffix = html.slice(split);
  const server = createServer(async (request, response) => {
    const pathname = new URL(request.url, "http://localhost").pathname;
    requests.push(pathname);
    try {
      if (/\/awmf-profile-viewer\.(js|css)$/.test(pathname)) {
        const filename = pathname.split("/").pop(), extension = filename.endsWith(".js") ? "js" : "css";
        response.writeHead(200, { "Content-Type": extension === "js" ? "application/javascript" : "text/css" });
        response.end(await readFile(path.join(root, "awmf-template/content/assets", extension, filename)));
      } else if (pathname.endsWith(".html")) {
        response.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
        response.write(prefix);
        if (released) response.end(suffix); else pending.add(response);
      } else if (pathname.endsWith(".json") || pathname.endsWith("/spec.internals")) {
        response.writeHead(500);
        response.end("Profile and link data must already be rendered into HTML.");
      } else { response.writeHead(204); response.end(); }
    } catch (error) { response.destroy(error); }
  });
  await new Promise(resolve => server.listen(0, "127.0.0.1", resolve));
  const context = await browser.newContext({ javaScriptEnabled, viewport: { width: 1500, height: 1000 } });
  if (fallbackPopover) await context.addInitScript(() => {
    Object.defineProperty(HTMLElement.prototype, "showPopover", { value: undefined });
    Object.defineProperty(HTMLElement.prototype, "hidePopover", { value: undefined });
  });
  const page = await context.newPage(), errors = [];
  page.setDefaultTimeout(5000);
  page.on("pageerror", error => errors.push(error.message));
  const release = () => {
    released = true;
    for (const response of pending) response.end(suffix);
    pending.clear();
  };
  t.after(async () => {
    release();
    await context.close();
    server.closeAllConnections();
    await new Promise(resolve => server.close(resolve));
    assert.deepEqual(errors, [], "The viewer must not raise browser errors");
    assert.deepEqual(requests.filter(r => r.endsWith(".json") || r.endsWith("/spec.internals")), [], "No profile or canonical data fetching");
  });
  return { page, release, url: `http://127.0.0.1:${server.address().port}/ig/de/StructureDefinition-${variant}.html` };
}

test("standard Jekyll emits every snapshot and missing differential row with escaped Unicode", async t => {
  assert.equal((rendered.match(/data-element-id=/g) || []).length, elementIds.length);
  assert.match(rendered, /Größe &amp; Übersicht &lt;script&gt;/);
  assert.ok(!rendered.includes("<script>window.fixtureXss"));
  assert.ok(!rendered.includes("Liquid error"));
  const { page, url } = await fixture(t);
  await page.goto(url);
  assert.equal(await page.evaluate(() => window.fixtureXss), undefined);
  assert.equal(await page.locator('[href^="javascript:"]').count(), 0);
  assert.equal(await row(page, "Attachment.description").locator(".apv-types").innerText(), "string");
  assert.match(await row(page, "Attachment.description").innerText(), /Größe & Übersicht <script>/);
  assert.match(await row(page, "Attachment.status").innerText(), /Geerbter Status – geprüft/);
  assert.equal(await row(page, "Attachment.component:alpha/beta.missing").getAttribute("data-missing"), "true");
  assert.equal(await row(page, "Attachment.component:alpha/beta.missing").count(), 1);
});

test("Liquid calculates hierarchy, inherited exclusions and unchanged ancestors", async t => {
  const { page, url } = await fixture(t);
  await page.goto(url);
  const expected = {
    Attachment: { parentId: "", depth: "0", changed: "false", changedBelow: "true" },
    "Attachment.meta": { parentId: "Attachment", depth: "1", common: "true" },
    "Attachment.part": { parentId: "Attachment", depth: "1", changed: "false", changedBelow: "true" },
    "Attachment.part.title": { parentId: "Attachment.part", depth: "2", changed: "true" },
    "Attachment.retired.value": { parentId: "Attachment.retired", depth: "2", excluded: "true" },
    "Attachment.omitted.middle.value": { parentId: "Attachment", depth: "1" },
    "Attachment.component:alpha": { parentId: "Attachment.component", depth: "2" },
    "Attachment.component:alpha/beta": { parentId: "Attachment.component:alpha", depth: "3" },
    "Attachment.component:alpha/beta.missing": { parentId: "Attachment.component:alpha/beta", depth: "4", missing: "true", changed: "true" }
  };
  for (const [id, attributes] of Object.entries(expected)) {
    const actual = await row(page, id).evaluate(element => ({ ...element.dataset }));
    for (const [name, value] of Object.entries(attributes)) assert.equal(actual[name], value, `${id}: ${name}`);
  }
});

test("styled populated HTML paints before the page finishes and enhancement preserves it", async t => {
  const { page, url, release } = await fixture(t, { stream: true, stripBooleanHidden: true });
  await page.goto(url, { waitUntil: "commit" });
  await row(page, "Attachment.description").waitFor({ state: "visible" });
  const initial = await page.evaluate(() => {
    window.initialRows = [...document.querySelectorAll("tr[data-element-id]")];
    const viewer = document.querySelector("#awmf-profile-viewer");
    return { ready: document.readyState, footer: !!window.footerLoaded, mode: viewer.dataset.mode, border: getComputedStyle(viewer).borderTopWidth };
  });
  assert.deepEqual(initial, { ready: "loading", footer: false, mode: "hybrid", border: "1px" });
  assert.equal(await page.locator("#tabs").count(), 0);
  assert.equal(await page.locator(".apv-empty-row").isVisible(), false);
  assert.equal(await page.locator("#awmf-element-details").isVisible(), false);
  const initiallyVisible = await visibleIds(page);
  assert.ok(initiallyVisible.includes("Attachment.part"));
  assert.ok(!initiallyVisible.includes("Attachment.part.title"));
  assert.equal(await page.locator(".apv-count").innerText(), `${initiallyVisible.length} / ${elementIds.length} elements`);
  assert.deepEqual(await visibleDescriptions(page), ["hybrid"]);
  release();
  await page.waitForLoadState("load");
  assert.deepEqual(await visibleIds(page), initiallyVisible, "Enhancement must not switch layout or visible rows");
  assert.equal(await page.evaluate(() => window.initialRows.every((element, index) => element === document.querySelectorAll("tr[data-element-id]")[index])), true);
});

test("without JavaScript all rows remain readable in our design with working definition links", async t => {
  const { page, url } = await fixture(t, { javaScriptEnabled: false, stripBooleanHidden: true });
  await page.goto(url);
  assert.equal(await page.locator("#awmf-profile-viewer").isVisible(), true);
  assert.deepEqual(new Set(await visibleIds(page)), new Set(elementIds));
  assert.equal(await page.locator(".apv-footer").innerText(), `${elementIds.length} elements`);
  assert.equal(await page.locator(".apv-search").isVisible(), false);
  assert.equal(await page.locator("#tabs").count(), 0);
  const link = row(page, "Attachment.component:alpha/beta.code").locator(".apv-element-label");
  const target = new URL(await link.getAttribute("href"), url);
  assert.equal(target.pathname, "/ig/de/StructureDefinition-fixture-definitions.html");
  assert.equal(decodeURIComponent(target.hash.slice(1)), "Attachment.component:alpha/beta.code");
});

test("tabs, collapse and search preserve row identity and semantic filtering", async t => {
  const { page, url } = await fixture(t);
  await page.goto(url);
  await page.evaluate(() => { window.initialRows = [...document.querySelectorAll("tr[data-element-id]")]; });
  await page.locator('[data-action="expand"]').click();
  assert.equal(await row(page, "Attachment.meta.versionId").isVisible(), false, "A common ancestor hides its descendants");
  assert.equal(await row(page, "Attachment.retired.value").isVisible(), true);
  await tab(page, "snapshot").click();
  assert.deepEqual(await visibleDescriptions(page), ["snapshot"]);
  assert.equal(await row(page, "Attachment.part").locator(".apv-card").isVisible(), true);
  assert.equal(await row(page, "Attachment.retired").isVisible(), false);
  assert.equal(await row(page, "Attachment.retired.value").isVisible(), false);
  await tab(page, "diff").click();
  assert.deepEqual(await visibleDescriptions(page), ["diff"]);
  assert.equal(await row(page, "Attachment.part").locator(".apv-card").isVisible(), false, "Differential hides unspecified fields on ancestor rows");
  assert.equal(await row(page, "Attachment.part.title").locator(".apv-card").isVisible(), true, "Differential retains explicitly changed cardinality");
  assert.equal(await row(page, "Attachment.part.title").locator(".apv-types").isVisible(), false);
  assert.deepEqual(new Set(await visibleIds(page)), new Set([
    "Attachment", "Attachment.description", "Attachment.part", "Attachment.part.title", "Attachment.retired",
    "Attachment.component", "Attachment.component:alpha", "Attachment.component:alpha/beta", "Attachment.component:alpha/beta.missing"
  ]));
  assert.equal(await page.locator(".apv-common input").isDisabled(), true);
  await tab(page, "hybrid").click();
  assert.deepEqual(await visibleDescriptions(page), ["hybrid"]);
  await page.locator(".apv-common input").check();
  assert.equal(await row(page, "Attachment.meta.versionId").isVisible(), true);
  await page.locator(".apv-common input").uncheck();
  await page.locator('[data-action="collapse"]').click();
  assert.equal(await row(page, "Attachment.part.title").isVisible(), false);
  await page.locator(".apv-search").fill("Needle");
  assert.deepEqual(await visibleIds(page), ["Attachment", "Attachment.part", "Attachment.part.title"]);
  await page.locator(".apv-search").fill("");
  assert.equal(await row(page, "Attachment.part.title").isVisible(), false, "Search preserves collapsed branches");
  await row(page, "Attachment.part").locator("button.apv-toggle").click();
  assert.equal(await row(page, "Attachment.part.title").isVisible(), true);
  assert.equal(await page.evaluate(() => window.initialRows.every((element, index) => element.isConnected && element === document.querySelectorAll("tr[data-element-id]")[index])), true);
  assert.equal(await page.locator("tr[data-element-id]").count(), elementIds.length);
});

test("tabs support keyboard navigation and incoming links without changing the default on reload", async t => {
  const { page, url } = await fixture(t);
  await page.goto(`${url}#awmf-structure-snapshot`);
  for (const mode of ["diff", "snapshot", "hybrid"]) {
    const target = await tab(page, mode).getAttribute("href");
    assert.equal(await page.locator(`[id="${target.slice(1)}"]`).count(), 1, "Tab links have real static HTML targets");
  }
  assert.equal(await tab(page, "snapshot").getAttribute("aria-selected"), "true");
  await tab(page, "snapshot").press("ArrowLeft");
  assert.equal(await tab(page, "diff").getAttribute("aria-selected"), "true");
  await tab(page, "diff").press("End");
  assert.equal(await tab(page, "hybrid").getAttribute("aria-selected"), "true");
  await tab(page, "hybrid").press("Home");
  assert.equal(await tab(page, "diff").getAttribute("aria-selected"), "true");
  await page.goto(url);
  assert.equal(await tab(page, "hybrid").getAttribute("aria-selected"), "true", "A bare URL keeps the statically rendered default");
  await page.evaluate(() => { location.hash = "awmf-structure-diff"; });
  await page.locator('.apv-mode-tabs a[data-mode="diff"][aria-selected="true"]').waitFor();
});

test("search includes constraints and fixed values and reports empty results", async t => {
  const { page, url } = await fixture(t);
  await page.goto(url);
  await page.locator(".apv-search").fill("Must include a title");
  assert.deepEqual(await visibleIds(page), ["Attachment", "Attachment.part", "Attachment.part.title"]);
  await page.locator(".apv-search").fill("https://example.org/StructureDefinition/local|1.0");
  assert.deepEqual(await visibleIds(page), ["Attachment", "Attachment.reference"], "Search retains canonical URL and version after resolving a local link");
  await page.locator(".apv-search").fill("unmatchable fixture query");
  assert.deepEqual(await visibleIds(page), []);
  assert.equal(await page.locator(".apv-empty-row").isVisible(), true);
  await page.locator(".apv-search").fill("Größe");
  assert.deepEqual(await visibleIds(page), ["Attachment", "Attachment.description"]);
});

for (const fallbackPopover of [false, true]) {
  test(`hover, pin and keyboard details (${fallbackPopover ? "fixed fallback" : "native popover"})`, async t => {
    const { page, url } = await fixture(t, { fallbackPopover });
    await page.goto(url);
    const trigger = row(page, "Attachment.description").locator(".apv-detail-trigger"), details = page.locator("#awmf-element-details");
    await trigger.hover();
    await details.waitFor({ state: "visible" });
    assert.match(await details.innerText(), /Definition mit Umlauten: äöü ß\. <img/);
    assert.equal(await details.locator(".apv-popover-pin").getAttribute("aria-pressed"), "false");
    await details.locator(".apv-popover-pin").click();
    await page.mouse.move(1400, 15);
    await page.waitForTimeout(500);
    assert.equal(await details.isVisible(), true);
    assert.equal(await details.locator(".apv-popover-pin").getAttribute("aria-pressed"), "true");
    await page.keyboard.press("Escape");
    await details.waitFor({ state: "hidden" });
    await trigger.focus();
    await trigger.press("Enter");
    await details.waitFor({ state: "visible" });
    assert.equal(await details.locator(".apv-popover-pin").getAttribute("aria-pressed"), "true");
    await details.locator(".apv-popover-close").click();
    await details.waitFor({ state: "hidden" });
    assert.equal(await trigger.evaluate(element => document.activeElement === element), true);
    assert.equal(await page.evaluate(() => window.fixtureXss), undefined);
  });
}

test("build-time links resolve versioned local canonicals and content references", async t => {
  const { page, url } = await fixture(t);
  await page.goto(url);
  const local = row(page, "Attachment.reference").locator(".apv-types a");
  assert.equal(new URL(await local.getAttribute("href"), url).pathname, "/ig/de/StructureDefinition-local.html");
  assert.equal(await row(page, "Attachment.recursive").locator(".apv-types a").getAttribute("href"), "StructureDefinition-fixture-definitions.html#Attachment.part");
  assert.equal(await row(page, "Attachment.localContent").locator(".apv-types a").getAttribute("href"), "StructureDefinition-local-definitions.html#Attachment.part");
  assert.equal(await row(page, "Attachment.fhirContent").locator(".apv-types a").getAttribute("href"), "https://hl7.org/fhir/R5/composition-definitions.html#Composition.section");
  await row(page, "Attachment.part").locator("button.apv-toggle").click();
  await row(page, "Attachment.part.title").locator(".apv-detail-trigger").click();
  assert.equal(await page.locator('#awmf-element-details a[href="ValueSet-local.html"]').count(), 1);
});

test("legacy tab and terminology fragments still lead to their corresponding views", async t => {
  const { page, url } = await fixture(t);
  for (const [fragment, mode] of [["tabs-diff", "diff"], ["tabs-snap", "snapshot"], ["tabs-key", "hybrid"]]) {
    await page.goto(`${url}#${fragment}`);
    await page.locator(`.apv-mode-tabs a[data-mode="${mode}"][aria-selected="true"]`).waitFor();
  }
  await page.goto(`${url}#tx`);
  await page.waitForFunction(() => document.querySelector(".apv-publisher-link a").hash === "#tx");
  const publisherTarget = new URL(await page.locator(".apv-publisher-link a").getAttribute("href"), url);
  assert.equal(publisherTarget.pathname, "/ig/de/StructureDefinition-fixture-publisher.html");
  assert.equal(publisherTarget.hash, "#tx");
});

for (const [variant, warning] of [["wrong-language", "exported profile data is in en"], ["missing-resource", "generated profile snapshot is unavailable"]]) {
  test(`${variant} offers the static Publisher fallback without a broken viewer`, async t => {
    const { page, url } = await fixture(t, { variant });
    await page.goto(url);
    assert.equal(await page.locator("#awmf-profile-viewer").count(), 0);
    assert.ok((await page.locator(".apv-warning").innerText()).includes(warning));
    assert.equal(await page.locator(".apv-warning a").getAttribute("href"), `StructureDefinition-${variant}-publisher.html`);
    assert.equal(await page.locator(".apv-warning a").isVisible(), true);
  });
}
