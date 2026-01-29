# AGREE II Domains - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AGREE II Domains**

## CodeSystem: AGREE II Domains 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-agree-ii-domains | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:AGREEIIDomains |

 
CodeSystem representing the domains assessed by the AGREE II instrument for evaluating the quality of clinical practice guidelines. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AGREEIIDomainsVS](ValueSet-vs-agree-ii-domains.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-agree-ii-domains",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-agree-ii-domains",
  "version" : "0.2.0",
  "name" : "AGREEIIDomains",
  "title" : "AGREE II Domains",
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
  "description" : "CodeSystem representing the domains assessed by the AGREE II instrument for evaluating the quality of clinical practice guidelines.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "scope_and_purpose",
      "display" : "Scope and Purpose",
      "definition" : "Concerns the overall aim of the guideline, the specific health questions, and the target population.",
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
                "valueString" : "Bezieht sich auf das Gesamtziel einer Leitlinie, die in der Leitlinie behandelten gesundheitsrelevanten Fragen und die Zielpopulation der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Geltungsbereich und Zweck"
        }
      ]
    },
    {
      "code" : "stakeholder_involvement",
      "display" : "Stakeholder Involvement",
      "definition" : "Focuses on the extent to which the guideline was developed by the appropriate stakeholders and represents the views of its intended users.",
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
                "valueString" : "Fragt, inwieweit alle relevanten Berufsgruppen an der Erstellung der Leitlinie beteiligt waren und diese die Ansichten der Anwenderzielgruppe repräsentieren."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Beteiligung von Interessengruppen"
        }
      ]
    },
    {
      "code" : "rigour_of_development",
      "display" : "Rigour of Development",
      "definition" : "Relates to the process used to gather and synthesize the evidence, the methods to formulate the recommendations, and to update them.",
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
                "valueString" : "Bezieht sich auf das Verfahren, mit dem die Evidenz gesucht und zusammengefasst wurde, sowie auf die Methoden zur Formulierung und zur Aktualisierung der Empfehlungen"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Genauigkeit der Leitlinienentwicklung"
        }
      ]
    },
    {
      "code" : "clarity_of_presentation",
      "display" : "Clarity of Presentation",
      "definition" : "Deals with the language, structure, and format of the guideline.",
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
                "valueString" : "Befasst sich mit der Sprache, der Struktur und dem Format der Leitlinie"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Klarheit der Gestaltung"
        }
      ]
    },
    {
      "code" : "applicability",
      "display" : "Applicability",
      "definition" : "Pertains to the likely barriers and facilitators to implementation, strategies to improve uptake, and resource implications of applying the guideline.",
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
                "valueString" : "Betrifft mögliche förderliche und hinderliche Faktoren für die Anwendung der Leitlinie, Strategien zur Förderung der Leitlinienanwendung und Auswirkungen der Anwendung der Leitlinie auf den Ressourcenverbrauch"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Anwendbarkeit"
        }
      ]
    },
    {
      "code" : "editorial_independence",
      "display" : "Editorial Independence",
      "definition" : "Is concerned with the formulation of recommendations not being unduly biased with competing interests.",
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
                "valueString" : "Befasst sich mit dem Einfluss möglicher Interessenkonflikte auf die Formulierung der Empfehlungen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Redaktionelle Unabhängigkeit"
        }
      ]
    }
  ]
}

```
