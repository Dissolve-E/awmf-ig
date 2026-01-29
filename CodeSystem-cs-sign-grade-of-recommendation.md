# SIGN Grade of Recommendation - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SIGN Grade of Recommendation**

## CodeSystem: SIGN Grade of Recommendation 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-sign-grade-of-recommendation | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:SIGNGradeOfRecommendation |

 
CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Grades of Recommendation. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SIGNGradeOfRecommendationVS](ValueSet-vs-sign-grade-of-recommendation.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-sign-grade-of-recommendation",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-sign-grade-of-recommendation",
  "version" : "0.2.0",
  "name" : "SIGNGradeOfRecommendation",
  "title" : "SIGN Grade of Recommendation",
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
  "description" : "CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Grades of Recommendation.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "A",
      "display" : "Grade A",
      "definition" : "At least one meta-analysis, systematic review, or RCT rated as 1++, and directly applicable to the target population; or a body of evidence consisting principally of studies rated as 1+, directly applicable to the target population, and demonstrating overall consistency of results.",
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
                "valueString" : "Mindestens eine Metaanalyse, systematische Review oder RCT mit 1++ bewertet und direkt auf die Zielpopulation anwendbar; oder ein Evidenzkörper bestehend hauptsächlich aus Studien mit 1+ bewertet, direkt auf die Zielpopulation anwendbar und mit konsistenten Ergebnissen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlungsgrad A"
        }
      ]
    },
    {
      "code" : "B",
      "display" : "Grade B",
      "definition" : "A body of evidence including studies rated as 2++, directly applicable to the target population, and demonstrating overall consistency of results; or extrapolated evidence from studies rated as 1++ or 1+.",
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
                "valueString" : "Evidenzkörper mit Studien bewertet als 2++, direkt auf die Zielpopulation anwendbar und mit konsistenten Ergebnissen; oder extrapolierte Evidenz aus Studien bewertet als 1++ oder 1+."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlungsgrad B"
        }
      ]
    },
    {
      "code" : "C",
      "display" : "Grade C",
      "definition" : "A body of evidence including studies rated as 2+, directly applicable to the target population and demonstrating overall consistency of results; or extrapolated evidence from studies rated as 2++.",
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
                "valueString" : "Evidenzkörper mit Studien bewertet als 2+, direkt auf die Zielpopulation anwendbar und mit konsistenten Ergebnissen; oder extrapolierte Evidenz aus Studien bewertet als 2++."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlungsgrad C"
        }
      ]
    },
    {
      "code" : "D",
      "display" : "Grade D",
      "definition" : "Evidence level 3 or 4; or extrapolated evidence from studies rated as 2+; or consensus-based recommendation.",
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
                "valueString" : "Evidenzlevel 3 oder 4; oder extrapolierte Evidenz aus Studien bewertet als 2+; oder konsensbasierte Empfehlung."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Empfehlungsgrad D"
        }
      ]
    }
  ]
}

```
