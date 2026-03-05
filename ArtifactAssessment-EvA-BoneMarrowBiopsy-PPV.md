# Evidence Assessment: Knochenmarkbiopsie - Positiver Vorhersagewert (Stadieneinteilung) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Assessment: Knochenmarkbiopsie - Positiver Vorhersagewert (Stadieneinteilung)**

## Example ArtifactAssessment: Evidence Assessment: Knochenmarkbiopsie - Positiver Vorhersagewert (Stadieneinteilung)

Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Positiver Vorhersagewert (Stadieneinteilung)



## Resource Content

```json
{
  "resourceType" : "ArtifactAssessment",
  "id" : "EvA-BoneMarrowBiopsy-PPV",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-grade"]
  },
  "artifactReference" : {
    "reference" : "Evidence/Evidence-BoneMarrowBiopsy-PPV"
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
        "code" : "low",
        "display" : "Low quality"
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
