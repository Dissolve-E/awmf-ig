#!/usr/bin/env python3
"""
Generate intro notes and reference lists for profiles, value sets, and code systems.
"""
from __future__ import annotations

import json
import os
import re
import sys
from pathlib import Path
from typing import Dict

import yaml

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

def sanitize_link_name(name: str) -> str:
    """Remove single/double quotes from a link name."""
    return re.sub(r"[\"']", "", name)


def ref_to_filename(ref: str) -> str:
    """Convert a FHIR reference (e.g. ValueSet/foo) to a generated filename."""
    return ref.replace("/", "-") + ".html"


def ensure_dir(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def write_reference_includes(
    fname: Path, heading: str, link_dict: Dict[str, str], prefix: str
) -> None:
    """Create a markdown include list for the given prefix (VS: or CS:)."""
    with fname.open("w", encoding="utf-8") as f:
        f.write(f"### {heading}\n\n")
        for name in sorted(link_dict):
            if not name.startswith(prefix):
                continue
            include_type = "valueset" if prefix == "VS:" else "codesystem"
            f.write(
                f"{{% include {include_type}-reference.md "
                f"name='{name}' %}}\n"
            )


# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

BASE = Path(os.path.realpath(__file__)).parent
INPUT = BASE / "input"
OUTPUT_INTRO = INPUT / "intro-notes"
DATA = INPUT / "data"
INCLUDES = INPUT / "includes"
PAGECONTENT = INPUT / "pagecontent"

IG_YML = DATA / "ig.yml"
LINKLIST_MD = INCLUDES / "link-list-generated.md"
PROFILES_MD = PAGECONTENT / "profiles-generated.md"
VALUESETS_MD = PAGECONTENT / "valuesets-generated.md"
CODESYSTEMS_MD = PAGECONTENT / "codesystems-generated.md"

# ---------------------------------------------------------------------------
# Convert ig.json → ig.yml if needed
# ---------------------------------------------------------------------------

if not IG_YML.exists():
    print("No ig.yml found – trying to convert JSON ImplementationGuide …")
    gen_res = BASE / "fsh-generated" / "resources"
    ig_files = list(gen_res.glob("ImplementationGuide-*.json"))
    if len(ig_files) != 1:
        sys.exit("Error: expected exactly one ImplementationGuide JSON file.")
    IG_YML.parent.mkdir(parents=True, exist_ok=True)
    with ig_files[0].open() as j, IG_YML.open("w") as y:
        yaml.safe_dump(json.load(j), y)
    print(f"Converted {ig_files[0].name} → {IG_YML.name}")

# ---------------------------------------------------------------------------
# Prepare output dirs
# ---------------------------------------------------------------------------

ensure_dir(OUTPUT_INTRO)
ensure_dir(INCLUDES)
ensure_dir(PAGECONTENT)

# ---------------------------------------------------------------------------
# Load ImplementationGuide
# ---------------------------------------------------------------------------

with IG_YML.open() as f:
    ig = yaml.safe_load(f)

# ---------------------------------------------------------------------------
# Template for intro-notes
# ---------------------------------------------------------------------------

TEMPLATE_MD = """{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
"""

# ---------------------------------------------------------------------------
# Link lists
# ---------------------------------------------------------------------------

linklist: Dict[str, str] = {}
linklist_general = {
    "SNOMEDCT": "http://snomed.info/sct",
    "LOINC": "http://loinc.org/",
    "UCUM": "http://unitsofmeasure.org",
    "VSdataAbsentReason": "http://hl7.org/fhir/R4/valueset-data-absent-reason.html",
    "CEOSYS": "https://covid-evidenz.de/",
    "NUM": "https://www.netzwerk-universitaetsmedizin.de/",
    "EMBonFHIR": "https://confluence.hl7.org/display/CDS/EBMonFHIR",
    "COCHRANELD": "https://data.cochrane.org/concepts/",
}

# ---------------------------------------------------------------------------
# Process IG resources
# ---------------------------------------------------------------------------

for res in ig["definition"]["resource"]:
    ref = res["reference"]["reference"]  # e.g. StructureDefinition/Foo
    res_type = ref.split("/")[0]         # StructureDefinition
    link_name = sanitize_link_name("".join(filter(str.isupper, res_type)) + ":" + res["name"])

    # Link destination
    linklist[link_name] = ref_to_filename(ref)

    # Intro note only for SD/Questionnaire
    if res_type not in ("StructureDefinition", "Questionnaire"):
        continue
    intro_file = OUTPUT_INTRO / (ref.replace("/", "-") + "-intro.md")
    if not intro_file.exists():
        with intro_file.open("w", encoding="utf-8") as md:
            md.write(TEMPLATE_MD)

# merge in general links
linklist.update(linklist_general)

# ---------------------------------------------------------------------------
# Write link-list markdown
# ---------------------------------------------------------------------------

with LINKLIST_MD.open("w", encoding="utf-8") as f:
    def dump(prefix: str) -> None:
        for k, v in sorted(linklist.items()):
            if k.startswith(prefix):
                f.write(f"[{k}]: {v}\n")
        f.write("\n")

    for p in ("VS:", "CS:", "SD:", "QU:"):
        dump(p)
    # general links already included (no prefix filter)

print(f"Wrote {LINKLIST_MD.relative_to(BASE)}")

# ---------------------------------------------------------------------------
# Profiles pagecontent (unchanged)
# ---------------------------------------------------------------------------

with PROFILES_MD.open("w", encoding="utf-8") as f:
    f.write("### Profiles\n\n")
    for k, v in sorted(linklist.items()):
        if k.startswith(("SD:", "QU:")):
            res_type = "questionnaire" if v.startswith("Questionnaire-") else "profile"
            f.write(f"{{% include {res_type}-reference.md name='{k}' %}}\n")

print(f"Wrote {PROFILES_MD.relative_to(BASE)}")

# ---------------------------------------------------------------------------
# Separate ValueSet & CodeSystem page-content files
# ---------------------------------------------------------------------------

write_reference_includes(VALUESETS_MD, "Value Sets", linklist, "VS:")
print(f"Wrote {VALUESETS_MD.relative_to(BASE)}")

write_reference_includes(CODESYSTEMS_MD, "Code Systems", linklist, "CS:")
print(f"Wrote {CODESYSTEMS_MD.relative_to(BASE)}")

print("Done ✅")
