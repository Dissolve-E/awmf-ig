{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Assessment using ROBIS** – a structured assessment of risk of bias using the ROBIS (Risk of Bias in Systematic Reviews) tool.

#### Overview

ROBIS is a tool specifically designed to assess the risk of bias in systematic reviews. It evaluates concerns across multiple domains related to the conduct of the review.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to ROBIS:

```fsh
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#ROBIS "ROBIS"
```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Detailed domain-level ratings (study eligibility criteria, identification and selection of studies, data collection and study appraisal, synthesis and findings) may be added in future versions.

#### Example Usage

```fsh
Instance: ROBISAssessmentExample
InstanceOf: evidence-assessment-robis
Usage: #example
* artifactReference = Reference(MySystematicReviewEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#ROBIS "ROBIS"
```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
