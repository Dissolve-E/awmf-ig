# Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia - Sensitivity - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia - Sensitivity**

## Example ArtifactAssessment: Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia - Sensitivity

Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia on Sensitivity



## Resource Content

```json
{
  "resourceType" : "ArtifactAssessment",
  "id" : "RoB-CognitiveTestsWhenSuspectingDementia-Sensitivity",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-cochrane-rob"
    ]
  },
  "artifactReference" : {
    "reference" : "Citation/CitationSystematicReviewTsoi2015"
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
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-rob-2-overall-judgment",
              "code" : "low_risk_of_bias",
              "display" : "Low risk of bias"
            }
          ]
        }
      ]
    }
  ],
  "workflowStatus" : "applied"
}

```
