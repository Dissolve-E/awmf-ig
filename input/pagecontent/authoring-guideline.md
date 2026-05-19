{% include variables.md %}

### Authoring a Guideline

This page walks you through building a `Guideline` resource — the top-level document that represents a single clinical practice guideline. The page assumes you can read JSON and FHIR REST APIs but does **not** assume FHIR expertise. Concepts like *Composition*, *section*, *extension* are introduced as they come up.

If you are looking for a quick "where does X go?" reference, jump to the [Cheat Sheet](cheat-sheet.html). Worked end-to-end examples in FSH live under [`input/fsh/examples/`](https://github.com/Dissolve-E/awmf-ig/tree/main/input/fsh/examples) in the source repository.

#### What you are building

A `Guideline` in this IG is a constrained FHIR [Composition]({{ fhir_base_url }}composition.html). A Composition is a document — a coherent set of clinically meaningful sections (introduction, methods, recommendations, references, …) bundled into one resource, identified by a single author or set of authors, with a title, a status and a version.

The profile that constrains this Composition is named **Guideline** and is referenced by the canonical URL

```
http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline
```

Every guideline instance you create MUST declare that profile in `meta.profile` so validators know which rules apply. The minimum viable Guideline resource looks like this:

```json
{
  "resourceType": "Composition",
  "id": "MyGuideline",
  "meta": {
    "profile": ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline"]
  },
  "title": "My Example Guideline",
  "version": "1.0",
  "status": "final",
  "date": "2026-01-15",
  "identifier": [
    { "use": "official", "system": "http://fhir.awmf.org/guidelines", "value": "001-001" }
  ],
  "author": [ { "reference": "PractitionerRole/SomeAuthor" } ],
  "type": {
    "coding": [
      { "system": "https://fevir.net/resources/CodeSystem/179423", "code": "Guideline" }
    ]
  }
}
```

Everything else is optional or grows out of these fields. The rest of this page explains how to fill in the meaningful pieces.

A note on the difference between this profile and the [Guideline Registry Record](authoring-registry-record.html): the **Guideline** carries the *content* of the guideline (its text, sections, recommendations); the **Guideline Registry Record** carries the *registry metadata* about the guideline (its AWMF class, attachments, contacts, release type). They link to each other but are separate resources.

#### Required metadata

| Concept                | JSON path                                           | Cardinality | Notes                                                                                              |
| ---------------------- | --------------------------------------------------- | ----------- | -------------------------------------------------------------------------------------------------- |
| Title                  | `title`                                             | 1..1        | Human-readable title.                                                                              |
| Version                | `version`                                           | 1..1        | Must match `major.minor` (e.g. `"3.0"`, not `"3.0.0"`, not `"v3"`, not `"third version"`).         |
| Status                 | `status`                                            | 1..1        | One of: `preliminary`, `final`, `amended`, `entered-in-error`, `deprecated`, `registered`.         |
| Modification date      | `date`                                              | 1..1        | The date this Composition resource was last edited. **Not** the publication, approval or review date — those are separate extensions (see below). |
| AWMF register number   | `identifier[…].value` with `system = "http://fhir.awmf.org/guidelines"` and `use = "official"` | 0..1 | The AWMF guideline number, e.g. `"020-013"`. Optional, but if present must be marked `use = "official"` and there must be exactly one official identifier overall. |
| At least one author    | `author[].reference`                                | 1..*        | A reference to a Practitioner, PractitionerRole or Organization.                                   |

##### Why `major.minor`?

Versions must look like `3.0` or `1.4` — two numeric parts separated by a single dot, nothing more. This rule is enforced by the invariant `inv-version-major-minor` on the profile. `"3.0.0"`, `"v3"`, `"third version"` will all fail validation.

##### Why exactly one official identifier?

The profile requires that *at least one* identifier is present (`identifier 1..*`), and the invariant `inv-require-official-identifier` requires that *exactly one* of them has `use = "official"`. You can add as many additional non-official identifiers (e.g. DOIs, internal IDs) as you like — they just must not also be `use = "official"`.

```json
"identifier": [
  { "use": "official",   "system": "http://fhir.awmf.org/guidelines",   "value": "020-013" },
  { "use": "secondary",  "system": "https://example.org/internal-ids",  "value": "internal-9876" }
]
```

#### Authors and their roles

`author` is a plain FHIR list of references. To say *what role* each author plays in the guideline (lead author, contributor, registrant, …), attach the **author role extension** to the individual `author` entry:

```json
"author": [
  {
    "reference": "PractitionerRole/JessicaRademacherDGPFor020-013",
    "extension": [
      {
        "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
        "valueCodeableConcept": {
          "coding": [
            {
              "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
              "code": "leading"
            }
          ]
        }
      }
    ]
  }
]
```

Available codes are listed on the [`vs-guideline-author-role` value set](ValueSet-vs-guideline-author-role.html) — examples include `leading`, `contributing`, `registrant`, `editor`. You can attach more than one role extension to the same author if needed.

For the full picture of who can be referenced as an author (Practitioner vs PractitionerRole vs Organization), see the [Profiles page](profiles.html) section "Profiles for involved Organizations and Persons". The base `Guideline` profile does **not** restrict the author reference type, but the [Guideline Registry Record](authoring-registry-record.html) does.

#### Publication and review dates

Several dates are relevant for a guideline beyond `Composition.date` (which is just "when was this resource last edited"). Each is its own extension on the root of the resource:

| Concept                  | Extension URL (`extension[].url`)                                                       | Value type   |
| ------------------------ | --------------------------------------------------------------------------------------- | ------------ |
| First publication date   | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date`           | `valueDate`  |
| Submission date          | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date`                  | `valueDate`  |
| Registration date        | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date`                | `valueDate`  |
| Planned completion date  | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date`          | `valueDate`  |
| Consultation period      | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period`              | `valuePeriod`|

Example: a guideline first published in 2018 and revised:

```json
"extension": [
  {
    "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date",
    "valueDate": "2018-09-01"
  },
  {
    "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date",
    "valueDate": "2025-01-20"
  }
]
```

Approval date, last review date and effective period (the time window the guideline is meant to be used) live on the [Guideline Registry Record](authoring-registry-record.html), **not** on the Guideline itself.

#### Sectioning the guideline content

The body of the guideline goes into `section[]`. Each section has a `code` saying what kind of section it is. The profile allows the following section types ([`vs-guideline-sections`](ValueSet-vs-guideline-sections.html)):

| Slice name           | Section code                                              | Use for                                          |
| -------------------- | --------------------------------------------------------- | ------------------------------------------------ |
| `summary`            | `https://fevir.net/resources/CodeSystem/179423#summary`   | Short summary                                    |
| `introduction`       | `…#introduction`                                          | Scope, purpose, audience, target population text |
| `methods`            | `…#methods`                                               | Methodology, evidence search, consensus methods  |
| `discussion`         | `…#discussion`                                            | Discussion                                       |
| `references`         | `…#references`                                            | Bibliography                                     |
| `competingInterests` | `…#competing-interests`                                   | Conflicts-of-interest declarations               |
| `acknowledgements`   | `…#acknowledgements`                                      | Acknowledgements                                 |
| `appendices`         | `…#appendices`                                            | Appendices                                       |
| `recommendations`    | `…#recommendations`                                       | Container for `entry`-style links to Recommendation resources; do not put text here |
| `consensusProtocol`  | `http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections#consensus-protocol` | Consensus voting protocols |
| `text`               | `…#text`                                                  | Generic narrative; nest more `text` sections inside for sub-headings |

Sections support sub-sections (e.g. an `introduction` section can contain a `text` sub-section for "Target Patient Group"), and these can themselves be nested up to six levels deep — enough to model real guideline tables of contents.

A skeletal section structure:

```json
"section": [
  {
    "code": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "introduction" }] },
    "section": [
      {
        "code": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "text" }] },
        "title": "Scope and Purpose",
        "section": [ /* multilingual content goes here — see next section */ ]
      }
    ]
  }
]
```

#### Multilingual content: the `section[language]` pattern

A single guideline often has parallel German and English text (sometimes more languages). This IG models that by adding **one extra layer of `section` inside each narrative section, one per language**. Each language-section carries the `ext-section-language` extension naming the language code.

```json
{
  "code": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "text" }] },
  "section": [
    {
      "extension": [{
        "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
        "valueCode": "de"
      }],
      "title": "Zielsetzung und Fragestellung",
      "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "language" }] },
      "text": {
        "status": "generated",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Diese Leitlinie behandelt …</div>"
      }
    },
    {
      "extension": [{
        "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
        "valueCode": "en"
      }],
      "title": "Objective and Research Question",
      "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "language" }] },
      "text": {
        "status": "generated",
        "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">This guideline covers …</div>"
      }
    }
  ]
}
```

The `text.div` content is HTML (the FHIR "narrative" XHTML). For right-to-left languages (e.g. Arabic), set `dir="rtl"` on the `<div>`. The same pattern reappears on the [Recommendation page](authoring-recommendation.html) — once you have grasped it for the Guideline, you have it for the Recommendation too.

The `language` section code is `http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections#language`, *not* the same as the section's parent code. Every language-tagged inner section uses this same code.

#### Linking to recommendations and a registry record

Individual recommendations are **separate resources** (separate Composition instances under the [Recommendation profile](authoring-recommendation.html)). They point back to the guideline through `relatesTo[partOf]`; the guideline itself does **not** need to list them out, although you can use a `recommendations` section as a container if you wish.

The matching registry record (see [Authoring a Registry Record](authoring-registry-record.html)) is also a separate resource. The convention is to use the same AWMF register number on both, and to link the registry record to the guideline via `relatesTo[similarTo/relatedGuideline]` on the *record* side.

#### Full worked example

A complete S3 guideline in the IG: [Composition-NosokomialePneumonie](Composition-NosokomialePneumonie.html) — *S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie* (AWMF #020-013, version 3.0).

- Source FSH: [`input/fsh/examples/020-013/guideline-020-013.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/020-013/guideline-020-013.fsh)
- Rendered JSON: [Composition-NosokomialePneumonie.json](Composition-NosokomialePneumonie.json)

For the matching registry record continue with [Authoring a Registry Record](authoring-registry-record.html). For its recommendations, see [Authoring a Recommendation](authoring-recommendation.html).

{% include link-list.md %}
