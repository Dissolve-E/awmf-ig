# Recommendation Direction - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Direction**

## CodeSystem: Recommendation Direction 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-direction | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RecommendationDirectionCS |

 
CodeSystem defining the direction of a clinical recommendation. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RecommendationDirectionVS](ValueSet-vs-recommendation-direction.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-recommendation-direction",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-direction",
  "version" : "0.2.0",
  "name" : "RecommendationDirectionCS",
  "title" : "Recommendation Direction",
  "status" : "active",
  "experimental" : false,
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
  "description" : "CodeSystem defining the direction of a clinical recommendation.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "for",
      "display" : "For",
      "definition" : "The recommendation is in favor of the intervention."
    },
    {
      "code" : "against",
      "display" : "Against",
      "definition" : "The recommendation is against the intervention."
    }
  ]
}

```
