# PICO Related Terms - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PICO Related Terms**

## CodeSystem: PICO Related Terms 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:PICOCS |

 
CodeSystem defining different terms related to PICO question and objects 

 This Code system is referenced in the content logical definition of the following value sets: 

* [PICOVS](ValueSet-vs-pico.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-pico",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
  "version" : "0.2.0",
  "name" : "PICOCS",
  "title" : "PICO Related Terms",
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
  "description" : "CodeSystem defining different terms related to PICO question and objects",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 7,
  "concept" : [
    {
      "code" : "pico-question",
      "display" : "PICO question",
      "definition" : "PICO question",
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
                "valueString" : "PICO Fragestellung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "PICO Fragestellung"
        }
      ]
    },
    {
      "code" : "population",
      "display" : "Population",
      "definition" : "Population",
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
                "valueString" : "Population"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Population"
        }
      ]
    },
    {
      "code" : "intervention",
      "display" : "Intervention",
      "definition" : "Intervention",
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
                "valueString" : "Intervention"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Intervention"
        }
      ]
    },
    {
      "code" : "comparator",
      "display" : "Comparator",
      "definition" : "Comparator",
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
                "valueString" : "Vergleichsintervention"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Vergleichsintervention"
        }
      ]
    },
    {
      "code" : "outcome",
      "display" : "Outcome",
      "definition" : "Outcome",
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
                "valueString" : "Outcome"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Outcome"
        }
      ]
    },
    {
      "code" : "setting",
      "display" : "Setting",
      "definition" : "Setting",
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
                "valueString" : "Setting"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Setting"
        }
      ]
    },
    {
      "code" : "timing",
      "display" : "Timing",
      "definition" : "Timing",
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
                "valueString" : "Zeitpunkt"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Zeitpunkt"
        }
      ]
    }
  ]
}

```
