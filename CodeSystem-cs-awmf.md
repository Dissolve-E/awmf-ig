# awmf - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **awmf**

## CodeSystem: awmf 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:AWMFCS |

 
CodeSystem representing different codes of interest for the Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF) 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-awmf",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
  "version" : "0.2.0",
  "name" : "AWMFCS",
  "title" : "awmf",
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
  "description" : "CodeSystem representing different codes of interest for the Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF)",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 13,
  "concept" : [
    {
      "code" : "ordered-by-authors",
      "display" : "Ordered by authors",
      "definition" : "The guideline is ordered by authors and SHALL be adhered to in the order specified.",
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
                "valueString" : "Die Leitlinie wurde von den Autor*innen geordnet und MUSS in der angegebenen Reihenfolge befolgt werden."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Durch Autor*innen geordnet"
        }
      ]
    },
    {
      "code" : "major-minor",
      "display" : "Major-Minor Versioning",
      "definition" : "A versioning scheme using major and minor version numbers (e.g., 1.0, 2.1).",
      "designation" : [
        {
          "language" : "de",
          "value" : "Major-Minor Versionierungsschema"
        }
      ]
    },
    {
      "code" : "year-month-versioning",
      "display" : "Year-Month Versioning",
      "definition" : "A versioning scheme based on year and month (e.g., 2024/06).",
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
                "valueString" : "Versionierungsschema im Format Jahr-Monat (z.B. 2024/06)"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Jahr-Monat Versionierungsschema"
        }
      ]
    },
    {
      "code" : "medical-society",
      "display" : "Medical Society",
      "definition" : "A medical society.",
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
                "valueString" : "Eine medizinische Fachgesellschaft."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Medizinische Fachgesellschaft"
        }
      ]
    },
    {
      "code" : "awmf-member-organization",
      "display" : "AWMF Member Organization",
      "definition" : "An organization that is a member of the AWMF",
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
                "valueString" : "Eine Organisation oder Fachgesellschaft, die Mitglied der AWMF ist."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Mitgliedsorganisation der AWMF"
        }
      ]
    },
    {
      "code" : "recommendation-rating",
      "display" : "Recommendation Rating",
      "definition" : "The rating of a recommendation",
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
                "valueString" : "Graduierung der Empfehlung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlungsgraduierung"
        }
      ]
    },
    {
      "code" : "level-of-consensus",
      "display" : "Level of Consensus",
      "definition" : "The level of consensus for a recommendation",
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
                "valueString" : "Die Stärke des Konsens einer Empfehlung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Konsensusstärke"
        }
      ]
    },
    {
      "code" : "guideline-registry-record",
      "display" : "Guideline Registry Record",
      "definition" : "A registry record for a clinical practice guideline in the AWMF guideline registry",
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
                "valueString" : "Ein Registrierungseintrag für eine klinische Praxisleitlinie im AWMF-Leitlinienregister"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Leitlinien-Registrierungseintrag"
        }
      ]
    },
    {
      "code" : "patient-organization",
      "display" : "Patient Organization",
      "definition" : "An organization that represents patients",
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
                "valueString" : "Eine Organisation, die Patienten vertritt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Patientenorganisation"
        }
      ]
    },
    {
      "code" : "OCEBM2009",
      "display" : "Oxford 2009 (OCEBM)"
    },
    {
      "code" : "outcome",
      "display" : "Outcome",
      "definition" : "An outcome used in the evidence assessment of a recommendation",
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
                "valueString" : "Ein Ergebnis, das in der Evidenzbewertung einer Empfehlung verwendet wird."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Ergebnis"
        }
      ]
    },
    {
      "code" : "overall-quality-of-evidence",
      "display" : "Overall Quality of Evidence",
      "definition" : "The overall quality of evidence for a recommendation",
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
                "valueString" : "Die Gesamtqualität der Evidenz für eine Empfehlung."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Gesamtqualität der Evidenz"
        }
      ]
    },
    {
      "code" : "evidence-rating",
      "display" : "Evidence Rating",
      "definition" : "The evidence rating for a recommendation",
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
                "valueString" : "Die Evidenzbewertung für eine Empfehlung."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Evidenzbewertung"
        }
      ]
    }
  ]
}

```
