# Level of Consensus - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Level of Consensus**

## CodeSystem: Level of Consensus 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-level-of-consensus | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:LevelOfConsensusCS |

 
CodeSystem defining the values representing the level of consensus for a recommendation. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [LevelOfConsensusVS](ValueSet-vs-level-of-consensus.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-level-of-consensus",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-level-of-consensus",
  "version" : "0.2.0",
  "name" : "LevelOfConsensusCS",
  "title" : "Level of Consensus",
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
  "description" : "CodeSystem defining the values representing the level of consensus for a recommendation.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "strong-consensus",
      "display" : "Strong consensus",
      "definition" : "Agreement by >95% of participants.",
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
                "valueString" : "Zustimmung von > 95 % der Teilnehmenden"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Starker Konsens"
        }
      ]
    },
    {
      "code" : "consensus",
      "display" : "Consensus",
      "definition" : "Agreement by >75-95% of participants.",
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
                "valueString" : "Zustimmung von > 75 - 95 % der Teilnehmenden"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Konsens"
        }
      ]
    },
    {
      "code" : "majority-agreement",
      "display" : "Majority agreement",
      "definition" : "Agreement by >50-75% of participants.",
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
                "valueString" : "Zustimmung von > 50 - 75 % der Teilnehmenden"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Mehrheitliche Zustimmung"
        }
      ]
    },
    {
      "code" : "no-majority-agreement",
      "display" : "No majority agreement",
      "definition" : "Agreement by ≤50% of participants.",
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
                "valueString" : "Zustimmung von ≤ 50 % der Teilnehmenden"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Keine mehrheitliche Zustimmung"
        }
      ]
    }
  ]
}

```
