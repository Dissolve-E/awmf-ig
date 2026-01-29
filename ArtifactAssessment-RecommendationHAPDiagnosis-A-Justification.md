# RecommendationHAPDiagnosis-A-Justification - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **RecommendationHAPDiagnosis-A-Justification**

## Example ArtifactAssessment: RecommendationHAPDiagnosis-A-Justification

Justification for Recommendation HAP Diagnose A



## Resource Content

```json
{
  "resourceType" : "ArtifactAssessment",
  "id" : "RecommendationHAPDiagnosis-A-Justification",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification"
    ]
  },
  "artifactReference" : {
    "reference" : "Composition/RecommendationHAPDiagnosis-A"
  },
  "content" : [
    {
      "type" : {
        "coding" : [
          {
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "recommendation-rating",
            "display" : "Recommendation Rating"
          }
        ]
      },
      "component" : [
        {
          "type" : {
            "coding" : [
              {
                "system" : "https://fevir.net/resources/CodeSystem/179423",
                "code" : "strength-of-recommendation",
                "display" : "Strength of Recommendation"
              }
            ]
          },
          "classifier" : [
            {
              "coding" : [
                {
                  "system" : "http://terminology.hl7.org/CodeSystem/recommendation-strength",
                  "code" : "strong",
                  "display" : "Strong"
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
                "code" : "direction-of-recommendation",
                "display" : "Direction of Recommendation"
              }
            ]
          },
          "classifier" : [
            {
              "coding" : [
                {
                  "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-direction",
                  "code" : "for",
                  "display" : "For"
                }
              ]
            }
          ]
        },
        {
          "type" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
                "code" : "level-of-consensus"
              }
            ]
          },
          "classifier" : [
            {
              "coding" : [
                {
                  "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-level-of-consensus",
                  "code" : "strong-consensus",
                  "display" : "Strong consensus"
                }
              ]
            }
          ]
        }
      ]
    }
  ],
  "workflowStatus" : "applied"
}

```
