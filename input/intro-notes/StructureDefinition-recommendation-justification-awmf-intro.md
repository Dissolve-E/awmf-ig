{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Recommendation Justification using the AWMF Rating System** – a structured assessment of the evidence and consensus that underpins a recommendation using the AWMF-specific strength categories.

#### Overview

This profile extends the base `RecommendationJustification` to use the AWMF recommendation strength classification system, which maps to German guideline conventions.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to AWMF:

```fsh
* content[recommendationRating]
  * component[ratingSystem]
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier = $cs-evidence-rating-system#AWMF
```

##### Strength of Recommendation

Uses the AWMF-specific recommendation strength value set:

```fsh
* content[recommendationRating]
  * component[strengthOfRecommendation]
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"
    * classifier from vs-recommendation-strength-awmf (required)
```

The AWMF strength categories typically include:
- Strong recommendation ("soll" / "shall")
- Moderate recommendation ("sollte" / "should") 
- Open recommendation ("kann" / "can")

#### Example Usage

```fsh
Instance: AWMFJustificationExample
InstanceOf: recommendation-justification-awmf
Usage: #example
* artifactReference = Reference(MyRecommendation)
* workflowStatus = #applied
* content[recommendationRating]
  * component[ratingSystem].classifier = $cs-evidence-rating-system#AWMF
  * component[strengthOfRecommendation].classifier = #strong-recommendation
  * component[directionOfRecommendation].classifier = #for
```

For the base profile structure and evidence linking, see [Recommendation Justification](StructureDefinition-recommendation-justification.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
