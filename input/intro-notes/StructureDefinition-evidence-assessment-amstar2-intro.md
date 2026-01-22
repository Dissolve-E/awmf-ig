{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Assessment using AMSTAR 2** – a structured assessment of the methodological quality of systematic reviews using the AMSTAR 2 (A MeaSurement Tool to Assess systematic Reviews) instrument.

#### Overview

AMSTAR 2 is a widely used tool for critically appraising systematic reviews. It assesses methodological quality across 16 domains, with 7 critical domains that can affect confidence in the review's results.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to AMSTAR 2:

```fsh
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#AMSTAR2 "AMSTAR 2"
```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. The overall confidence rating (high, moderate, low, critically low) and individual domain assessments may be added in future versions.

#### Example Usage

```fsh
Instance: AMSTAR2AssessmentExample
InstanceOf: evidence-assessment-amstar2
Usage: #example
* artifactReference = Reference(MySystematicReviewEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#AMSTAR2 "AMSTAR 2"
```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
