# OCEBM 2009 Levels of Evidence - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OCEBM 2009 Levels of Evidence**

## CodeSystem: OCEBM 2009 Levels of Evidence 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-ocebm-2009-levels-of-evidence | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:OCEBM2009LevelsOfEvidence |

 
CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2009 CEBM Levels of Evidence 

 This Code system is referenced in the content logical definition of the following value sets: 

* [OCEBM2009LevelsOfEvidenceVS](ValueSet-vs-ocebm-2009-levels-of-evidence.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-ocebm-2009-levels-of-evidence",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-ocebm-2009-levels-of-evidence",
  "version" : "0.2.0",
  "name" : "OCEBM2009LevelsOfEvidence",
  "title" : "OCEBM 2009 Levels of Evidence",
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
  "description" : "CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2009 CEBM Levels of Evidence",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 10,
  "concept" : [
    {
      "code" : "1a",
      "display" : "1a",
      "definition" : "Systematic reviews of high-quality RCTs",
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
                "valueString" : "Systematische Reviews hochwertiger RCTs"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "1a"
        }
      ]
    },
    {
      "code" : "1b",
      "display" : "1b",
      "definition" : "Individual RCT (with narrow confidence interval)",
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
                "valueString" : "Einzelne randomisierte kontrollierte Studien (mit engem Konfidenzintervall)"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "1b"
        }
      ]
    },
    {
      "code" : "1c",
      "display" : "1c",
      "definition" : "All or none RCTs",
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
                "valueString" : "Alle oder keine randomisierten kontrollierten Studien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "1c"
        }
      ]
    },
    {
      "code" : "2a",
      "display" : "2a",
      "definition" : "Systematic reviews of cohort studies",
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
                "valueString" : "Systematische Reviews von Kohortenstudien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "2a"
        }
      ]
    },
    {
      "code" : "2b",
      "display" : "2b",
      "definition" : "Individual cohort study or low-quality RCT",
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
                "valueString" : "Individuelle Kohortenstudie oder randomisierte kontrollierte Studien mit niedriger Qualität"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "2b"
        }
      ]
    },
    {
      "code" : "2c",
      "display" : "2c",
      "definition" : "Outcomes research; ecological studies",
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
                "valueString" : "Outcomes-Forschung; ökologische Studien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "2c"
        }
      ]
    },
    {
      "code" : "3a",
      "display" : "3a",
      "definition" : "Systematic reviews of case-control studies",
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
                "valueString" : "Systematische Überprüfung von Fall-Kontroll-Studien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "3a"
        }
      ]
    },
    {
      "code" : "3b",
      "display" : "3b",
      "definition" : "Individual case-control study",
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
                "valueString" : "Einzelne Fall-Kontroll-Studie"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "3b"
        }
      ]
    },
    {
      "code" : "4",
      "display" : "4",
      "definition" : "Case series",
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
                "valueString" : "Fallserie"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "4"
        }
      ]
    },
    {
      "code" : "5",
      "display" : "5",
      "definition" : "Expert opinion",
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
                "valueString" : "Expertenmeinung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "5"
        }
      ]
    }
  ]
}

```
