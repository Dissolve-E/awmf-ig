# Recommendation Review Status Code System - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Review Status Code System**

## CodeSystem: Recommendation Review Status Code System 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-review-status | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RecommendationReviewStatusCS |

 
CodeSystem defining values indicating how a recommendation relates to a new revision of a recommendation 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RecommendationReviewStatusVS](ValueSet-vs-recommendation-review-status.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-recommendation-review-status",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-review-status",
  "version" : "0.2.0",
  "name" : "RecommendationReviewStatusCS",
  "title" : "Recommendation Review Status Code System",
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
  "description" : "CodeSystem defining values indicating how a recommendation relates to a new revision of a recommendation",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "added",
      "display" : "Added",
      "definition" : "Recommendation was newly added in this version of the guideline",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Diese Empfehlung ist in dieser Version der Leitlinie neu dazugekommen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Hinzugefügt"
        }
      ]
    },
    {
      "code" : "updated",
      "display" : "Updated",
      "definition" : "Recommendation was modified or updated",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Diese Empfehlung wurde geändert oder aktualisiert."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Aktualisiert"
        }
      ]
    },
    {
      "code" : "reaffirmed",
      "display" : "Reaffirmed",
      "definition" : "Recommendation was reviewed and explicitly confirmed to still be valid",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Diese Empfehlung wurde geprüft und ihre Gültigkeit explizit bestätigt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Bestätigt."
        }
      ]
    }
  ]
}

```
