# Intended Audience Code System - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Intended Audience Code System**

## CodeSystem: Intended Audience Code System 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-intended-audience | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:IntendedAudienceCS |

 
CodeSystem defining possible intended audiences for a section 

 This Code system is referenced in the content logical definition of the following value sets: 

* [IntendedAudienceVS](ValueSet-vs-intended-audience.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-intended-audience",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-intended-audience",
  "version" : "0.2.0",
  "name" : "IntendedAudienceCS",
  "title" : "Intended Audience Code System",
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
  "description" : "CodeSystem defining possible intended audiences for a section",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 8,
  "concept" : [
    {
      "code" : "patient",
      "display" : "Patient",
      "definition" : "The content is intended for the patient",
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
                "valueString" : "Der Inhalt richtet sich an Patient*innen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Patient*in"
        }
      ]
    },
    {
      "code" : "physician",
      "display" : "Physician",
      "definition" : "The content is intended for the physician",
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
                "valueString" : "Der Inhalt richtet sich an Ärzt*innen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Arzt/Ärztin"
        }
      ]
    },
    {
      "code" : "nurse",
      "display" : "Nurse",
      "definition" : "The content is intended for the nurse",
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
                "valueString" : "Der Inhalt richtet sich an Krankenpfleger*innen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Pfleger*in"
        }
      ]
    },
    {
      "code" : "student",
      "display" : "Student",
      "definition" : "The content is intended for the student",
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
                "valueString" : "Der Inhalt richtet sich an Student*innen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Studierende"
        }
      ]
    },
    {
      "code" : "relative",
      "display" : "Relative",
      "definition" : "The content is intended for the relative of the patient",
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
                "valueString" : "Der Inhalt richtet sich an Angehörige von Patient*innen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Angehörige*r"
        }
      ]
    },
    {
      "code" : "caregiver",
      "display" : "Caregiver",
      "definition" : "The content is intended for the caregiver of the patient",
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
                "valueString" : "Der Inhalt richtet sich an Betreuer*innen von Patient*innen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Betreuer*in"
        }
      ]
    },
    {
      "code" : "layperson",
      "display" : "Layperson",
      "definition" : "The content is intended for a layperson",
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
                "valueString" : "Der Inhalt richtet sich an Laien."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Laie"
        }
      ]
    },
    {
      "code" : "therapist",
      "display" : "Therapist",
      "definition" : "The content is intended for therapeutic healthcare professionals (e.g., physiotherapists, occupational therapists, speech therapists).",
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
                "valueString" : "Der Inhalt richtet sich an therapeutisches Personal (z.B. Physio-, Ergo- oder Sprachtherapeut*innen)."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Therapeutisches Personal"
        }
      ]
    }
  ]
}

```
