# Recommendation Strength (AWMF) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Strength (AWMF)**

## CodeSystem: Recommendation Strength (AWMF) 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-strength-awmf | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RecommendationStrengthAWMF |

 
CodeSystem defining the grading of recommendations according to German guideline methodology as used in AWMF S3 guidelines. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RecommendationStrengthAWMFVS](ValueSet-vs-recommendation-strength-awmf.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-recommendation-strength-awmf",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-strength-awmf",
  "version" : "0.2.0",
  "name" : "RecommendationStrengthAWMF",
  "title" : "Recommendation Strength (AWMF)",
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
  "description" : "CodeSystem defining the grading of recommendations according to German guideline methodology as used in AWMF S3 guidelines.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "A",
      "display" : "Strong Recommendation",
      "definition" : "Uses wording such as 'shall' / 'shall not' (original: 'soll' / 'soll nicht').",
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
                "valueString" : "Nutzung von Formulierungen mit 'soll' / 'soll nicht'"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Starke Empfehlung"
        }
      ]
    },
    {
      "code" : "B",
      "display" : "Recommendation",
      "definition" : "Uses wording such as 'should' / 'should not' (original: 'sollte' / 'sollte nicht').",
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
                "valueString" : "Nutzung von Formulierungen mit 'sollte' / 'sollte nicht'"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlung"
        }
      ]
    },
    {
      "code" : "0",
      "display" : "Open Recommendation",
      "definition" : "Uses wording such as 'may be considered' / 'may be omitted' (original: 'kann erwogen werden' / 'kann verzichtet werden').",
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
                "valueString" : "Nutzung von Formulierungen mit 'kann erwogen werden' / 'kann verzichtet werden'"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlung offen"
        }
      ]
    }
  ]
}

```
