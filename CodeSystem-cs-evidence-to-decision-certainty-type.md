# Evidence To Decision Certainty type - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence To Decision Certainty type**

## CodeSystem: Evidence To Decision Certainty type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:EvidenceToDecisionCertaintyType |

 
CodeSystem defining values to represent the GRADE Evidence to Decision (EtD) Framework Certainty Type 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-evidence-to-decision-certainty-type",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-type",
  "version" : "0.2.0",
  "name" : "EvidenceToDecisionCertaintyType",
  "title" : "Evidence To Decision Certainty type",
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
  "description" : "CodeSystem defining values to represent the GRADE Evidence to Decision (EtD) Framework Certainty Type",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "benefits-and-harms",
      "display" : "Benefits and Harms",
      "definition" : "Summary of most important benefits and harms",
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
                "valueString" : "Zusammenfassung der wichtigsten Nutzen und Schäden."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Nutzen und Schaden"
        }
      ]
    },
    {
      "code" : "preference-and-values",
      "display" : "Preference and values",
      "definition" : "Typical patient preferences and values? Common issues or expected variability?",
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
                "valueString" : "Typische Wertvorstellungen und Präferenzen der/des Patient*in? Geläufige Probleme oder erwartete Variabilität?"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Wertvorstellungen und Präferenzen"
        }
      ]
    },
    {
      "code" : "resources",
      "display" : "Resources",
      "definition" : "Issues with costs or resource use? For whom? Cost-benefit analysis? Implementation or other issues?",
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
                "valueString" : "Probleme bezogen auf Kosten oder Ressourcenverbrauch? Für wen? Kosten-Nutzen-Analyse? Umsetzung oder andere Probleme?"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Ressourcen"
        }
      ]
    },
    {
      "code" : "equity",
      "display" : "Equity",
      "definition" : "How do the different alternatives affect equity?",
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
                "valueString" : "Wie wirken sich die verschiedenen Alternativen auf die Gerechtigkeit aus?"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Gerechtigkeit"
        }
      ]
    },
    {
      "code" : "acceptability",
      "display" : "Acceptability",
      "definition" : "Are the alternatives acceptable for the target population and its implementors?",
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
                "valueString" : "Sind die Alternativen für die Zielpopulatino und die Durchführenden akzeptabel?"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Akzeptanz"
        }
      ]
    },
    {
      "code" : "feasibility",
      "display" : "Feasibility",
      "definition" : "How feasible will it be to implement the different alternatives? Any issues?",
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
                "valueString" : "Wie praktikabel ist die Umsetzung der verschiedenen Alternativen? Gibt es Probleme?"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Durchführbarkeit"
        }
      ]
    }
  ]
}

```
