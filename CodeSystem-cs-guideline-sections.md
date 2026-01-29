# Guideline Sections - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Sections**

## CodeSystem: Guideline Sections 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:GuidelineSectionsCS |

 
Sections of a guideline, describing various aspects such as its intention, target patient group, care setting, and other relevant contextual information. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ContentTypesVS](ValueSet-vs-content-types.md)
* [GuidelineSectionsVS](ValueSet-vs-guideline-sections.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-guideline-sections",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
  "version" : "0.2.0",
  "name" : "GuidelineSectionsCS",
  "title" : "Guideline Sections",
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
  "description" : "Sections of a guideline, describing various aspects such as its intention, target patient group, care setting, and other relevant contextual information.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 34,
  "concept" : [
    {
      "code" : "intention",
      "display" : "Intention",
      "definition" : "The section describes the intention of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die Zielorientierung der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Zielorientierung"
        }
      ]
    },
    {
      "code" : "target-patient-group",
      "display" : "Target Patient Group",
      "definition" : "The section describes the target patient group of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die Patientenzielgruppe der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Patientenzielgruppe"
        }
      ]
    },
    {
      "code" : "care-setting",
      "display" : "Care Setting",
      "definition" : "The section describes the care setting of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt den Versorgungsbereich dieser Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Versorgungsbereich"
        }
      ]
    },
    {
      "code" : "topic-selection-reason",
      "display" : "Topic Selection Reason",
      "definition" : "The section describes the reason for selecting the topic of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die Gründe für die Themenwahl der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Gründe für die Themenwahl"
        }
      ]
    },
    {
      "code" : "target-audience",
      "display" : "Target Audience",
      "definition" : "The section describes the target audience of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die Adressaten der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Adressaten"
        }
      ]
    },
    {
      "code" : "planned-methodology",
      "display" : "Planned Methodology",
      "definition" : "The section describes the planned methodology for developing the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die geplante Methodik zur Entwicklung der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Geplante Methodik"
        }
      ]
    },
    {
      "code" : "further-information",
      "display" : "Further Information",
      "definition" : "The section describes the further information regarding the guideline project.",
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
                "valueString" : "Dieser Abschnitt beschreibt ergänzende Informationen zum Leitlinienprojekt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Ergänzende Informationen"
        }
      ]
    },
    {
      "code" : "encounter-type",
      "display" : "Encounter Type",
      "definition" : "The section describes the encounter type of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt den oder die Versorgungssektor(en) auf die sich die Leitlinie bezieht."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Versorgungssektor"
        }
      ]
    },
    {
      "code" : "care-stage",
      "display" : "Care Stage",
      "definition" : "The section describes the care stage of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt den Versorgungsbereich dieser Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Versorgungsbereich"
        }
      ]
    },
    {
      "code" : "care-level",
      "display" : "Care Level",
      "definition" : "The section describes the care level of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die Versorgungsebene(n) auf die sich die Leitlinie bezieht."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Versorgungsebene"
        }
      ]
    },
    {
      "code" : "keywords",
      "display" : "Keywords",
      "definition" : "The section describes the keywords of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt die Schlüsselwörter der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Schlüsselwörter"
        }
      ]
    },
    {
      "code" : "language",
      "display" : "Language",
      "definition" : "The language of the content",
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
                "valueString" : "Sprache des Inhalts"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Sprache"
        }
      ]
    },
    {
      "code" : "default-section",
      "display" : "Default section",
      "definition" : "The default slice for a section",
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
                "valueString" : "Default ('standard') slice für einen Abschnitt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Standardabschnitt"
        }
      ]
    },
    {
      "code" : "attachments",
      "display" : "Attachments",
      "designation" : [
        {
          "language" : "de",
          "value" : "Anhänge"
        }
      ]
    },
    {
      "code" : "consensus-protocol",
      "display" : "Consensus Protocol",
      "definition" : "The section describes the consensus protocol of the guideline.",
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
                "valueString" : "Dieser Abschnitt beschreibt den Konsensprotokoll einer Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Konsensprotokoll"
        }
      ]
    },
    {
      "code" : "long-version",
      "display" : "Long Version",
      "designation" : [
        {
          "language" : "de",
          "value" : "Langfassung"
        }
      ]
    },
    {
      "code" : "short-version",
      "display" : "Short Version",
      "designation" : [
        {
          "language" : "de",
          "value" : "Kurzfassung"
        }
      ]
    },
    {
      "code" : "guideline-report",
      "display" : "Guideline Report",
      "designation" : [
        {
          "language" : "de",
          "value" : "Leitlinienreport"
        }
      ]
    },
    {
      "code" : "evidence-report",
      "display" : "Evidence Report",
      "designation" : [
        {
          "language" : "de",
          "value" : "Evidenzbericht"
        }
      ]
    },
    {
      "code" : "implementation-guidance",
      "display" : "Implementation Guidance",
      "designation" : [
        {
          "language" : "de",
          "value" : "Implementierungshilfe"
        }
      ]
    },
    {
      "code" : "decision-support",
      "display" : "Decision Support",
      "designation" : [
        {
          "language" : "de",
          "value" : "Entscheidungshilfe"
        }
      ]
    },
    {
      "code" : "patient-version",
      "display" : "Patient Version",
      "designation" : [
        {
          "language" : "de",
          "value" : "Patientenleitlinie"
        }
      ]
    },
    {
      "code" : "choosing-wisely",
      "display" : "Choosing Wisely",
      "designation" : [
        {
          "language" : "de",
          "value" : "Gemeinsam Klug Entscheiden"
        }
      ]
    },
    {
      "code" : "quality-indicators",
      "display" : "Quality Indicators",
      "designation" : [
        {
          "language" : "de",
          "value" : "Qualitätsindikatoren"
        }
      ]
    },
    {
      "code" : "declaration-of-interests",
      "display" : "Declaration of Interests",
      "designation" : [
        {
          "language" : "de",
          "value" : "Interessenserklärung"
        }
      ]
    },
    {
      "code" : "short-patient-version",
      "display" : "Short Version for Patients",
      "designation" : [
        {
          "language" : "de",
          "value" : "Kurzfassung für Patient*innen"
        }
      ]
    },
    {
      "code" : "update-info",
      "display" : "Short Information About an Update",
      "designation" : [
        {
          "language" : "de",
          "value" : "Kurzinformationen zu einer Aktualisierung"
        }
      ]
    },
    {
      "code" : "slide-deck",
      "display" : "Slide Deck",
      "designation" : [
        {
          "language" : "de",
          "value" : "Foliensatz"
        }
      ]
    },
    {
      "code" : "visual-abstract",
      "display" : "Visual Abstract",
      "designation" : [
        {
          "language" : "de",
          "value" : "Graphischer Abstrakt"
        }
      ]
    },
    {
      "code" : "document",
      "display" : "Document",
      "designation" : [
        {
          "language" : "de",
          "value" : "Dokument"
        }
      ]
    },
    {
      "code" : "image",
      "display" : "Image",
      "designation" : [
        {
          "language" : "de",
          "value" : "Bild"
        }
      ]
    },
    {
      "code" : "video",
      "display" : "Video",
      "designation" : [
        {
          "language" : "de",
          "value" : "Video"
        }
      ]
    },
    {
      "code" : "podcast",
      "display" : "Podcast",
      "designation" : [
        {
          "language" : "de",
          "value" : "Podcast"
        }
      ]
    },
    {
      "code" : "other",
      "display" : "Other",
      "designation" : [
        {
          "language" : "de",
          "value" : "Sonstiges"
        }
      ]
    }
  ]
}

```
