{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Overall Evidence Assessment** – a structured assessment of the overall evidence for a specific outcome, aggregating evidence from multiple sources.

#### Overview

This profile serves as the base for overall evidence assessments using various rating systems (GRADE, Oxford 2011, etc.). It inherits from `EvidenceAssessment` and is used when rating the body of evidence for a particular outcome rather than individual studies.

#### Relationship to Other Profiles

- **Parent profile:** [Certainty of Evidence Rating](StructureDefinition-certainty-of-evidence-rating.html)
- **Child profiles:**
  - [Evidence Assessment GRADE](StructureDefinition-evidence-assessment-grade.html)
  - [Evidence Assessment Oxford 2011](StructureDefinition-evidence-assessment-oxford2011.html)

#### Example Usage

```fsh
Instance: OverallEvidenceExample
InstanceOf: overall-evidence-assessment
Usage: #example
* artifactReference = Reference(MortalityOutcome)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#GRADE
* content[levelOfEvidence].classifier = #moderate
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
