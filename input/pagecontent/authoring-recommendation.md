{% include variables.md %}

### Authoring a Recommendation

This page shows how to build a single `Recommendation`. In this IG every recommendation is its **own resource** — a separate Composition that points back to its parent guideline. A guideline with twenty recommendations will produce one Guideline resource plus twenty Recommendation resources.

If you have not yet read the [Guideline page](authoring-guideline.html), do that first — it explains base concepts (Composition, sections, the multilingual pattern) that are reused here.

#### What you are building

A Recommendation is a constrained FHIR [Composition]({{ fhir_base_url }}composition.html). The profile canonical URL is

```
http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation
```

Every recommendation must declare it in `meta.profile`. A minimum viable recommendation:

```json
{
  "resourceType": "Composition",
  "id": "MyRecommendation",
  "meta": {
    "profile": ["http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"]
  },
  "title": "Diagnosis of HAP",
  "version": "3.0",
  "status": "final",
  "date": "2024-12-05",
  "identifier": [
    { "use": "official", "system": "http://fhir.awmf.org/examples", "value": "MyRecommendation-001" }
  ],
  "author": [ { "reference": "PractitionerRole/SomeAuthor" } ],
  "category": [
    {
      "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-synthesis-type",
                   "code": "expert-consensus" }]
    }
  ],
  "relatesTo": [
    {
      "type": "part-of",
      "targetCanonical": "http://fhir.awmf.org/awmf.ig/Composition/MyGuideline|1.0"
    }
  ]
}
```

The four pieces that distinguish a Recommendation from any other Composition are: a fixed `category[synthesisType]`, a required `relatesTo[partOf]` to the parent Guideline, the recommendation text inside `section[recommendationStatement]`, and (separately, via the [Recommendation Justification](authoring-justification.html)) the strength / direction / consensus rating.

#### Required metadata

| Concept                    | JSON path                                     | Cardinality | Notes                                                                                          |
| -------------------------- | --------------------------------------------- | ----------- | ---------------------------------------------------------------------------------------------- |
| Title                      | `title`                                       | 0..1        | Short title shown in lists; the *full* recommendation text goes in `section[recommendationStatement]`. |
| Version                    | `version`                                     | 1..1        | `major.minor`, same rule as the Guideline.                                                     |
| Status                     | `status`                                      | 1..1        | `preliminary`, `final`, `amended`, `entered-in-error`, `deprecated`.                           |
| Modification date          | `date`                                        | 1..1        | When the Composition was last edited.                                                          |
| Identifier (one official)  | `identifier[…]` with exactly one `use="official"` | 1..*    | Same rule as the Guideline (`inv-require-official-identifier`).                                |
| Synthesis type             | `category[synthesisType]`                     | 1..1        | One of: `evidence-based`, `consensus-based`, `expert-consensus`, `statement`. See below.       |
| Link to parent Guideline   | `relatesTo[partOf]`                           | 1..*        | At least one entry pointing at the Guideline canonical URL.                                    |
| Author                     | `author[]`                                    | 0..*        | Same shape as on the Guideline.                                                                |

#### Linking to the parent Guideline

Every recommendation must say which guideline it belongs to. Use a `relatesTo` entry of `type = "part-of"`, with a `targetCanonical` URL that includes the guideline's canonical URL and pinned version:

```json
"relatesTo": [
  {
    "type": "part-of",
    "targetCanonical": "http://fhir.awmf.org/awmf.ig/Composition/NosokomialePneumonie|3.0"
  }
]
```

The `|3.0` suffix pins the recommendation to a specific *version* of the guideline. This matters: when you publish v3.1 of a guideline, you can decide for each recommendation whether it carries over (still pinned to 3.0 — note it stays valid only if you re-bundle it under 3.1 explicitly), is updated (a new Recommendation pinned to 3.1), or is retired.

A recommendation can be `part-of` more than one guideline (cross-references between AWMF and other registries). Just add more entries.

#### The recommendation text — `section[recommendationStatement]`

The actual wording of the recommendation lives in a section whose code is `recommendation-statement`. Like the Guideline, the text itself is one level deeper, inside language-tagged sub-sections that use the `ext-section-language` extension:

```json
"section": [
  {
    "code": {
      "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423",
                   "code": "recommendation-statement",
                   "display": "Recommendation Statement" }]
    },
    "section": [
      {
        "extension": [{
          "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
          "valueCode": "de"
        }],
        "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "language" }] },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Bei Patienten mit Krankheit A soll Medikament B statt Medikament C gegeben werden …</div>"
        }
      },
      {
        "extension": [{
          "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
          "valueCode": "en"
        }],
        "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "language" }] },
        "text": {
          "status": "generated",
          "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">In patients with condition A, drug B should be given rather than drug C …</div>"
        }
      }
    ]
  }
]
```

`recommendationStatement` is required to use this language pattern (it has `rs-language-section` applied). If you only have one language, you still produce a single language-tagged inner section.

#### Synthesis type and clinical application type

`category[synthesisType]` answers the question *"What kind of recommendation is this?"*. It is **required** and bound to the value set [`vs-recommendation-synthesis-type`](ValueSet-vs-recommendation-synthesis-type.html):

| Code               | Meaning                                                              |
| ------------------ | -------------------------------------------------------------------- |
| `evidence-based`   | Based on a systematic evidence review with evidence ratings.         |
| `consensus-based`  | Based on structured consensus with formal voting.                    |
| `expert-consensus` | Based on informal consensus by an expert panel.                      |
| `statement`        | An informational statement, not a recommendation for action.         |

`category[clinicalApplicationType]` is optional and may appear multiple times. It says *what clinical use* the recommendation is intended for, from [`vs-clinical-application-type`](ValueSet-vs-clinical-application-type.html): `diagnostic`, `prognostic`, `therapeutic`, `monitoring`, `screening`, `preventative`.

```json
"category": [
  { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-synthesis-type", "code": "evidence-based" }] },
  { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-clinical-application-type", "code": "diagnostic" }] }
]
```

#### Review status, approval date, last review date

These are extensions on the root of the resource:

| Concept             | Extension URL                                                                                       | Value type     |
| ------------------- | --------------------------------------------------------------------------------------------------- | -------------- |
| Approval date       | `http://hl7.org/fhir/StructureDefinition/composition-approval-date`                                 | `valueDate`    |
| Last review date    | `http://hl7.org/fhir/StructureDefinition/composition-last-review-date`                              | `valueDate`    |
| Review status       | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-recommendation-review-status`                 | `valueCodeableConcept` from [`vs-recommendation-review-status`](ValueSet-vs-recommendation-review-status.html) |

```json
"extension": [
  {
    "url": "http://hl7.org/fhir/StructureDefinition/composition-approval-date",
    "valueDate": "2024-12-05"
  },
  {
    "url": "http://hl7.org/fhir/StructureDefinition/composition-last-review-date",
    "valueDate": "2024-11-30"
  }
]
```

#### Tags

Use `meta.tag` to attach high-level classifications from [`vs-recommendation-tags`](ValueSet-vs-recommendation-tags.html) (preferred binding — you may use codes outside the value set if you have a reason):

```json
"meta": {
  "profile": ["http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"],
  "tag": [
    { "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-tags", "code": "key-recommendation" }
  ]
}
```

#### PICO inside the recommendation

The four PICO elements (**P**opulation, **I**ntervention, **C**omparator, **O**utcome) appear as named sections inside the recommendation Composition. Each is a top-level slice with a fixed `code`:

| Slice              | `section.code`                                          | What goes inside                                                   |
| ------------------ | ------------------------------------------------------- | ------------------------------------------------------------------ |
| `population`       | `https://fevir.net/resources/CodeSystem/179423#population` | Inside `section[language].entry`: `Reference(EvidenceVariable \| Group)` defining the target population. |
| `action`           | `…#action`                                              | The **intervention** — `Reference(PlanDefinition)` describing the recommended action.                  |
| `oppositeAction`   | `…#opposite-action`                                     | The **comparator** — `Reference(PlanDefinition)` describing the un-preferred alternative.              |
| `outcome`          | `http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico#outcome` | The clinical **outcome** the recommendation targets — `Reference(EvidenceVariable \| Group)`.          |

Each of these sections uses the `section[language]` pattern: text goes in a language sub-section, and the resource references go in `section[language].entry`. Each language section can also carry `ext-section-keyword` extensions for keyword tagging.

```json
{
  "code": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "population" }] },
  "section": [{
    "extension": [
      { "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language", "valueCode": "en" },
      { "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword",  "valueCodeableConcept": { "text": "adult inpatients" } }
    ],
    "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "language" }] },
    "text": { "status": "generated", "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">Adult inpatients with suspected hospital-acquired pneumonia.</div>" },
    "entry": [ { "reference": "Group/AdultInpatientsHAP" } ]
  }]
}
```

For a structured, queryable PICO definition that lives *outside* the recommendation (a reusable PICO question across recommendations), use the `PICOQuestion` profile (Group-based) and link to it via `relatesTo[derivedFrom/picoQuestion]`. That profile is out of scope of this guide for now — see the [Profiles page](profiles.html) section "Profiles for PICO Questions".

#### Other sections you can include

In addition to the PICO sections and `recommendationStatement`, a Recommendation may carry:

- `text` — generic narrative; supports `extension[intendedAudience]` to say who the section is written for (e.g. `physician`, `patient`).
- `consensusProtocol` — the protocol of the formal consensus vote behind the recommendation.
- `patientVersion` — a lay-language re-statement of the recommendation.
- `otherContent` — anything else, with a `code` from [`vs-content-types`](ValueSet-vs-content-types.html).
- `summary`, `introduction`, `methods`, `discussion`, `references`, `competingInterests`, `acknowledgements`, `appendices`, `evidence`, `justification`, `considerations` — the standard EBM-IG sections (use only if relevant for this single recommendation).
- `ratings` — `entry` references the [Recommendation Justification](authoring-justification.html) resource that carries the strength/direction/consensus rating. Many implementations leave this empty and rely on the *reverse* link (`artifactReference` on the Justification) instead — both are acceptable.

#### Linking to other recommendations

Three named `relatesTo` slices let you express workflow relationships between recommendations:

| Slice                                       | `relatesTo.type` | Means                                                                       |
| ------------------------------------------- | ---------------- | --------------------------------------------------------------------------- |
| `specificationOfPreceedingRecommendation`   | `predecessor`    | Points to a recommendation that **comes before** this one in a clinical workflow. |
| `specificationOfSucceedingRecommendation`   | `successor`      | Points to a recommendation that **comes after** this one in a clinical workflow.  |
| `replacesRecommendation`                    | `replaces`       | Points to an older recommendation that this one supersedes.                  |

All three use `targetReference` to point at another Recommendation resource.

#### Where the recommendation strength lives

The strength of recommendation (`A`/`B`/`0`, or `strong`/`weak`, or a GRADE-style rating), the direction (for/against/either), the consensus level, and per-outcome evidence ratings **are not on the Recommendation resource**. They live on a separate **Recommendation Justification** resource that points *back* at the Recommendation via `artifactReference`. This is the single biggest gotcha of the model — see the dedicated [Authoring a Justification](authoring-justification.html) page.

#### Full worked examples

- Expert-consensus recommendation: [Composition-RecommendationHAPDiagnosis-A](Composition-RecommendationHAPDiagnosis-A.html) (FSH: [`input/fsh/examples/020-013/rec2/rec2-a.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/020-013/rec2/rec2-a.fsh))
- Evidence-based recommendation with PICO: [Composition-RecommendationCognitiveTestsWhenSuspectingDementia](Composition-RecommendationCognitiveTestsWhenSuspectingDementia.html) (FSH: [`input/fsh/examples/038-013/rec17.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/038-013/rec17.fsh))

{% include link-list.md %}
