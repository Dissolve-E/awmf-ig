{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

#### Capturing Certainty of Evidence Using Structured Ratings

To transparently represent the certainty of evidence for specific outcomes, guideline developers must capture evidence assessments using structured data. This includes ratings from established systems such as **GRADE**, **AGREE II**, **ROBIS**, **AMSTAR 2**, or **Oxford 2011**.

These assessments are expressed using the `CertaintyOfEvidenceRating` profile, based on the FHIR `ArtifactAssessment` resource. Each instance represents the evaluation of one piece of evidence (e.g., an `OutcomeEvidence` resource) using a specific rating system.

The profile requires explicitly stating:
- Which rating system was used (e.g., GRADE, AGREE II),
- The overall level of evidence certainty,
- Additional domain-specific ratings (e.g., risk of bias, inconsistency) where relevant.

##### Example: General Structure

The general structure of an evidence assessment using this profile looks as follows:

```
Instance: EvidenceCertaintyExample
InstanceOf: certainty-of-evidence-rating
* artifactReference = Reference(OutcomeEvidence/mortality-effect)
* workflowStatus = #applied

* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system
  * classifier = cs-evidence-rating-system#GRADE

* content[levelOfEvidence]
  * type = $cs-certainty-type#Overall
  * classifier = cs-rating-certainty-of-evidence#moderate
```

This example specifies that the GRADE system was used to rate the evidence for a specific outcome, and that the overall certainty of the evidence is “moderate”.

##### Extending for GRADE Domain-Level Ratings

When using GRADE, additional domain-specific components can be added to detail why the overall certainty was rated as it was:

```
* content[riskOfBias]
  * type = $cs-certainty-type#RiskOfBias

* content[inconsistency]
  * type = $cs-certainty-type#Inconsistency

* content[indirectness]
  * type = $cs-certainty-type#Indirectness

* content[imprecision]
  * type = $cs-certainty-type#Imprecision

* content[publicationBias]
  * type = $cs-certainty-type#PublicationBias
```

These allow precise attribution of strengths and weaknesses in the body of evidence.

##### Example: AGREE II Assessment of a Guideline

If the evidence being rated is a guideline, a different profile derived from `CertaintyOfEvidenceRating` can be used, for example for AGREE II:

```
Instance: AGREEAssessmentExample
InstanceOf: certainty-of-evidence-rating-agreeii
* artifactReference = Reference(Guideline/021-001)
* workflowStatus = #applied

* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system
  * classifier = cs-evidence-rating-system#AGREEII

* content[levelOfEvidence]
  * type = $cs-certainty-type#Overall
  * classifier = cs-rating-certainty-of-evidence#high
```

##### Linking to Recommendations

To link the evidence assessment to a recommendation, the recommendation justification uses:

```
RecommendationJustification[ArtifactAssessment]
* artifactReference = Reference(GuidelineRecommendation/rec-001)

* content[evidence][+]
  * relatedArtifact
    * type = #derived-from
    * resource = Reference(CertaintyOfEvidenceRating/Example)
```

This structured approach ensures that both automated systems and human users can transparently trace how certainty of evidence influenced the recommendations.




{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
