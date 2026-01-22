{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Assessment using GRADE** – a structured assessment of the certainty of evidence for a specific outcome using the GRADE methodology.

#### Overview

GRADE (Grading of Recommendations Assessment, Development and Evaluation) is a systematic approach to rating the certainty of evidence. This profile captures all GRADE domains that may affect the certainty rating.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to GRADE:

```fsh
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#GRADE
```

##### Level of Evidence

Overall certainty rating (high, moderate, low, very low):

```fsh
* content[levelOfEvidence]
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier from vs-rating-certainty-of-evidence (required)
```

##### GRADE Certainty Domains

The profile supports all standard GRADE domains for downgrading or upgrading:

**Downgrading factors:**
- `inconsistency` – Heterogeneity across studies
- `indirectness` – Indirect evidence (population, intervention, comparator, outcome)
- `imprecision` – Wide confidence intervals
- `publicationBias` – Selective publication

**Upgrading factors (observational studies):**
- `doseResponseGradient` – Dose-response relationship
- `plausibleConfounding` – Confounding would reduce effect
- `largeEffect` – Large magnitude of effect

Example:

```fsh
* content[inconsistency]
  * type = $cs-certainty-type#Inconsistency "Inconsistency"
* content[indirectness]
  * type = $cs-certainty-type#Indirectness "Indirectness"
* content[imprecision]
  * type = $cs-certainty-type#Imprecision "Imprecision"
```

#### Example Usage

```fsh
Instance: GRADEEvidenceExample
InstanceOf: evidence-assessment-grade
Usage: #example
* artifactReference = Reference(MortalityOutcomeEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#GRADE
* content[levelOfEvidence].classifier = #moderate
* content[imprecision].type = $cs-certainty-type#Imprecision
```

For the base profile structure, see [Certainty of Evidence Rating](StructureDefinition-certainty-of-evidence-rating.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
