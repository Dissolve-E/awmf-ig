# SIGN Level of Evidence - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SIGN Level of Evidence**

## CodeSystem: SIGN Level of Evidence 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-sign-level-of-evidence | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:SIGNLevelOfEvidence |

 
CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Levels of Evidence. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [SIGNLevelOfEvidenceVS](ValueSet-vs-sign-level-of-evidence.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-sign-level-of-evidence",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-sign-level-of-evidence",
  "version" : "0.2.0",
  "name" : "SIGNLevelOfEvidence",
  "title" : "SIGN Level of Evidence",
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
  "description" : "CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Levels of Evidence.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 8,
  "concept" : [
    {
      "code" : "1plusplus",
      "display" : "1++",
      "definition" : "High-quality meta-analyses, systematic reviews of RCTs, or RCTs with a very low risk of bias.",
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
                "valueString" : "Hochwertige Metaanalysen, systematische Reviews von RCTs oder RCTs mit sehr niedrigem Bias-Risiko."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "1++"
        }
      ]
    },
    {
      "code" : "1plus",
      "display" : "1+",
      "definition" : "Well-conducted meta-analyses, systematic reviews, or RCTs with a low risk of bias.",
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
                "valueString" : "Gut durchgeführte Metaanalysen, systematische Reviews oder RCTs mit geringem Bias-Risiko."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "1+"
        }
      ]
    },
    {
      "code" : "1minus",
      "display" : "1-",
      "definition" : "Meta-analyses, systematic reviews, or RCTs with a high risk of bias.",
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
                "valueString" : "Metaanalysen, systematische Reviews oder RCTs mit hohem Bias-Risiko."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "1-"
        }
      ]
    },
    {
      "code" : "2plusplus",
      "display" : "2++",
      "definition" : "High-quality systematic reviews of case-control or cohort studies, or high-quality case-control or cohort studies with a very low risk of confounding or bias and a high probability that the relationship is causal.",
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
                "valueString" : "Hochwertige systematische Reviews von Fall-Kontroll- oder Kohortenstudien oder hochwertige Fall-Kontroll- oder Kohortenstudien mit sehr niedrigem Risiko für Confounding oder Bias."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "2++"
        }
      ]
    },
    {
      "code" : "2plus",
      "display" : "2+",
      "definition" : "Well-conducted case-control or cohort studies with a low risk of confounding or bias and a moderate probability that the relationship is causal.",
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
                "valueString" : "Gut durchgeführte Fall-Kontroll- oder Kohortenstudien (nicht-randomisierte Studien) mit niedrigem Risiko für Confounding oder Bias."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "2+"
        }
      ]
    },
    {
      "code" : "2minus",
      "display" : "2-",
      "definition" : "Case-control or cohort studies with a high risk of confounding or bias and a significant risk that the relationship is not causal.",
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
                "valueString" : "Fall-Kontroll- oder Kohortenstudien mit hohem Risiko für Confounding oder Bias."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "2-"
        }
      ]
    },
    {
      "code" : "3",
      "display" : "3",
      "definition" : "Non-analytic studies, e.g., case reports, case series.",
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
                "valueString" : "Nicht-analytische Studien, z. B. Fallberichte, Fallserien."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "3"
        }
      ]
    },
    {
      "code" : "4",
      "display" : "4",
      "definition" : "Expert opinion.",
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
                "valueString" : "Expertenmeinung."
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
    }
  ]
}

```
