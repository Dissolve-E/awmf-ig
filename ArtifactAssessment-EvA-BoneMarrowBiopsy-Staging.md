# Evidence Assessment: Knochenmarkbiopsie - Stadieneinteilung - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Assessment: Knochenmarkbiopsie - Stadieneinteilung**

## Example ArtifactAssessment: Evidence Assessment: Knochenmarkbiopsie - Stadieneinteilung

Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Stadieneinteilung



## Resource Content

```json
{
  "resourceType" : "ArtifactAssessment",
  "id" : "EvA-BoneMarrowBiopsy-Staging",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-grade"]
  },
  "artifactReference" : {
    "reference" : "Evidence/Evidence-BoneMarrowBiopsy-Staging"
  },
  "content" : [{
    "type" : {
      "coding" : [{
        "system" : "http://hl7.org/fhir/certainty-type",
        "code" : "Overall",
        "display" : "Overall certainty"
      }]
    },
    "classifier" : [{
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/certainty-rating",
        "code" : "moderate",
        "display" : "Moderate quality"
      }]
    }]
  },
  {
    "type" : {
      "coding" : [{
        "system" : "https://fevir.net/resources/CodeSystem/179423",
        "code" : "rating-system",
        "display" : "Rating System"
      }]
    },
    "classifier" : [{
      "coding" : [{
        "system" : "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem",
        "code" : "GRADE"
      }]
    }]
  }],
  "workflowStatus" : "applied"
}

```
