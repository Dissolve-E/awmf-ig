# Recommendation Justification SIGN - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Justification SIGN**

## Resource Profile: Recommendation Justification SIGN 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-sign | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RecommendationJustificationSIGN |

 
A structured assessment of the evidence and consensus that underpins a recommendation using the SIGN evidence rating system. 

### Guidance

This profile of a FHIR ArtifactAssessment is derived from the [recommendation-justification](http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/recommendation-justification-sign)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-recommendation-justification-sign.csv), [Excel](StructureDefinition-recommendation-justification-sign.xlsx), [Schematron](StructureDefinition-recommendation-justification-sign.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "recommendation-justification-sign",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-sign",
  "version" : "0.2.0",
  "name" : "RecommendationJustificationSIGN",
  "title" : "Recommendation Justification SIGN",
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
  "description" : "A structured assessment of the evidence and consensus that underpins a recommendation using the SIGN evidence rating system.",
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
        "id" : "ArtifactAssessment.content:evidenceRating",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "evidenceRating"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:ratingSystem",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "ratingSystem"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem",
              "code" : "SIGN",
              "display" : "SIGN"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:levelOfEvidence",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "levelOfEvidence"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:levelOfEvidence.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-sign-level-of-evidence"
        }
      }
    ]
  }
}

```
