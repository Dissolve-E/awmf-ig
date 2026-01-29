# Care Setting - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Care Setting**

## CodeSystem: Care Setting 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-care-setting | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:CareSetting |

 
CodeSystem defining different care settings, including levels of care, healthcare services, and treatment contexts. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [CareLevelVS](ValueSet-vs-care-level.md)
* [CareStageVS](ValueSet-vs-care-stage.md)
* [EncounterTypeVS](ValueSet-vs-encounter-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-care-setting",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-care-setting",
  "version" : "0.2.0",
  "name" : "CareSetting",
  "title" : "Care Setting",
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
  "description" : "CodeSystem defining different care settings, including levels of care, healthcare services, and treatment contexts.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 10,
  "concept" : [
    {
      "code" : "prevention",
      "display" : "Prevention",
      "definition" : "Activities aimed at preventing diseases or injuries before they occur.",
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
                "valueString" : "Aktivitäten, die darauf abzielen, Krankheiten oder Verletzungen zu verhindern, bevor sie auftreten."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Prävention"
        }
      ]
    },
    {
      "code" : "early-detection",
      "display" : "Early Detection",
      "definition" : "The identification of diseases or conditions at an early stage, often before symptoms appear.",
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
                "valueString" : "Erkennung von Krankheiten oder Zuständen in einem frühen Stadium, oft bevor Symptome auftreten."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Früherkennung"
        }
      ]
    },
    {
      "code" : "diagnosis",
      "display" : "Diagnosis",
      "definition" : "The process of determining the nature and cause of a disease or injury through evaluation of patient history, examination, and tests.",
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
                "valueString" : "Prozess der Bestimmung der Art und Ursache einer Krankheit oder Verletzung durch Auswertung der Krankengeschichte, Untersuchungen und Tests."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Diagnostik"
        }
      ]
    },
    {
      "code" : "therapy",
      "display" : "Therapy",
      "definition" : "The treatment of a disease or condition, including medical, surgical, or psychological interventions.",
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
                "valueString" : "Behandlung einer Krankheit oder eines Zustands, einschließlich medizinischer, chirurgischer oder psychologischer Eingriffe."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Behandlung"
        }
      ]
    },
    {
      "code" : "rehabilitation",
      "display" : "Rehabilitation",
      "definition" : "The process of restoring physical, mental, or social abilities lost due to illness or injury.",
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
                "valueString" : "Der Prozess der Wiederherstellung körperlicher, geistiger oder sozialer Fähigkeiten, die aufgrund von Krankheit oder Verletzung verloren gegangen sind."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Rehabilitation"
        }
      ]
    },
    {
      "code" : "primary-care",
      "display" : "Primary Care",
      "definition" : "First-contact healthcare provided by general practitioners or family physicians.",
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
                "valueString" : "Medizinische Versorgung durch den Allgemein- oder Hausarzt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Primärärztliche Versorgung"
        }
      ]
    },
    {
      "code" : "specialized-care",
      "display" : "Specialized Care",
      "definition" : "Healthcare provided by medical specialists with advanced training in specific fields.",
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
                "valueString" : "Medizinische Versorgung durch Fachärzt*innen mit spezieller Ausbildung in bestimmten Bereichen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Spezialärztliche Versorgung"
        }
      ]
    },
    {
      "code" : "outpatient",
      "display" : "Outpatient",
      "definition" : "Healthcare services provided to patients who are not admitted to a hospital or other facility.",
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
                "valueString" : "Gesundheitsdienstleistungen für Patient*innen, die nicht in ein Krankenhaus oder eine andere Einrichtung eingewiesen werden."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Ambulant"
        }
      ]
    },
    {
      "code" : "inpatient",
      "display" : "Inpatient",
      "definition" : "Healthcare services provided to patients who are admitted to a hospital or other facility for at least one night.",
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
                "valueString" : "Gesundheitsdienstleistungen für Patient*innen, die für mindestens eine Nacht in ein Krankenhaus oder eine andere Einrichtung eingewiesen werden."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Stationär"
        }
      ]
    },
    {
      "code" : "partial-hospitalization",
      "display" : "Partial Hospitalization",
      "definition" : "Healthcare services provided in a hospital or facility during the day, with patients returning home at night.",
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
                "valueString" : "Gesundheitsdienstleistungen, die tagsüber in einem Krankenhaus oder einer Einrichtung erbracht werden; Patient*innen bleiben nicht über Nacht im Krankenhaus oder in der Gesundheitseinrichtung."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Teilstationär"
        }
      ]
    }
  ]
}

```
