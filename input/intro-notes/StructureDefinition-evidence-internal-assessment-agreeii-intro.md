{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Assessment using AGREE II** – a structured assessment of the quality of clinical practice guidelines using the AGREE II (Appraisal of Guidelines for Research and Evaluation) instrument.

#### Overview

AGREE II is the international standard for assessing the methodological quality of clinical practice guidelines. It evaluates guidelines across 6 domains with 23 items.

#### AGREE II Domains

1. **Scope and Purpose** – Overall aim, clinical questions, target population
2. **Stakeholder Involvement** – Relevant professional groups and patient views
3. **Rigour of Development** – Systematic evidence search and recommendation formulation
4. **Clarity of Presentation** – Specific and unambiguous recommendations
5. **Applicability** – Barriers, facilitators, and resource implications
6. **Editorial Independence** – Funding and competing interests

#### Key Elements

##### Rating System (Required)

The rating system is fixed to AGREE II:

```fsh
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#AGREEII "AGREE II"
```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Domain-level scores and overall assessment may be added in future versions.

#### Example Usage

```fsh
Instance: AGREEIIAssessmentExample
InstanceOf: evidence-assessment-agreeii
Usage: #example
* artifactReference = Reference(SourceGuideline)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#AGREEII "AGREE II"
```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
