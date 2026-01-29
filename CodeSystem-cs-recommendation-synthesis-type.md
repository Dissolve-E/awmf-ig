# Recommendation Synthesis Type - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Synthesis Type**

## CodeSystem: Recommendation Synthesis Type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-synthesis-type | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RecommendationSynthesisTypeCS |

 
CodeSystem defining values representing the synthesis type of a recommendation 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RecommendationSynthesisTypeVS](ValueSet-vs-recommendation-synthesis-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-recommendation-synthesis-type",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-synthesis-type",
  "version" : "0.2.0",
  "name" : "RecommendationSynthesisTypeCS",
  "title" : "Recommendation Synthesis Type",
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
  "description" : "CodeSystem defining values representing the synthesis type of a recommendation",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "evidence-based",
      "display" : "Evidence-based",
      "definition" : "Evidence-based recommendation",
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
                "valueString" : "Evidenzbasierte Empfehlung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Evidenzbasiert"
        }
      ]
    },
    {
      "code" : "expert-consensus",
      "display" : "Expert Consensus",
      "definition" : "Expert consensus recommendation",
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
                "valueString" : "Konsensbasierte Empfehlung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Konsensbasiert"
        }
      ]
    },
    {
      "code" : "statement",
      "display" : "Statement",
      "definition" : "Statement",
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
                "valueString" : "Aussage"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Aussage"
        }
      ]
    }
  ]
}

```
