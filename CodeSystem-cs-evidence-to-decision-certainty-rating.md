# Evidence To Decision Certainty Rating - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence To Decision Certainty Rating**

## CodeSystem: Evidence To Decision Certainty Rating 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-rating | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:EvidenceToDecisionCertaintyRating |

 
CodeSystem defining GRADE Evidence to Decision (EtD) Framework Certainty Ratings 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RatingAcceptability](ValueSet-vs-rating-acceptability.md)
* [RatingBenefitAndHarms](ValueSet-vs-rating-benefits-and-harms.md)
* [RatingEquity](ValueSet-vs-rating-equity.md)
* [RatingFeasibility](ValueSet-vs-rating-feasibility.md)
* [RatingPreferenceAndValues](ValueSet-vs-rating-preference-and-values.md)
* [RatingResources](ValueSet-vs-rating-resources.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-evidence-to-decision-certainty-rating",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-rating",
  "version" : "0.2.0",
  "name" : "EvidenceToDecisionCertaintyRating",
  "title" : "Evidence To Decision Certainty Rating",
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
  "description" : "CodeSystem defining GRADE Evidence to Decision (EtD) Framework Certainty Ratings",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 13,
  "concept" : [
    {
      "code" : "small-net-benefit",
      "display" : "Small net benefit",
      "definition" : "Small net benefit, or little difference between alternatives",
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
                "valueString" : "Geringer Netto-Nutzen, oder geringer Unterschied zwischen den Alternativen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Geringer Netto-Nutzen"
        }
      ]
    },
    {
      "code" : "substantial-net-benefit",
      "display" : "Substantial net benefit",
      "definition" : "Substantial net benefits of the recommended alternative",
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
                "valueString" : "Erheblicher Netto-Nutzen der empfohlenen Alternative."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Erheblicher Netto-Nutzen"
        }
      ]
    },
    {
      "code" : "important-harms",
      "display" : "Important harms",
      "definition" : "Important harms",
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
                "valueString" : "Wesentliche Schäden"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Wesentliche Schäden"
        }
      ]
    },
    {
      "code" : "substantial-variability",
      "display" : "Substantial variability",
      "definition" : "Substantial variability is expected or uncertain",
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
                "valueString" : "Erhebliche Variabilität ist zu erwarten oder ungewiss."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Erhebliche Variabilität"
        }
      ]
    },
    {
      "code" : "no-substantial-variability",
      "display" : "No substantial variability",
      "definition" : "No substantial variability expected",
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
                "valueString" : "Keine erhebliche Variabilität erwartet."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Keine erhebliche Variabilität"
        }
      ]
    },
    {
      "code" : "few-want-intervention",
      "display" : "Few want intervention",
      "definition" : "We expect few to want the intervention",
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
                "valueString" : "Wir erwarten, dass nur wenige die Intervention wünschen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Wenige wünschen Intervention"
        }
      ]
    },
    {
      "code" : "factor-not-considered",
      "display" : "Factor not considered",
      "definition" : "Factor not considered",
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
                "valueString" : "Unberücksichtigter Faktor"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Unberücksichtigter Faktor"
        }
      ]
    },
    {
      "code" : "important-issues-or-not-investigated",
      "display" : "Important issues",
      "definition" : "Important issues, or potential issues not investigated",
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
                "valueString" : "Wesentliche Probleme oder potenzielle Probleme, die nicht untersucht worden sind."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Wesentliche Probleme"
        }
      ]
    },
    {
      "code" : "no-important-issues",
      "display" : "No important issues",
      "definition" : "No important issues with the recommended alternative",
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
                "valueString" : "Keine wesentlichen Probleme mit der empfohlenen Alternative"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Keine wesentlichen Probleme"
        }
      ]
    },
    {
      "code" : "important-negative-issues",
      "display" : "Important negative issues",
      "definition" : "Important negative issues",
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
                "valueString" : "Wesentliche negative Aspekte"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Wesentliche negative Aspekte"
        }
      ]
    },
    {
      "code" : "intervention-increases-inequity",
      "display" : "Intervention increases inequity",
      "definition" : "Intervention likely increases inequity",
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
                "valueString" : "Die Intervention erhöht wahrscheinlich die Ungerechtigkeit."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Intervention erhöht Ungerechtigkeit"
        }
      ]
    },
    {
      "code" : "intervention-poorly-accepted",
      "display" : "Intervention poorly accepted",
      "definition" : "Intervention is likely poorly accepted",
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
                "valueString" : "Die Intervention wird voraussichtlich schlecht angenommen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Intervention schlecht angenommen"
        }
      ]
    },
    {
      "code" : "intervention-difficult-to-implement",
      "display" : "Intervention difficult to implement",
      "definition" : "Intervention is likely difficult to implement",
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
                "valueString" : "Die Intervention ist voraussichtlich schwer umzusetzen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Internvention schwer umzusetzen"
        }
      ]
    }
  ]
}

```
