{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Assessment using the Cochrane Risk of Bias Tool** – a structured assessment of risk of bias for individual studies using the Cochrane RoB tool.

#### Overview

The Cochrane Risk of Bias tool is the standard approach for assessing internal validity of randomized controlled trials included in systematic reviews. It evaluates bias across multiple domains.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to Cochrane RoB:

```fsh
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#CochraneRoB "Cochrane RoB"
```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Detailed domain-level ratings (randomization process, deviations from intervention, missing outcome data, measurement of outcome, selection of reported result) may be added in future versions.

#### Example Usage

```fsh
Instance: CochraneRoBExample
InstanceOf: evidence-assessment-cochrane-rob
Usage: #example
* artifactReference = Reference(MyRCTEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#CochraneRoB "Cochrane RoB"
```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
