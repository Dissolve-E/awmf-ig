# RecommendationHAPDiagnosis-B-Justification - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **RecommendationHAPDiagnosis-B-Justification**

## Example ArtifactAssessment: RecommendationHAPDiagnosis-B-Justification

Justification for Recommendation HAP Diagnose B



## Resource Content

```json
{
  "resourceType" : "ArtifactAssessment",
  "id" : "RecommendationHAPDiagnosis-B-Justification",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification"
    ]
  },
  "artifactReference" : {
    "reference" : "Composition/RecommendationHAPDiagnosis-B"
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
                  "code" : "weak",
                  "display" : "Weak"
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
