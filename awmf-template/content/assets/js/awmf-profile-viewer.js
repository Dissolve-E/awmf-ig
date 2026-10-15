/* A static StructureDefinition viewer. The Publisher remains responsible for snapshots.
 * The model also runs in Node for verification. */
(function (global) {
  "use strict";

  const own = (object, key) => Object.prototype.hasOwnProperty.call(object || {}, key);
  const values = object => Object.entries(object || {});
  const meaningful = element => values(element).some(([key]) => !["id", "path"].includes(key));
  const parentId = id => {
    const dot = id.lastIndexOf("."), colon = id.lastIndexOf(":"), slash = id.lastIndexOf("/");
    return id.slice(0, slash > colon && slash > dot ? slash : colon > dot ? colon : Math.max(0, dot));
  };

  function buildModel(resource) {
    if (!resource.snapshot?.element?.length) throw new Error("No generated snapshot available");
    const differential = new Map((resource.differential?.element || []).map(e => [e.id || e.path, e]));
    const nodes = resource.snapshot.element.map(element => ({
      id: element.id || element.path, element, children: [], parent: null, missing: false
    }));
    const byId = new Map(nodes.map(node => [node.id, node]));
    // Preserve differential elements absent from the snapshot rather than silently dropping them.
    for (const [id, element] of differential) {
      if (!byId.has(id)) {
        const node = { id, element, children: [], parent: null, missing: true };
        nodes.push(node);
        byId.set(id, node);
      }
    }
    const roots = [];
    for (const node of nodes) {
      node.diff = differential.get(node.id);
      node.changed = !!node.diff && meaningful(node.diff);
      let candidate = parentId(node.id);
      while (candidate && !byId.has(candidate)) candidate = parentId(candidate);
      node.parent = byId.get(candidate) || null;
      (node.parent ? node.parent.children : roots).push(node);
    }
    function annotate(node, depth, excluded) {
      node.depth = depth;
      node.excluded = excluded || node.element.max === "0";
      node.changedBelow = node.changed;
      for (const child of node.children) {
        annotate(child, depth + 1, node.excluded);
        node.changedBelow ||= child.changedBelow;
      }
      const e = node.element;
      const base = e.base?.path || "";
      const leaf = e.path.split(".").pop();
      node.common = !node.changedBelow && !e.sliceName && (
        /^(Resource|DomainResource)\./.test(base) || leaf === "id" ||
        ["extension", "modifierExtension"].includes(leaf) || e.representation?.includes("xmlAttr")
      );
    }
    roots.forEach(root => annotate(root, 0, false));
    return { resource, roots, nodes, byId, missing: nodes.filter(n => n.missing) };
  }

  function visibleNodes(model, { mode = "hybrid", showCommon = false, collapsed = new Set(), query = "" } = {}) {
    const result = [];
    const term = query.trim().toLowerCase();
    const matches = new Set();
    if (term) {
      for (const node of model.nodes) {
        const e = node.element;
        const searchable = [node.id, e.short, e.definition, JSON.stringify(e.type), JSON.stringify(e.binding), JSON.stringify(e.constraint),
          ...values(e).filter(([k]) => /^(fixed|pattern)/.test(k)).map(([,v]) => JSON.stringify(v))].join(" ").toLowerCase();
        if (searchable.includes(term)) {
          for (let ancestor = node; ancestor; ancestor = ancestor.parent) matches.add(ancestor.id);
        }
      }
    }
    function visit(node) {
      if (mode === "snapshot" && node.excluded) return;
      if (mode === "diff" && !node.changedBelow && node.parent) return;
      if (mode !== "diff" && !showCommon && node.common && node.parent) return;
      if (term && !matches.has(node.id)) return;
      result.push(node);
      if (!term && collapsed.has(node.id)) return;
      node.children.forEach(visit);
    }
    model.roots.forEach(visit);
    return result;
  }

  const api = { buildModel, visibleNodes, parentId };
  if (typeof module !== "undefined" && module.exports) module.exports = api;
  global.AwmfProfileViewer = api;
  if (typeof document === "undefined") return;

  // Run in the head: hide the native tables before first paint and fetch data
  // while the browser is still parsing the page. No JavaScript means no hiding.
  const filename = decodeURIComponent(location.pathname.split("/").pop()).replace(/\.html$/, "");
  const profilePage = /^StructureDefinition-[A-Za-z0-9.-]+$/.test(filename) &&
    !/(?:-(?:definitions|mappings|examples|testing)|\.profile\.(?:xml|json|ttl|history))$/.test(filename);
  const viewerScript = document.currentScript || document.querySelector('script[src*="awmf-profile-viewer.js"]');
  if (profilePage) document.documentElement.classList.add("apv-loading");
  const profileRequest = profilePage ? loadProfile() : null;
  // A failed request may finish before DOMContentLoaded. run() handles the error.
  profileRequest?.catch(() => {});

  function el(tag, className, text) {
    const node = document.createElement(tag);
    if (className) node.className = className;
    if (text !== undefined) node.textContent = text;
    return node;
  }
  function safeLink(text, href) {
    const link = el("a", "", text);
    try {
      const url = new URL(href, document.baseURI);
      if (["https:", "http:"].includes(url.protocol)) link.href = url.href;
    } catch (_) { /* Keep unresolvable canonicals as text. */ }
    return link;
  }
  const canonical = url => url.split("|")[0];
  function canonicalLink(url) {
    const base = canonical(url);
    const link = safeLink(base.split("/").pop(), canonicalPaths.get(base) || base);
    link.dataset.canonical = base;
    return link;
  }
  function valueBlock(value) {
    const pre = el("pre", "apv-value");
    pre.append(el("code", "", typeof value === "object" ? JSON.stringify(value, null, 2) : String(value)));
    return pre;
  }
  const typeName = type => type.extension?.find(extension =>
    extension.url === "http://hl7.org/fhir/StructureDefinition/structuredefinition-fhir-type")?.valueUrl || type.code;
  function elementIcon(node, resource) {
    const e = node.element;
    const leaf = e.path.split(".").pop();
    const type = e.type?.[0] ? typeName(e.type[0]) : "";
    if (["extension", "modifierExtension"].includes(leaf) || (!node.parent && resource.type === "Extension")) {
      const complex = node.children.some(child => child.element.path.endsWith(".extension") && child.element.max !== "0");
      const modifier = leaf === "modifierExtension" || e.isModifier;
      return { file: `icon_${modifier ? "modifier_extension" : "extension"}_${complex ? "complex" : "simple"}.png`, title: `${complex ? "Complex" : "Simple"} ${modifier ? "modifier extension" : "extension"}` };
    }
    if (e.sliceName) return { file: "icon_slice_item.png", title: "Slice" };
    if (e.slicing) return { file: "icon_slice.png", title: "Slice definition" };
    if (e.contentReference || type.startsWith("@")) return { file: "icon_reuse.png", title: "Reference to another element" };
    if (!node.parent && resource.kind === "resource") return { file: "icon_resource.png", title: "Resource" };
    if ((e.type || []).length && e.type.every(t => ["Reference", "canonical"].includes(typeName(t)) || t.targetProfile?.length)) {
      return { file: "icon_reference.png", title: "Reference to another resource" };
    }
    if (e.path.endsWith("[x]") || e.type?.length > 1) return { file: "icon_choice.gif", title: "Choice of types" };
    if (/^[a-z]/.test(type) && !type.includes(":")) return { file: "icon_primitive.png", title: "Primitive data type" };
    if (["Resource", "DomainResource"].includes(type)) return { file: "icon_resource.png", title: "Resource" };
    if (!type || ["Base", "Element", "BackboneElement"].includes(type)) return { file: "icon_element.gif", title: "Element" };
    return { file: "icon_datatype.gif", title: "Data type" };
  }
  function preference() {
    try {
      const stored = JSON.parse(localStorage.getItem("awmf.profile-viewer") || "{}");
      return stored && typeof stored === "object" ? stored : {};
    }
    catch (_) { return {}; }
  }
  function remember(state) {
    try { localStorage.setItem("awmf.profile-viewer", JSON.stringify({ mode: state.mode, showCommon: state.showCommon })); }
    catch (_) { /* The viewer also works when storage is disabled. */ }
  }

  function mount(model, original, filename) {
    const stored = preference();
    const branches = model.nodes.filter(node => node.parent && node.children.length).map(node => node.id);
    if (!global.jQuery?.fn.tabs) throw new Error("The IG Publisher tab widget is unavailable");
    const state = {
      mode: ["snapshot", "hybrid", "diff"].includes(stored.mode) ? stored.mode : "hybrid",
      showCommon: stored.showCommon === true, query: "",
      collapsed: new Set(branches)
    };
    const viewer = el("section", "apv");
    viewer.id = "awmf-profile-viewer";
    viewer.setAttribute("aria-label", "FHIR structure viewer");
    // Read the native IG typography instead of maintaining a separate font theme.
    const prose = document.getElementById("profile")?.nextElementSibling || original.parentElement;
    const nativeCell = original.querySelector("table.hierarchy td, table td, table th") || original;
    for (const [prefix, reference] of [["", prose], ["table-", nativeCell]]) {
      const style = getComputedStyle(reference);
      for (const property of ["font-family", "font-size", "line-height", "color"]) {
        viewer.style.setProperty(`--apv-${prefix}${property}`, style.getPropertyValue(property));
      }
    }
    viewer.style.setProperty("--apv-heading-font-family", getComputedStyle(document.getElementById("profile")).fontFamily);
    const linkSample = safeLink("", "#");
    linkSample.hidden = true;
    original.parentElement.append(linkSample);
    viewer.style.setProperty("--apv-link-color", getComputedStyle(linkSample).color);
    linkSample.remove();
    const toolbar = el("div", "apv-toolbar");
    const heading = el("div", "apv-heading h4", "FHIR structure");
    heading.setAttribute("role", "heading");
    heading.setAttribute("aria-level", "4");
    heading.append(el("small", "apv-subtitle", model.resource.type));
    toolbar.append(heading);
    const controls = el("div", "apv-controls");
    const tabs = el("div", "apv-mode-tabs");
    tabs.id = "awmf-structure-tabs";
    const tabList = el("ul");
    tabList.setAttribute("aria-label", "Structure view");
    const panels = new Map();
    for (const [mode, label] of [["diff", "Differential Table"], ["snapshot", "Snapshot Table"], ["hybrid", "Hybrid Table"]]) {
      const item = el("li");
      const link = el("a", "", label);
      link.href = `#awmf-structure-${mode}`;
      item.append(link);
      tabList.append(item);
      const panel = el("div");
      panel.id = `awmf-structure-${mode}`;
      panel.dataset.mode = mode;
      panels.set(mode, panel);
    }
    tabs.append(tabList, ...panels.values());
    const commonLabel = el("label", "apv-common");
    const common = el("input");
    common.type = "checkbox";
    common.checked = state.showCommon;
    common.addEventListener("change", () => { state.showCommon = common.checked; remember(state); render(); });
    commonLabel.append(common, document.createTextNode(" Show common"));
    controls.append(commonLabel);
    toolbar.append(controls);
    const tools = el("div", "apv-tools");
    const search = el("input", "apv-search");
    search.type = "search";
    search.placeholder = "Find an element, type or value…";
    search.setAttribute("aria-label", "Search FHIR structure");
    search.addEventListener("input", () => { state.query = search.value; render(); });
    tools.append(search);
    for (const [text, collapse] of [["Expand all", false], ["Collapse all", true]]) {
      const button = el("button", "apv-text-button", text);
      button.type = "button";
      button.addEventListener("click", () => {
        state.collapsed = new Set(collapse ? branches : []);
        render();
      });
      tools.append(button);
    }
    const description = el("p", "apv-description");
    const scroller = el("div", "apv-scroll");
    const table = el("table", "apv-table");
    const head = el("thead"), header = el("tr");
    for (const title of ["Element", "Flags", "Card.", "Type", "Description"]) {
      const th = el("th", "", title);
      th.scope = "col";
      header.append(th);
    }
    head.append(header);
    const body = el("tbody");
    table.append(head, body);
    scroller.append(table);
    const footer = el("div", "apv-footer");
    const count = el("span");
    count.setAttribute("role", "status");
    footer.append(count);
    const tabContent = el("div", "apv-tab-content");
    tabContent.append(tools, description, scroller, footer);
    viewer.append(toolbar, tabs);
    if (model.missing.length) viewer.append(el("p", "apv-warning",
      `${model.missing.length} differential element(s) are absent from this snapshot. They are shown with a warning; check the Publisher output.`));

    function fieldClass(node, keys) {
      const specified = keys.some(key => own(node.diff, key));
      return specified ? "apv-specified" : state.mode === "diff" ? "apv-diff-inherited" : state.mode === "hybrid" ? "apv-inherited" : "";
    }
    // One lazily populated panel keeps long constraints and JSON out of the rows.
    // Native popovers use the top layer; a fixed-position fallback also works.
    const detailPanel = el("aside", "apv apv-popover");
    detailPanel.id = "awmf-element-details";
    detailPanel.hidden = true;
    detailPanel.setAttribute("role", "dialog");
    detailPanel.setAttribute("aria-labelledby", "awmf-element-details-title");
    detailPanel.style.cssText = viewer.style.cssText;
    const nativePopover = typeof detailPanel.showPopover === "function";
    if (nativePopover) detailPanel.setAttribute("popover", "manual");
    document.body.append(detailPanel);
    let activeDetail, detailAnchor, detailX, pinned = false, restoringFocus = false, hoverTimer, hideTimer;

    function closeDetails(restoreFocus = false) {
      clearTimeout(hoverTimer);
      clearTimeout(hideTimer);
      if (!activeDetail) return;
      const anchor = detailAnchor;
      restoringFocus = true;
      if (nativePopover && detailPanel.matches(":popover-open")) detailPanel.hidePopover();
      detailPanel.hidden = true;
      detailAnchor?.setAttribute("aria-expanded", "false");
      activeDetail = detailAnchor = null;
      detailX = undefined;
      pinned = false;
      if (restoreFocus && anchor?.isConnected) {
        anchor.focus({ preventScroll: true });
      }
      restoringFocus = false;
    }
    function positionDetails() {
      const row = detailAnchor?.closest("tr");
      if (!row || detailPanel.hidden) return;
      const rect = row.getBoundingClientRect();
      const margin = 12, gap = 8;
      // The pointer is inside this row: placing the panel beneath the complete
      // row also keeps it below the pointer. Freeze x when opening, not on move.
      const top = rect.bottom + gap;
      detailPanel.style.maxHeight = `${Math.max(80, Math.min(720, innerHeight - margin - top))}px`;
      const width = detailPanel.offsetWidth;
      const left = Math.max(margin, Math.min(detailX + gap, innerWidth - width - margin));
      detailPanel.style.left = `${left}px`;
      detailPanel.style.top = `${top}px`;
    }
    function openDetails(node, anchor, pin = false, pointerX) {
      clearTimeout(hoverTimer);
      clearTimeout(hideTimer);
      if (pinned && !pin) return;
      const changedNode = activeDetail !== node;
      if (changedNode) detailX = pointerX ?? anchor.getBoundingClientRect().left;
      detailAnchor?.setAttribute("aria-expanded", "false");
      activeDetail = node;
      detailAnchor = anchor;
      pinned = pin;
      anchor.setAttribute("aria-expanded", "true");
      const heading = el("div", "apv-popover-heading");
      const title = el("strong", "", node.id);
      title.id = "awmf-element-details-title";
      const actions = el("div", "apv-popover-actions");
      const pinButton = el("button", "apv-popover-pin");
      pinButton.type = "button";
      pinButton.setAttribute("aria-label", "Pin element details");
      const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
      svg.setAttribute("viewBox", "0 0 24 24");
      svg.setAttribute("aria-hidden", "true");
      svg.setAttribute("focusable", "false");
      const pinPath = document.createElementNS(svg.namespaceURI, "path");
      pinPath.setAttribute("d", "M9 3h6l-1 7 4 4v3H6v-3l4-4-1-7ZM12 17v5");
      pinPath.setAttribute("fill", "none");
      pinPath.setAttribute("stroke", "currentColor");
      pinPath.setAttribute("stroke-width", "1.7");
      pinPath.setAttribute("stroke-linejoin", "round");
      pinPath.setAttribute("stroke-linecap", "round");
      svg.append(pinPath);
      pinButton.append(svg);
      function updatePin() {
        pinButton.setAttribute("aria-pressed", String(pinned));
        pinButton.title = pinned ? "Unpin element details" : "Pin element details";
      }
      updatePin();
      pinButton.addEventListener("click", event => {
        clearTimeout(hoverTimer);
        clearTimeout(hideTimer);
        pinned = !pinned;
        updatePin();
        if (!pinned) {
          if (event.detail) pinButton.blur();
          scheduleClose();
        }
      });
      const close = el("button", "apv-popover-close", "×");
      close.type = "button";
      close.setAttribute("aria-label", "Close element details");
      close.addEventListener("click", () => closeDetails(true));
      actions.append(pinButton, close);
      heading.append(title, actions);
      detailPanel.replaceChildren(heading);
      function section(label, changed, content) {
        const section = el("section", `apv-detail-section${state.mode === "hybrid" && !changed ? " apv-inherited" : ""}`);
        const heading = el("div", "apv-detail-heading", label);
        heading.setAttribute("role", "heading");
        heading.setAttribute("aria-level", "5");
        section.append(heading, content);
        detailPanel.append(section);
      }
      const e = node.element;
      if (e.definition || e.short) section("Definition", own(node.diff, e.definition ? "definition" : "short"), el("p", "", e.definition || e.short));
      for (const [key, value] of values(e)) {
        if (/^(fixed|pattern)[A-Z]/.test(key)) section(key.startsWith("fixed") ? "Fixed value" : "Pattern", own(node.diff, key), valueBlock(value));
      }
      if (e.binding?.valueSet) {
        const binding = el("p");
        binding.append(canonicalLink(e.binding.valueSet), document.createTextNode(` (${e.binding.strength})`));
        if (e.binding.description) binding.append(el("span", "", ` — ${e.binding.description}`));
        section("Binding", own(node.diff, "binding"), binding);
      }
      if (e.slicing) section("Slicing", own(node.diff, "slicing"), valueBlock(e.slicing));
      if (e.constraint?.length) {
        const constraints = el("div", "apv-invariants");
        for (const constraint of e.constraint) {
          const specified = node.diff?.constraint?.some(c => c.key === constraint.key) || constraint.source === model.resource.url;
          const item = el("section", `apv-invariant${state.mode === "hybrid" && !specified ? " apv-inherited" : ""}`);
          item.append(el("strong", "", constraint.key), el("p", "", constraint.human || ""));
          if (constraint.expression) item.append(valueBlock(constraint.expression));
          constraints.append(item);
        }
        section("Constraints", true, constraints);
      }
      const definitionLink = safeLink("Full element definition", `${filename}-definitions.html#${encodeURIComponent(node.id)}`);
      detailPanel.append(definitionLink);
      detailPanel.hidden = false;
      if (nativePopover && !detailPanel.matches(":popover-open")) detailPanel.showPopover();
      positionDetails();
      if (changedNode) detailPanel.scrollTop = 0;
    }
    function scheduleClose() {
      clearTimeout(hoverTimer);
      clearTimeout(hideTimer);
      hideTimer = setTimeout(() => {
        if (!pinned && !detailPanel.matches(":hover") && !detailAnchor?.closest("tr")?.matches(":hover") &&
            !detailPanel.contains(document.activeElement) && document.activeElement !== detailAnchor) closeDetails();
      }, 200);
    }
    function detailTrigger(trigger, node) {
      trigger.setAttribute("aria-controls", detailPanel.id);
      trigger.setAttribute("aria-haspopup", "dialog");
      trigger.setAttribute("aria-expanded", "false");
      trigger.addEventListener("focus", () => {
        if (!restoringFocus && trigger.matches(":focus-visible")) openDetails(node, trigger);
      });
      trigger.addEventListener("blur", scheduleClose);
    }
    detailPanel.addEventListener("pointerenter", () => clearTimeout(hideTimer));
    detailPanel.addEventListener("pointerleave", scheduleClose);
    detailPanel.addEventListener("focusout", scheduleClose);
    document.addEventListener("pointerdown", event => {
      if (activeDetail && !pinned && !detailPanel.contains(event.target) && !body.contains(event.target)) closeDetails();
    });
    document.addEventListener("keydown", event => {
      if (event.key === "Escape" && activeDetail) { event.preventDefault(); closeDetails(true); }
    });
    global.addEventListener("resize", positionDetails);
    global.addEventListener("scroll", event => {
      if (!activeDetail || detailPanel.contains(event.target)) return;
      const rect = detailAnchor.closest("tr").getBoundingClientRect();
      const viewport = scroller.getBoundingClientRect();
      const visible = rect.bottom > Math.max(0, viewport.top) && rect.top < Math.min(innerHeight, viewport.bottom) &&
        rect.right > Math.max(0, viewport.left) && rect.left < Math.min(innerWidth, viewport.right);
      if (!pinned) closeDetails();
      else if (visible) positionDetails();
    }, true);

    function render() {
      closeDetails();
      viewer.dataset.mode = state.mode;
      const panel = panels.get(state.mode);
      if (tabContent.parentElement !== panel) panel.append(tabContent);
      common.disabled = state.mode === "diff";
      description.textContent = {
        hybrid: "Effective snapshot with this profile’s changes highlighted. Excluded elements remain visible.",
        snapshot: "Effective structure, including inherited constraints. Excluded elements are hidden.",
        diff: "Elements touched by this profile and their parent paths."
      }[state.mode];
      const shown = visibleNodes(model, state);
      const lastChild = new Map();
      for (const node of shown) if (node.parent) lastChild.set(node.parent.id, node.id);
      const fragment = document.createDocumentFragment();
      for (const node of shown) {
        const e = node.element;
        const row = el("tr", `${node.excluded ? "apv-excluded " : ""}${node.missing ? "apv-missing" : ""}`);
        row.dataset.elementId = node.id;
        const nameCell = el("td", "apv-name");
        const lines = el("span", "apv-tree-lines");
        lines.setAttribute("aria-hidden", "true");
        function stem(depth, className) {
          const line = el("span", className);
          line.style.insetInlineStart = `${depth * 18 + 7}px`;
          lines.append(line);
        }
        // Ancestor continuations span the complete row, including wrapped details.
        for (let ancestor = node.parent; ancestor?.parent; ancestor = ancestor.parent) {
          if (lastChild.get(ancestor.parent.id) !== ancestor.id) stem(ancestor.parent.depth, "apv-tree-stem");
        }
        if (node.parent) {
          const last = lastChild.get(node.parent.id) === node.id;
          stem(node.parent.depth, `apv-tree-stem${last ? " apv-tree-end" : ""}`);
          const branch = el("span", `apv-tree-branch${node.children.length ? "" : " apv-tree-leaf"}`);
          branch.style.insetInlineStart = `${node.parent.depth * 18 + 7}px`;
          lines.append(branch);
        }
        if (lastChild.has(node.id)) stem(node.depth, "apv-tree-stem apv-tree-child");
        const name = el("div", "apv-name-inner");
        name.style.paddingInlineStart = `${node.depth * 18}px`;
        const toggle = el(node.children.length ? "button" : "span", "apv-toggle", node.children.length ? (state.collapsed.has(node.id) && !state.query ? "▸" : "▾") : "");
        if (node.children.length) {
          toggle.type = "button";
          toggle.setAttribute("aria-label", `Toggle ${node.id}`);
          toggle.setAttribute("aria-expanded", String(!state.collapsed.has(node.id) || !!state.query));
          toggle.addEventListener("click", () => {
            state.collapsed.has(node.id) ? state.collapsed.delete(node.id) : state.collapsed.add(node.id);
            render();
            Array.from(body.querySelectorAll("tr")).find(r => r.dataset.elementId === node.id)?.querySelector("button")?.focus();
          });
        }
        const icon = elementIcon(node, model.resource);
        const glyph = el("img", `apv-icon${node.changed ? "" : " apv-icon-inherited"}`);
        glyph.src = icon.file;
        glyph.alt = "";
        glyph.title = icon.title;
        glyph.width = glyph.height = 16;
        const label = el("a", `apv-element-label${state.mode === "hybrid" && !node.changed ? " apv-inherited" : ""}`,
          e.sliceName || e.path.split(".").pop());
        label.href = `${filename}-definitions.html#${encodeURIComponent(node.id)}`;
        label.title = node.id;
        detailTrigger(label, node);
        name.append(toggle, glyph, label);
        if (e.sliceName) name.append(el("small", "apv-slice-label", e.path.split(".").pop()));
        if (node.missing) name.append(el("span", "apv-warning", " ⚠ snapshot"));
        nameCell.append(lines, name);
        const flags = el("td", "apv-flags");
        for (const [key, text, title] of [["mustSupport", "S", "Must support"], ["isModifier", "?!", "Modifier"], ["isSummary", "Σ", "Summary"]]) {
          if (e[key]) { const flag = el("span", fieldClass(node, [key]), text); flag.title = title; flags.append(flag); }
        }
        if (e.constraint?.length) { const flag = el("span", fieldClass(node, ["constraint"]), "C"); flag.title = "Constraints; see element details"; flags.append(flag); }
        const card = el("td", `apv-card ${fieldClass(node, ["min", "max"])}`, `${e.min ?? "–"}..${e.max ?? "–"}`);
        card.title = "Effective cardinality from the snapshot";
        const types = el("td", `apv-types ${fieldClass(node, ["type", "contentReference"])}`);
        for (const t of e.type || []) {
          const typeLine = el("div");
          typeLine.append(el("span", "", typeName(t)));
          const profiles = [...new Set([...(t.profile || []), ...(t.targetProfile || [])].map(canonical))];
          if (profiles.length) {
            typeLine.append(document.createTextNode("("));
            profiles.forEach((url, index) => {
              if (index) typeLine.append(document.createTextNode(" | "));
              typeLine.append(canonicalLink(url));
            });
            typeLine.append(document.createTextNode(")"));
          }
          types.append(typeLine);
        }
        if (e.contentReference) types.append(safeLink(e.contentReference, `${filename}-definitions.html${e.contentReference}`));
        const desc = el("td", "apv-details");
        const details = el("button", "apv-detail-trigger");
        details.type = "button";
        details.setAttribute("aria-label", `Details for ${node.id}`);
        if (e.short) {
          const summary = el("span", fieldClass(node, ["short"]), e.short);
          summary.id = `awmf-short-${encodeURIComponent(node.id)}`;
          details.setAttribute("aria-describedby", summary.id);
          details.append(summary);
        }
        detailTrigger(details, node);
        details.addEventListener("click", event => {
          if (activeDetail === node && pinned) closeDetails();
          else {
            openDetails(node, details, true, event.detail ? event.clientX : undefined);
            if (event.detail === 0) detailPanel.querySelector(".apv-popover-close").focus();
          }
        });
        desc.append(details);
        let hoverX;
        row.addEventListener("pointerenter", event => {
          if (event.pointerType !== "mouse") return;
          hoverX = event.clientX;
          clearTimeout(hideTimer);
          clearTimeout(hoverTimer);
          hoverTimer = setTimeout(() => openDetails(node, details, false, hoverX), 250);
        });
        row.addEventListener("pointermove", event => {
          if (event.pointerType === "mouse") hoverX = event.clientX;
        });
        row.addEventListener("pointerleave", scheduleClose);
        row.append(nameCell, flags, card, types, desc);
        fragment.append(row);
      }
      body.replaceChildren(fragment);
      if (!shown.length) {
        const cell = el("td", "apv-empty", "No matching elements in this view.");
        cell.colSpan = 5;
        const row = el("tr"); row.append(cell); body.append(row);
      }
      count.textContent = `${shown.length} / ${model.nodes.length} elements`;
    }

    const fallback = el("details", "apv-original");
    fallback.append(el("summary", "", "Publisher tables, terminology bindings and constraints"));
    original.before(viewer, fallback);
    fallback.append(original);
    // Use the same jQuery UI tabs and theme as the Publisher's original tables.
    global.jQuery(tabs).tabs({
      active: Array.from(panels.keys()).indexOf(state.mode),
      activate: (_event, ui) => {
        state.mode = ui.newPanel[0].dataset.mode;
        remember(state);
        render();
      }
    });
    // Existing links to Publisher tabs must still reveal their targets.
    function revealOriginal() {
      const target = document.getElementById(location.hash.slice(1));
      if (target && original.contains(target)) fallback.open = true;
    }
    global.addEventListener("hashchange", revealOriginal);
    revealOriginal();
    render();
  }

  const canonicalPaths = new Map();
  async function fetchJSON(url, timeout = 20000) {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), timeout);
    try {
      const response = await fetch(url, { signal: controller.signal });
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      return await response.json();
    } finally { clearTimeout(timer); }
  }
  async function loadProfile() {
    // Current fhir2 template publishes JSON in the IG root, HTML in a language folder.
    // Resolve against this script's assets root so deployment below a URL prefix works.
    const assetsRoot = new URL("../../", viewerScript.src);
    const candidates = [new URL(`../${filename}.json`, assetsRoot), new URL(`${filename}.json`, assetsRoot)];
    let resource, source, lastError;
    for (const candidate of candidates) {
      try {
        const data = await fetchJSON(candidate);
        if (data.resourceType !== "StructureDefinition") throw new Error("Expected a StructureDefinition");
        resource = data; source = candidate; break;
      } catch (error) { lastError = error; }
    }
    if (!resource) throw lastError;
    return { resource, source };
  }
  async function loadCanonicalPaths(source) {
    // spec.internals supplies the Publisher's canonical -> local page resolution.
    try {
      const internals = await fetchJSON(new URL("spec.internals", source), 3000);
      for (const [canonical, path] of values(internals.paths)) canonicalPaths.set(canonical, new URL(path, source).href);
      for (const link of document.querySelectorAll(".apv a[data-canonical]")) {
        const local = canonicalPaths.get(link.dataset.canonical);
        if (local) link.href = local;
      }
    } catch (_) { /* Canonical links remain usable without the optional index. */ }
  }
  async function start() {
    const original = document.querySelector("#tabs");
    if (!profilePage || !original || !document.getElementById("profile")) return;
    const { resource, source } = await profileRequest;
    mount(buildModel(resource), original, filename);
    // Optional canonical resolution must not delay the first structure render.
    loadCanonicalPaths(source);
  }
  function run() {
    start().catch(error => {
      console.warn("AWMF profile viewer: keeping Publisher tables", error);
      const original = document.querySelector("#tabs");
      if (original) {
        const fallback = original.closest(".apv-original");
        if (fallback) { fallback.before(original); fallback.remove(); }
        document.getElementById("awmf-profile-viewer")?.remove();
        document.getElementById("awmf-element-details")?.remove();
        original.before(el("p", "apv-warning", "Interactive structure view unavailable. The Publisher tables below remain available."));
      }
    }).finally(() => document.documentElement.classList.remove("apv-loading"));
  }
  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", run);
  else run();
})(typeof window !== "undefined" ? window : globalThis);
