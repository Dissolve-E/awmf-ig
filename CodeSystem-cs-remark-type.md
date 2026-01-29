# Remark Type - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Remark Type**

## CodeSystem: Remark Type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-remark-type | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RemarkType |

 
CodeSystem defining different types of remarks that can be associated with guidelines, including restrictions, warnings, and additional notes. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RemarkTypeVS](ValueSet-vs-remark-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-remark-type",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-remark-type",
  "version" : "0.2.0",
  "name" : "RemarkType",
  "title" : "Remark Type",
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
  "description" : "CodeSystem defining different types of remarks that can be associated with guidelines, including restrictions, warnings, and additional notes.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "block",
      "display" : "Block",
      "definition" : "A restriction or prohibition that prevents certain actions or decisions in accordance with guidelines.",
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
                "valueString" : "Einschränkung oder Untersagung, die bestimmte Handlungen oder Entscheidungen in Übereinstimmung mit Leitlinien verhindert."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Block"
        }
      ]
    },
    {
      "code" : "warning",
      "display" : "Warning",
      "definition" : "A cautionary note indicating potential risks or issues that need to be considered.",
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
                "valueString" : "Ein Warnhinweis, der auf mögliche Risiken oder Probleme hinweist, die beachtet werden müssen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Warnung"
        }
      ]
    },
    {
      "code" : "note",
      "display" : "Note",
      "definition" : "An informative remark or additional context provided for clarification.",
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
                "valueString" : "Eine informative Bemerkung oder zusätzliche Kontextinformationen, die der Klärung dient/dienen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Hinweis"
        }
      ]
    },
    {
      "code" : "revision-note",
      "display" : "Revision Note",
      "definition" : "Guideline is currently being revised.",
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
                "valueString" : "Die Leitlinie wird derzeit überarbeitet."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Überarbeitungshinweis"
        }
      ]
    }
  ]
}

```
