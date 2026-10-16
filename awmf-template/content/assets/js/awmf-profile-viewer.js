/* Enhance the profile table emitted by Liquid. The Publisher supplies every row,
 * field and detail: browser code only handles navigation and interaction. */
(function () {
  "use strict";

  function enhance() {
    const viewer = document.getElementById("awmf-profile-viewer");
    if (!viewer || viewer.dataset.enhanced) return;
    const body = viewer.querySelector(".apv-table tbody");
    const scroller = viewer.querySelector(".apv-scroll");
    const panel = viewer.querySelector("#awmf-structure-panel");
    const tabs = Array.from(viewer.querySelectorAll('.apv-mode-tabs a[data-mode]'));
    const common = viewer.querySelector(".apv-common input");
    const search = viewer.querySelector(".apv-search");
    const count = viewer.querySelector(".apv-count");
    const empty = viewer.querySelector(".apv-empty-row");
    const nodes = Array.from(body.querySelectorAll("tr[data-element-id]"), row => ({
      row, id: row.dataset.elementId, children: [],
      changedBelow: row.dataset.changedBelow === "true",
      common: row.dataset.common === "true",
      excluded: row.dataset.excluded === "true",
      toggle: row.querySelector("button.apv-toggle"),
      details: row.querySelector("template.apv-detail-content")
    }));
    const byId = new Map(nodes.map(node => [node.id, node]));
    const roots = [];
    for (const node of nodes) {
      node.parent = byId.get(node.row.dataset.parentId);
      (node.parent ? node.parent.children : roots).push(node);
    }
    const branches = nodes.filter(node => node.parent && node.children.length).map(node => node.id);
    const state = {
      mode: viewer.dataset.mode || "hybrid", showCommon: common.checked,
      query: "", collapsed: new Set(branches)
    };
    for (const tab of tabs) {
      const item = tab.parentElement;
      item.addEventListener("pointerenter", () => item.classList.add("ui-state-hover"));
      item.addEventListener("pointerleave", () => item.classList.remove("ui-state-hover"));
      tab.addEventListener("focus", () => item.classList.add("ui-state-focus"));
      tab.addEventListener("blur", () => item.classList.remove("ui-state-focus"));
    }

    const detailPanel = document.getElementById("awmf-element-details");
    const detailTitle = detailPanel.querySelector("#awmf-element-details-title");
    const detailContent = detailPanel.querySelector(".apv-popover-content");
    const pinButton = detailPanel.querySelector(".apv-popover-pin");
    const closeButton = detailPanel.querySelector(".apv-popover-close");
    const nativePopover = typeof detailPanel.showPopover === "function";
    if (nativePopover) detailPanel.setAttribute("popover", "manual");
    let activeDetail, detailAnchor, detailX, hoverX, pinned = false;
    let restoringFocus = false, hoverTimer, hideTimer;

    function closeDetails(restoreFocus = false) {
      clearTimeout(hoverTimer);
      clearTimeout(hideTimer);
      if (!activeDetail) return;
      const anchor = detailAnchor;
      restoringFocus = true;
      if (nativePopover && detailPanel.matches(":popover-open")) detailPanel.hidePopover();
      detailPanel.hidden = true;
      detailPanel.dataset.open = "false";
      anchor.setAttribute("aria-expanded", "false");
      activeDetail = detailAnchor = null;
      pinned = false;
      if (restoreFocus && anchor.isConnected) anchor.focus({ preventScroll: true });
      restoringFocus = false;
    }

    function positionDetails() {
      const row = detailAnchor?.closest("tr");
      if (!row || detailPanel.hidden) return;
      const rect = row.getBoundingClientRect();
      const margin = 12, gap = 8;
      const below = innerHeight - margin - rect.bottom - gap;
      const above = rect.top - margin - gap;
      const placeAbove = below < 180 && above > below;
      const available = placeAbove ? above : below;
      detailPanel.style.maxHeight = `${Math.max(80, Math.min(720, available))}px`;
      const left = Math.max(margin, Math.min(detailX + gap, innerWidth - detailPanel.offsetWidth - margin));
      const top = placeAbove ? Math.max(margin, rect.top - gap - detailPanel.offsetHeight) : rect.bottom + gap;
      detailPanel.style.left = `${left}px`;
      detailPanel.style.top = `${top}px`;
    }

    function updatePin() {
      pinButton.setAttribute("aria-pressed", String(pinned));
      const label = pinned ? "Unpin element details" : "Pin element details";
      pinButton.setAttribute("aria-label", label);
      pinButton.title = label;
    }

    function openDetails(node, anchor, pin = false, pointerX) {
      clearTimeout(hoverTimer);
      clearTimeout(hideTimer);
      if (!node?.details || (pinned && !pin)) return;
      const changedNode = activeDetail !== node;
      if (changedNode) {
        detailX = pointerX ?? anchor.getBoundingClientRect().left;
        detailTitle.textContent = node.id;
        detailContent.replaceChildren(node.details.content.cloneNode(true));
      }
      detailAnchor?.setAttribute("aria-expanded", "false");
      activeDetail = node;
      detailAnchor = anchor;
      pinned = pin;
      anchor.setAttribute("aria-expanded", "true");
      detailPanel.dataset.mode = state.mode;
      updatePin();
      detailPanel.hidden = false;
      detailPanel.dataset.open = "true";
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

    function update() {
      closeDetails();
      viewer.dataset.mode = state.mode;
      for (const tab of tabs) {
        const selected = tab.dataset.mode === state.mode;
        tab.setAttribute("aria-selected", String(selected));
        tab.tabIndex = selected ? 0 : -1;
        tab.parentElement.classList.toggle("ui-tabs-active", selected);
        tab.parentElement.classList.toggle("ui-state-active", selected);
        if (selected) panel.setAttribute("aria-labelledby", tab.id);
      }
      common.disabled = state.mode === "diff";
      const term = state.query.trim().toLowerCase();
      const matches = new Set();
      if (term) {
        for (const node of nodes) {
          if (node.searchText === undefined) {
            const canonicalText = [node.row, node.details?.content].filter(Boolean).flatMap(content =>
              Array.from(content.querySelectorAll("[data-canonical]"), link => link.dataset.canonical)).join(" ");
            node.searchText = `${node.id} ${node.row.textContent} ${node.details?.content.textContent || ""} ${canonicalText}`.toLowerCase();
          }
          if (!node.searchText.includes(term)) continue;
          for (let ancestor = node; ancestor; ancestor = ancestor.parent) matches.add(ancestor.id);
        }
      }
      for (const node of nodes) node.visible = false;
      const pending = roots.slice();
      while (pending.length) {
        const node = pending.pop();
        if (state.mode === "snapshot" && node.excluded) continue;
        if (state.mode === "diff" && node.parent && !node.changedBelow) continue;
        if (state.mode !== "diff" && node.parent && !state.showCommon && node.common) continue;
        if (term && !matches.has(node.id)) continue;
        node.visible = true;
        if (term || !state.collapsed.has(node.id)) pending.push(...node.children);
      }
      let visibleCount = 0;
      for (const node of nodes) {
        node.row.hidden = !node.visible;
        node.row.classList.remove("apv-initial-hidden");
        if (node.visible) visibleCount++;
        if (node.toggle) {
          const expanded = !!term || !state.collapsed.has(node.id);
          node.toggle.setAttribute("aria-expanded", String(expanded));
          node.toggle.setAttribute("aria-label", `${expanded ? "Collapse" : "Expand"} ${node.id}`);
          node.toggle.textContent = expanded ? "▾" : "▸";
        }
      }
      empty.hidden = visibleCount !== 0;
      empty.dataset.visible = String(visibleCount === 0);
      count.textContent = `${visibleCount} / ${nodes.length} elements`;
    }

    function chooseMode(mode) {
      if (!["diff", "snapshot", "hybrid"].includes(mode)) return;
      state.mode = mode;
      update();
    }
    function followHash() {
      const mode = /^#awmf-structure-(diff|snapshot|hybrid)$/.exec(location.hash)?.[1] || {
        "#tabs-diff": "diff", "#tabs-snap": "snapshot", "#tabs-key": "hybrid"
      }[location.hash];
      if (mode && mode !== state.mode) chooseMode(mode);
      if (/^#(?:tx|inv(?:-|$))/.test(location.hash)) {
        const publisher = document.querySelector('.apv-publisher-link a');
        if (publisher) {
          publisher.hash = location.hash;
          publisher.scrollIntoView({ block: "nearest" });
        }
      }
    }

    viewer.addEventListener("click", event => {
      const tab = event.target.closest('.apv-mode-tabs a[data-mode]');
      if (tab) {
        event.preventDefault();
        chooseMode(tab.dataset.mode);
        return;
      }
      const button = event.target.closest("button");
      if (!button) return;
      const row = button.closest("tr[data-element-id]");
      const node = row && byId.get(row.dataset.elementId);
      if (button.classList.contains("apv-toggle") && node) {
        state.collapsed.has(node.id) ? state.collapsed.delete(node.id) : state.collapsed.add(node.id);
        update();
      } else if (button.dataset.action === "expand" || button.dataset.action === "collapse") {
        state.collapsed = new Set(button.dataset.action === "collapse" ? branches : []);
        update();
      } else if (button.classList.contains("apv-detail-trigger") && node) {
        if (activeDetail === node && pinned) closeDetails();
        else {
          openDetails(node, button, true, event.detail ? event.clientX : undefined);
          if (!event.detail) closeButton.focus();
        }
      }
    });
    viewer.addEventListener("keydown", event => {
      const tab = event.target.closest('.apv-mode-tabs a[data-mode]');
      if (!tab) return;
      const index = tabs.indexOf(tab);
      const rtl = getComputedStyle(tab).direction === "rtl";
      let next;
      if (event.key === "Home") next = 0;
      else if (event.key === "End") next = tabs.length - 1;
      else if (event.key === "ArrowRight") next = (index + (rtl ? -1 : 1) + tabs.length) % tabs.length;
      else if (event.key === "ArrowLeft") next = (index + (rtl ? 1 : -1) + tabs.length) % tabs.length;
      else if (event.key === " ") next = index;
      else return;
      event.preventDefault();
      tabs[next].focus();
      tabs[next].click();
    });
    common.addEventListener("change", () => { state.showCommon = common.checked; update(); });
    search.addEventListener("input", () => { state.query = search.value; update(); });

    body.addEventListener("pointerover", event => {
      const row = event.target.closest("tr[data-element-id]");
      if (!row || row.contains(event.relatedTarget) || event.pointerType !== "mouse") return;
      clearTimeout(hideTimer);
      clearTimeout(hoverTimer);
      hoverX = event.clientX;
      const node = byId.get(row.dataset.elementId);
      hoverTimer = setTimeout(() => openDetails(node, row.querySelector(".apv-detail-trigger"), false, hoverX), 250);
    });
    body.addEventListener("pointermove", event => { if (event.pointerType === "mouse") hoverX = event.clientX; });
    body.addEventListener("pointerout", event => {
      const row = event.target.closest("tr[data-element-id]");
      if (row && !row.contains(event.relatedTarget)) scheduleClose();
    });
    body.addEventListener("focusin", event => {
      const anchor = event.target.closest(".apv-detail-trigger, .apv-element-label");
      if (anchor && !restoringFocus && anchor.matches(":focus-visible")) {
        openDetails(byId.get(anchor.closest("tr").dataset.elementId), anchor);
      }
    });
    body.addEventListener("focusout", scheduleClose);
    detailPanel.addEventListener("pointerenter", () => clearTimeout(hideTimer));
    detailPanel.addEventListener("pointerleave", scheduleClose);
    detailPanel.addEventListener("focusout", scheduleClose);
    closeButton.addEventListener("click", () => closeDetails(true));
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
    document.addEventListener("pointerdown", event => {
      if (activeDetail && !pinned && !detailPanel.contains(event.target) && !body.contains(event.target)) closeDetails();
    });
    document.addEventListener("keydown", event => {
      if (event.key === "Escape" && activeDetail) { event.preventDefault(); closeDetails(true); }
    });
    window.addEventListener("hashchange", followHash);
    window.addEventListener("resize", positionDetails);
    window.addEventListener("scroll", event => {
      if (!activeDetail || detailPanel.contains(event.target)) return;
      const rect = detailAnchor.closest("tr").getBoundingClientRect();
      const viewport = scroller.getBoundingClientRect();
      const visible = rect.bottom > Math.max(0, viewport.top) && rect.top < Math.min(innerHeight, viewport.bottom) &&
        rect.right > Math.max(0, viewport.left) && rect.left < Math.min(innerWidth, viewport.right);
      if (!pinned) closeDetails();
      else if (visible) positionDetails();
    }, true);
    // The default view is already rendered in the HTML; do not redraw it on load.
    viewer.dataset.enhanced = "true";
    followHash();
  }

  if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", enhance, { once: true });
  else enhance();
})();
