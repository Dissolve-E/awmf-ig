# Recommendation-PlanDefinition-example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation-PlanDefinition-example**

## PlanDefinition: Recommendation-PlanDefinition-example 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/PlanDefinition/Recommendation-PlanDefinition-example | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*: |

* **Actions: **: **Url: **
  * : [Recommendation-PlanDefinition-example](PlanDefinition-Recommendation-PlanDefinition-example.md)
* **Actions: **: **Version: **
  * : 0.2.0
* **Actions: **: **Status: **
  * : draft
* **Actions: **: **Date: **
  * : 2026-01-29 18:27:10+0000
* **Actions: **: **Publisher: **
  * : AWMF e.V.



## Resource Content

```json
{
  "resourceType" : "PlanDefinition",
  "id" : "Recommendation-PlanDefinition-example",
  "url" : "http://fhir.awmf.org/awmf.ig/PlanDefinition/Recommendation-PlanDefinition-example",
  "version" : "0.2.0",
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
  "action" : [
    {
      "id" : "diagnose",
      "title" : "Recommendation 1",
      "description" : "Mach Diagnose",
      "relatedAction" : [
        {
          "targetId" : "therapie",
          "relationship" : "after"
        }
      ]
    },
    {
      "id" : "therapie",
      "title" : "Recommendation 2",
      "description" : "Mach Therapie",
      "relatedAction" : [
        {
          "targetId" : "diagnose",
          "relationship" : "before"
        }
      ]
    }
  ]
}

```
