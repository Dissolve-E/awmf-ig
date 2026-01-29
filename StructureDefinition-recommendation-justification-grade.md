# Recommendation Justification GRADE - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Justification GRADE**

## Resource Profile: Recommendation Justification GRADE 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-grade | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RecommendationJustificationGRADE |

 
A structured assessment of the evidence and consensus that underpins a recommendation using the GRADE evidence rating system. 

### Guidance

This profile represents a **Recommendation Justification using GRADE** – a structured assessment of the evidence and consensus that underpins a recommendation, including all GRADE evidence-to-decision framework domains.

#### Overview

The GRADE (Grading of Recommendations Assessment, Development and Evaluation) approach is widely used for rating the quality of evidence and making recommendations. This profile extends the base `RecommendationJustification` to capture GRADE-specific components.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to GRADE:

```
* content[recommendationRating]
  * component[ratingSystem]
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier = $cs-evidence-rating-system#GRADE

```

##### Strength of Recommendation

GRADE distinguishes between strong and weak/conditional recommendations:

```
* content[recommendationRating]
  * component[strengthOfRecommendation]
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"
    * classifier from $vs-strength-of-recommendation (required)

```

##### Direction of Recommendation

Whether the recommendation is for or against the intervention:

```
* content[recommendationRating]
  * component[directionOfRecommendation]
    * type = $cs-ebm-ig#direction-of-recommendation "Direction of Recommendation"
    * classifier from $vs-direction-of-recommendation (required)

```

##### GRADE Evidence-to-Decision Components

The profile includes all standard GRADE EtD framework domains:

| | |
| :--- | :--- |
| `overallCertaintyOfEvidence` | Overall quality of the evidence |
| `benefitsAndHarms` | Balance of benefits vs. harms |
| `preferenceAndValues` | Patient preferences and values |
| `resources` | Resource use and cost considerations |
| `equity` | Impact on health equity |
| `acceptability` | Acceptability to stakeholders |
| `feasibility` | Feasibility of implementation |

Example:

```
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

```
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

For the base profile structure and evidence linking, see [Recommendation Justification](StructureDefinition-recommendation-justification.md).

This profile of a FHIR ArtifactAssessment is derived from the [recommendation-justification](http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/recommendation-justification-grade)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-recommendation-justification-grade.csv), [Excel](StructureDefinition-recommendation-justification-grade.xlsx), [Schematron](StructureDefinition-recommendation-justification-grade.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "recommendation-justification-grade",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-grade",
  "version" : "0.2.0",
  "name" : "RecommendationJustificationGRADE",
  "title" : "Recommendation Justification GRADE",
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
  "description" : "A structured assessment of the evidence and consensus that underpins a recommendation using the GRADE evidence rating system.",
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
              "code" : "GRADE",
              "display" : "GRADE"
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
          "valueSet" : "http://terminology.hl7.org/ValueSet/recommendation-strength"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:benefitsAndHarms",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "benefitsAndHarms",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:benefitsAndHarms.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
              "code" : "benefits-and-harms",
              "display" : "Benefits and Harms"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:benefitsAndHarms.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-benefits-and-harms"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:overallCertaintyOfEvidence",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "overallCertaintyOfEvidence",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:overallCertaintyOfEvidence.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "Overall",
              "display" : "Overall certainty"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:overallCertaintyOfEvidence.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-certainty-of-evidence"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:preferenceAndValues",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "preferenceAndValues",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:preferenceAndValues.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
              "code" : "preference-and-values",
              "display" : "Preference and values"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:preferenceAndValues.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-preference-and-values"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:resources",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "resources",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:resources.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
              "code" : "resources",
              "display" : "Resources"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:resources.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-resources"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:equity",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "equity",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:equity.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
              "code" : "equity",
              "display" : "Equity"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:equity.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-equity"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:acceptability",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "acceptability",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:acceptability.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
              "code" : "acceptability",
              "display" : "Acceptability"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:acceptability.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-acceptability"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:feasibility",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "feasibility",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:feasibility.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
              "code" : "feasibility",
              "display" : "Feasibility"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:feasibility.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-feasibility"
        }
      }
    ]
  }
}

```
