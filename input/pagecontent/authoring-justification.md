{% include variables.md %}

### Authoring a Recommendation Justification

This page shows how to build a `Recommendation Justification` — the resource that carries the **strength**, **direction**, **consensus level** and **per-outcome evidence ratings** of a recommendation.

#### The single biggest gotcha

> **The Recommendation Justification is a separate resource (`ArtifactAssessment`) that points *back* at the Recommendation via `artifactReference`. The Recommendation itself does *not* carry the rating fields.**
{:.stu-note}

If you came expecting `Composition.strengthOfRecommendation` somewhere on the Recommendation, look here instead. A Recommendation and its Justification are always created as a pair (and often live next to each other in the source repo, e.g. [`rec2-a.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/020-013/rec2/rec2-a.fsh) + [`ratings.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/020-013/rec2/ratings.fsh)).

#### What you are building

A `Recommendation Justification` is a constrained FHIR [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html). An `ArtifactAssessment` is FHIR's generic resource for "a structured comment, rating, or assessment of any other FHIR artifact". In this IG, that artifact is always a `Recommendation`.

There are seven profiles, all sharing the same shape, differing only in *which rating system is used* and *which extra `component`s are required*:

| Profile id                                  | Canonical URL                                                                                                | Use when…                                                                                  |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| `recommendation-justification`              | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification`                              | The generic base — no specific rating system fixed. Use only if none of the others fit.    |
| `recommendation-justification-awmf`         | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-awmf`                         | AWMF strength of recommendation (codes `A` / `B` / `0`).                                   |
| `recommendation-justification-grade`        | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-grade`                        | GRADE — also requires the seven Evidence-to-Decision components (benefits-and-harms, certainty of evidence, preferences, resources, equity, acceptability, feasibility). |
| `recommendation-justification-oxford-2011`  | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-oxford-2011`                  | Oxford 2011 (OCEBM) level-of-evidence rating.                                              |
| `recommendation-justification-oxford-2009`  | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-oxford-2009`                  | Oxford 2009 (OCEBM) level-of-evidence rating.                                              |
| `recommendation-justification-sign`         | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-sign`                         | SIGN level-of-evidence rating.                                                             |
| `recommendation-justification-expert-consensus` | `http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-expert-consensus`         | Expert consensus only — no per-outcome evidence ratings, just strength/direction/consensus. |

Pick **one** of these profiles and declare it in `meta.profile`. The shape of the resource is the same in every case — only the value sets bound to the rating classifiers (and, for GRADE, the extra required components) differ.

A minimum viable AWMF-style justification (carrying only the recommendation rating, no per-outcome evidence):

```json
{
  "resourceType": "ArtifactAssessment",
  "id": "MyRecommendation-Justification",
  "meta": {
    "profile": ["http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-awmf"]
  },
  "artifactReference": { "reference": "Composition/MyRecommendation" },
  "workflowStatus": "applied",
  "content": [
    {
      "type": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "recommendation-rating" }] },
      "component": [
        {
          "type": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "rating-system" }] },
          "classifier": [{ "coding": [{ "system": "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem", "code": "AWMF" }] }]
        },
        {
          "type": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "strength-of-recommendation" }] },
          "classifier": [{ "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-strength-awmf", "code": "A", "display": "Strong Recommendation" }] }]
        },
        {
          "type": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "direction-of-recommendation" }] },
          "classifier": [{ "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-direction", "code": "for", "display": "For" }] }]
        },
        {
          "type": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf", "code": "level-of-consensus" }] },
          "classifier": [{ "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-level-of-consensus", "code": "strong-consensus", "display": "Strong consensus" }] }]
        }
      ]
    }
  ]
}
```

The structure is repetitive once you see it: `content[]` holds slices (`recommendationRating`, `evidenceRating`, `searchStrategy`); each slice's `component[]` holds the actual values, where each component has a `type` (saying *what kind of value this is*) and a `classifier` (the value itself).

#### Required top-level fields

| Concept                | JSON path                | Cardinality | Notes                                                                |
| ---------------------- | ------------------------ | ----------- | -------------------------------------------------------------------- |
| Profile                | `meta.profile[]`         | 1..1        | Pick one of the seven profiles from the table above.                 |
| Recommendation linked  | `artifactReference`      | 1..1        | `reference` (not `targetCanonical`) to the `Composition` recommendation. |
| Workflow status        | `workflowStatus`         | 1..1        | Fixed value: `applied`.                                              |

#### The `content[recommendationRating]` slice

This slice carries the headline numbers: strength, direction, consensus level — and (only on some profiles) the rating system.

| Component slice                   | `component.type` code                                                                  | What it carries                                                                                                                                |
| --------------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| `ratingSystem`                    | `https://fevir.net/resources/CodeSystem/179423#rating-system`                          | Which rating system this whole justification uses. Required on AWMF and GRADE profiles; auto-fixed by the profile.                              |
| `strengthOfRecommendation`        | `…#strength-of-recommendation`                                                         | The strength itself. Bound value set depends on profile (see below).                                                                            |
| `directionOfRecommendation`       | `…#direction-of-recommendation`                                                        | `for`, `against`, or `either` — from [`vs-direction-of-recommendation`](http://hl7.org/fhir/uv/ebm/ValueSet/direction-of-recommendation).      |
| `levelOfConsensus`                | `http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf#level-of-consensus`                   | Required on AWMF-style recommendations: one of `strong-consensus`, `consensus`, `majority-consensus`, `no-consensus` from [`vs-level-of-consensus`](ValueSet-vs-level-of-consensus.html). |

##### Strength of recommendation — value set per profile

| Profile                                     | Strength value set                                                                                                                                                  | Common codes                       |
| ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| `recommendation-justification-awmf`         | [`vs-recommendation-strength-awmf`](ValueSet-vs-recommendation-strength-awmf.html)                                                                                  | `A` (strong), `B` (weak), `0` (open / statement) |
| `recommendation-justification-grade`        | [`vs-strength-of-recommendation`](http://hl7.org/fhir/uv/ebm/ValueSet/strength-of-recommendation)                                                                   | `strong`, `weak`                   |
| `recommendation-justification` (base) and Oxford/SIGN | Same as GRADE                                                                                                                                              | `strong`, `weak`                   |
| `recommendation-justification-expert-consensus` | Same as GRADE                                                                                                                                                   | `strong`, `weak`                   |

#### GRADE-specific components

The GRADE profile *additionally* requires seven Evidence-to-Decision components inside `content[recommendationRating]`. Each follows the same `type + classifier` shape; the bound value sets are listed below.

| Component slice              | `component.type`                                                                       | Bound value set                                                                                |
| ---------------------------- | -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| `overallCertaintyOfEvidence` | `http://hl7.org/fhir/certainty-type#Overall`                                           | [`vs-rating-certainty-of-evidence`](ValueSet-vs-rating-certainty-of-evidence.html)             |
| `benefitsAndHarms`           | `…/etd-certainty-type#benefits-and-harms`                                              | [`vs-rating-benefits-and-harms`](ValueSet-vs-rating-benefits-and-harms.html)                   |
| `preferenceAndValues`        | `…/etd-certainty-type#preference-and-values`                                           | [`vs-rating-preference-and-values`](ValueSet-vs-rating-preference-and-values.html)             |
| `resources`                  | `…/etd-certainty-type#resources`                                                       | [`vs-rating-resources`](ValueSet-vs-rating-resources.html)                                     |
| `equity`                     | `…/etd-certainty-type#equity`                                                          | [`vs-rating-equity`](ValueSet-vs-rating-equity.html)                                           |
| `acceptability`              | `…/etd-certainty-type#acceptability`                                                   | [`vs-rating-acceptability`](ValueSet-vs-rating-acceptability.html)                             |
| `feasibility`                | `…/etd-certainty-type#feasibility`                                                     | [`vs-rating-feasibility`](ValueSet-vs-rating-feasibility.html)                                 |

#### Per-outcome evidence ratings — the `content[evidenceRating]` slice

For evidence-based recommendations you usually want to attach a level-of-evidence rating *per clinical outcome* (one for mortality, one for hospitalisation, …). Add one `content[evidenceRating]` block per outcome:

```json
"content": [
  { /* ... recommendationRating ... */ },
  {
    "type": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf", "code": "evidence-rating" }] },
    "component": [
      {
        "type": { "coding": [{ "system": "http://hl7.org/fhir/certainty-type", "code": "Overall" }] },
        "classifier": [{ "coding": [{ "system": "http://terminology.hl7.org/CodeSystem/certainty-rating", "code": "very-low", "display": "Very low quality" }] }]
      },
      {
        "type": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico", "code": "outcome" }] },
        "relatesTo": [{
          "type": "depends-on",
          "targetReference": { "reference": "EvidenceVariable/MortalityAt28Days" }
        }]
      },
      {
        "type": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf", "code": "overall-quality-of-evidence" }] },
        "relatesTo": [{
          "type": "justification",
          "targetReference": { "reference": "ArtifactAssessment/RoB-MortalityAt28Days" }
        }]
      }
    ]
  }
]
```

Inside an `evidenceRating` block:

| Component slice              | `component.type` code                                            | What it carries                                                                                       |
| ---------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `ratingSystem`               | `…#rating-system`                                                | Which rating system this evidence rating uses (Oxford, GRADE, AWMF, …).                                |
| `levelOfEvidence`            | `…/certainty-type#Overall`                                       | The level/grade itself; classifier bound per profile (Oxford uses [`OCEBM2011LevelsOfEvidenceVS`](ValueSet-ocebm-2011-levels-of-evidence-vs.html), SIGN uses [`SIGNLevelOfEvidenceVS`](ValueSet-vs-sign-level-of-evidence.html)). |
| `outcome`                    | `…/cs-pico#outcome`                                              | A `relatesTo[type=depends-on]` link to the outcome this rating is about (`EvidenceVariable` or `Group`, or [`OutcomeEvidence`](StructureDefinition-outcome-evidence.html)). |
| `overallQualityOfEvidence`   | `…/cs-awmf#overall-quality-of-evidence`                          | A `relatesTo[type=justification]` link to a separate `EvidenceAssessment` resource (e.g. a RoB rating). |

Two of the seven profiles have `content[evidenceRating]` constrained to **0..0** (i.e. *forbidden*):

- `recommendation-justification-expert-consensus` (a pure consensus recommendation has no per-outcome evidence to rate)
- `recommendation-justification-oxford-2011` and `recommendation-justification-oxford-2009` — Oxford ratings apply at the recommendation level, not the outcome level, so `component[outcome]` is forbidden inside `evidenceRating`.

#### Search strategy

`content[searchStrategy]` is an optional pointer at a separate [SystematicReview](http://hl7.org/fhir/uv/ebm/StructureDefinition/systematic-review) resource describing how the literature for this recommendation was found:

```json
{
  "type": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "SearchStrategy" }] },
  "relatesTo": [{ "targetReference": { "reference": "Citation/MySystematicReview" } }]
}
```

#### Full worked examples

- AWMF Expert-Consensus justification (no evidence ratings): [ArtifactAssessment-RecommendationHAPDiagnosis-A-Justification](ArtifactAssessment-RecommendationHAPDiagnosis-A-Justification.html) — FSH: [`input/fsh/examples/020-013/rec2/ratings.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/020-013/rec2/ratings.fsh)
- AWMF justification with per-outcome evidence ratings: [ArtifactAssessment-RecommendationCognitiveTestsWhenSuspectingDementia-Justification](ArtifactAssessment-RecommendationCognitiveTestsWhenSuspectingDementia-Justification.html) — FSH: [`input/fsh/examples/038-013/ratings-rec17.fsh`](https://github.com/Dissolve-E/awmf-ig/blob/main/input/fsh/examples/038-013/ratings-rec17.fsh)

{% include link-list.md %}
