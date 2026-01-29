# Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Mortality - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Mortality**

## Example ArtifactAssessment: Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Mortality

Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on mortality



## Resource Content

```json
{
  "resourceType" : "ArtifactAssessment",
  "id" : "EvA-MultiplexPCRDiagnostic-Mortality",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-grade"
    ]
  },
  "artifactReference" : {
    "reference" : "Evidence/Evidence-MultiplexPCRDiagnostic-Mortality"
  },
  "content" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "http://hl7.org/fhir/certainty-type",
            "code" : "Overall",
            "display" : "Overall certainty"
          }
        ]
      },
      "classifier" : [
        {
          "coding" : [
            {
              "system" : "http://terminology.hl7.org/CodeSystem/certainty-rating",
              "code" : "very-low",
              "display" : "Very low quality"
            }
          ]
        }
      ]
    },
    {
      "type" : {
        "coding" : [
          {
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "rating-system",
            "display" : "Rating System"
          }
        ]
      },
      "classifier" : [
        {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem",
              "code" : "GRADE"
            }
          ]
        }
      ]
    }
  ],
  "workflowStatus" : "applied"
}

```
