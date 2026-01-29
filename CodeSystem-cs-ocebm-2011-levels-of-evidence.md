# OCEBM 2011 Levels of Evidence - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OCEBM 2011 Levels of Evidence**

## CodeSystem: OCEBM 2011 Levels of Evidence 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-ocebm-2011-levels-of-evidence | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:OCEBM2011LevelsOfEvidence |

 
CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [OCEBM2011LevelsOfEvidenceVS](ValueSet-ocebm-2011-levels-of-evidence-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-ocebm-2011-levels-of-evidence",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-ocebm-2011-levels-of-evidence",
  "version" : "0.2.0",
  "name" : "OCEBM2011LevelsOfEvidence",
  "title" : "OCEBM 2011 Levels of Evidence",
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
  "description" : "CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "level1",
      "display" : "Systematic Reviews and Randomized Trials",
      "definition" : "Includes systematic reviews of randomized trials or n-of-1 trials.",
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
                "valueString" : "Schließt systematische Reviews von randomisierten Studien oder n-of-1-Studien ein."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Systematische Reviews und randomisierte Studien"
        }
      ]
    },
    {
      "code" : "level2",
      "display" : "Cohort Studies",
      "definition" : "Includes systematic reviews of cohort studies or individual cohort studies and low-quality randomized trials.",
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
                "valueString" : "Schließt systematische Reviews von Kohortenstudien oder einzelne Kohortenstudien oder randomisierte Studien mit niedriger Qualität ein."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Kohortenstudien"
        }
      ]
    },
    {
      "code" : "level3",
      "display" : "Case-Control Studies",
      "definition" : "Includes systematic reviews of case-control studies or individual case-control studies.",
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
                "valueString" : "Schließt systematische Reviews von Fall-Kontroll-Studien oder einzelne Fall-Kontroll-Studien."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Fall-Kontroll-Studie"
        }
      ]
    },
    {
      "code" : "level4",
      "display" : "Case Series",
      "definition" : "Includes case series and poor-quality cohort and case-control studies.",
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
                "valueString" : "Schließt Fallserien sowie Kohorten- und Fall-Kontroll-Studien mit niedriger Qualität ein."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Fallserien"
        }
      ]
    },
    {
      "code" : "level5",
      "display" : "Expert Opinion",
      "definition" : "Includes expert opinion without explicit critical appraisal, or based on physiology, bench research, or 'first principles'.",
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
                "valueString" : "Umfasst Expertenmeinung(en) ohne explizite kritische Beurteilung oder auf der Grundlage von Physiologie, Bench Research oder First Principles"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Expertenmeinung"
        }
      ]
    }
  ]
}

```
