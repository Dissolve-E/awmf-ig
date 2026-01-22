{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Recommendation Justification using GRADE** – a structured assessment of the evidence and consensus that underpins a recommendation, including all GRADE evidence-to-decision framework domains.

#### Overview

The GRADE (Grading of Recommendations Assessment, Development and Evaluation) approach is widely used for rating the quality of evidence and making recommendations. This profile extends the base `RecommendationJustification` to capture GRADE-specific components.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to GRADE:

```fsh
* content[recommendationRating]
  * component[ratingSystem]
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier = $cs-evidence-rating-system#GRADE
```

##### Strength of Recommendation

GRADE distinguishes between strong and weak/conditional recommendations:

```fsh
* content[recommendationRating]
  * component[strengthOfRecommendation]
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"
    * classifier from $vs-strength-of-recommendation (required)
```

##### Direction of Recommendation

Whether the recommendation is for or against the intervention:

```fsh
* content[recommendationRating]
  * component[directionOfRecommendation]
    * type = $cs-ebm-ig#direction-of-recommendation "Direction of Recommendation"
    * classifier from $vs-direction-of-recommendation (required)
```

##### GRADE Evidence-to-Decision Components

The profile includes all standard GRADE EtD framework domains:

| Component | Description |
|-----------|-------------|
| `overallCertaintyOfEvidence` | Overall quality of the evidence |
| `benefitsAndHarms` | Balance of benefits vs. harms |
| `preferenceAndValues` | Patient preferences and values |
| `resources` | Resource use and cost considerations |
| `equity` | Impact on health equity |
| `acceptability` | Acceptability to stakeholders |
| `feasibility` | Feasibility of implementation |

Example:

```fsh
* content[recommendationRating]
  * component[overallCertaintyOfEvidence]
    * type = $cs-certainty-type#Overall "Overall certainty"
    * classifier from vs-rating-certainty-of-evidence (required)
  
  * component[benefitsAndHarms]
    * type = $cs-etd-certainty-type#benefits-and-harms "Benefits and Harms"
    * classifier from vs-rating-benefits-and-harms (required)
  
  * component[preferenceAndValues]
    * type = $cs-etd-certainty-type#preference-and-values "Preference and values"
    * classifier from vs-rating-preference-and-values (required)
```

#### Example Usage

```fsh
Instance: GRADEJustificationExample
InstanceOf: recommendation-justification-grade
Usage: #example
* artifactReference = Reference(MyRecommendation)
* workflowStatus = #applied
* content[recommendationRating]
  * component[ratingSystem].classifier = $cs-evidence-rating-system#GRADE
  * component[strengthOfRecommendation].classifier = #strong
  * component[directionOfRecommendation].classifier = #for
  * component[overallCertaintyOfEvidence].classifier = #moderate
  * component[benefitsAndHarms].classifier = #benefits-outweigh-harms
```

For the base profile structure and evidence linking, see [Recommendation Justification](StructureDefinition-recommendation-justification.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
