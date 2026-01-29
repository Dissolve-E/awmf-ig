# Recommendation Justification AWMF - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Justification AWMF**

## Resource Profile: Recommendation Justification AWMF 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-awmf | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RecommendationJustificationAWMF |

 
A structured assessment of the evidence and consensus that underpins a recommendation, including AWMF rating. 

### Guidance

This profile represents a **Recommendation Justification using the AWMF Rating System** – a structured assessment of the evidence and consensus that underpins a recommendation using the AWMF-specific strength categories.

#### Overview

This profile extends the base `RecommendationJustification` to use the AWMF recommendation strength classification system, which maps to German guideline conventions.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to AWMF:

```
* content[recommendationRating]
  * component[ratingSystem]
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier = $cs-evidence-rating-system#AWMF

```

##### Strength of Recommendation

Uses the AWMF-specific recommendation strength value set:

```
* content[recommendationRating]
  * component[strengthOfRecommendation]
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"
    * classifier from vs-recommendation-strength-awmf (required)

```

The AWMF strength categories typically include:

* Strong recommendation ("soll" / "shall")
* Moderate recommendation ("sollte" / "should")
* Open recommendation ("kann" / "can")

#### Example Usage

```
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

For the base profile structure and evidence linking, see [Recommendation Justification](StructureDefinition-recommendation-justification.md).

This profile of a FHIR ArtifactAssessment is derived from the [recommendation-justification](http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification) FHIR resource.

**Usages:**

* Examples for this Profile: [ArtifactAssessment/RecommendationCognitiveTestsWhenSuspectingDementia-Justification](ArtifactAssessment-RecommendationCognitiveTestsWhenSuspectingDementia-Justification.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/recommendation-justification-awmf)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-recommendation-justification-awmf.csv), [Excel](StructureDefinition-recommendation-justification-awmf.xlsx), [Schematron](StructureDefinition-recommendation-justification-awmf.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "recommendation-justification-awmf",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-awmf",
  "version" : "0.2.0",
  "name" : "RecommendationJustificationAWMF",
  "title" : "Recommendation Justification AWMF",
  "status" : "draft",
  "date" : "2026-01-29T18:27:10+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [
    {
      "name" : "AWMF e.V.",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org"
        }
      ]
    }
  ],
  "description" : "A structured assessment of the evidence and consensus that underpins a recommendation, including AWMF rating.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ArtifactAssessment",
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ArtifactAssessment",
        "path" : "ArtifactAssessment"
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "recommendationRating"
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component",
        "path" : "ArtifactAssessment.content.component",
        "min" : 1
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:ratingSystem",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "ratingSystem",
        "min" : 1
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem",
              "code" : "AWMF"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:strengthOfRecommendation",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "strengthOfRecommendation"
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:strengthOfRecommendation.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-recommendation-strength-awmf"
        }
      }
    ]
  }
}

```
