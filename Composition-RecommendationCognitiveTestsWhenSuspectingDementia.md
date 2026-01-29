# Screening auf kognitive Beeinträchtigung - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Screening auf kognitive Beeinträchtigung**

## Example Composition: Screening auf kognitive Beeinträchtigung

HAP Diagnose



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RecommendationCognitiveTestsWhenSuspectingDementia",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"
    ]
  },
  "extension" : [
    {
      "extension" : [
        {
          "url" : "review-status",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-review-status",
                "code" : "reaffirmed"
              }
            ]
          }
        }
      ],
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-recommendation-review-status"
    }
  ],
  "identifier" : [
    {
      "use" : "official",
      "system" : "https://example.org/recommendations",
      "value" : "RecommendationCognitiveTestsWhenSuspectingDementia"
    }
  ],
  "version" : "2025",
  "status" : "final",
  "type" : {
    "coding" : [
      {
        "system" : "https://fevir.net/resources/CodeSystem/179423",
        "code" : "Recommendation",
        "display" : "Recommendation"
      }
    ]
  },
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-synthesis-type",
          "code" : "evidence-based",
          "display" : "Evidence-based"
        }
      ]
    }
  ],
  "date" : "2025",
  "author" : [
    {
      "reference" : "Organization/DGPPN"
    }
  ],
  "title" : "Screening auf kognitive Beeinträchtigung",
  "relatesTo" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
                "code" : "pico-question"
              }
            ]
          }
        }
      ],
      "type" : "derived-from",
      "targetReference" : {
        "reference" : "Group/PICOQuestionRec17"
      }
    },
    {
      "type" : "part-of",
      "targetReference" : {
        "reference" : "Composition/Demenzen"
      }
    }
  ],
  "section" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "recommendation-statement",
            "display" : "Recommendation Statement"
          }
        ]
      },
      "section" : [
        {
          "extension" : [
            {
              "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
              "valueCode" : "de"
            }
          ],
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "language",
                "display" : "Language"
              }
            ]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">Wir empfehlen, im nicht spezialisierten, z. B. hausärztlichen Setting einen kognitiven Kurztest /z. B. MMST, MOCA) bei selbst berichteten kognitiven Beschwerden - auch auf aktive Nachfrage - oder anderen Hinweisen für eine Demenz nach Einwilligung der betroffenen Person für die Objektivierung einer kognitiven Störung durchzuführen.</div>"
          }
        }
      ]
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "text",
            "display" : "Text"
          }
        ]
      },
      "section" : [
        {
          "extension" : [
            {
              "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
              "valueCode" : "de"
            }
          ],
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "language",
                "display" : "Language"
              }
            ]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">Die Erkennung einer Demenz oder einer kognitiven Störung im nicht spezialisierten Setting, z. B. in der Hausarztpraxis oder im Krankenhaus, soll Patient:innen grundsätzlich ermöglicht werden. Startpunkt kann eine von den Patient:innen oder anderen vorgebrachte Beschwerde über kognitive Störungen sein oder eine entsprechende Antwort bei aktivem Erfragen im ärztlichen Gespräch. Ergibt sich auf dieser Basis ein Verdacht auf eine kognitive Störung oder eine Demenz, stehen kognitive Kurztests zur Verfügung, um diesen Verdacht zu erhärten und möglicherweise weitere Diagnostik und/oder Therapie einzuleiten. Eine Metaanalyse über 149 Studien mit insgesamt über 49.000 Teilnehmenden zeigte über verschiedene Kurztests hinweg eine Sensitivität von 81 % und eine Spezifität von 89 % für die Erkennung einer kognitiven Störung oder Demenz. Im Vergleich mit dem Mini-Mental-Status- Test (MMST) zeigte sich keine Überlegenheit einzelner Verfahren. Es zeigten sich keine Unterschiede zwischen den verschiedenen Settings (Hausarztpraxis, Krankenhaus, Ambulanz, Bevölkerung) (103). Bei einer leichten Demenz an der Grenze zu einer leichten kognitiven Störung kann alternativ zu dem MMST beispielweise der MOCA eingesetzt werden, der für frühe Erkrankungsstadien eine höhere Sensitivität aufweist (s. 4.3.1.2). In einer neueren Arbeit wurde die Genauigkeit von MOCA und MMST für die Erkennung der Alzheimer- Krankheit anhand eines hierarchischen Bayes'schen latenten Klassenmodells evaluiert. Insgesamt wurden 67 Studien mit 5.554 Personen (MOCA) und 76.862 Personen (MMST) in diese Metaanalyse einbezogen. Die gepoolte Sensitivität betrug 0,934 (95 % KI 0,905-0,954) für MOCA und 0,883 (95 % KI 0,859–0,903) für den MMST, während die gepoolte Spezifität 0,899 (95 % KI 0,859–0,928) für MOCA und 0,903 (95 % KI 0,87–0,923) für MMST betrug. Der Einsatz des MOCA war sinnvoll, um eine mit der Alzheimer-Krankheit assoziierte Demenz auszuschließen, wobei die negative Likelihood Ratio (LR–) geringer war (0,074, 95 % KI 0,051– 0,108). MOCA zeigte eine bessere Leistung mit einer höheren diagnostischen Odds Ratio (DOR) (124,903, 95 % KI 67,459–231,260) (104). Für eine beispielhafte Liste mit orientierenden kognitiven Kurztests siehe Tabelle 20 im Anhang, welche auf einer Umfrage des Deutschen Netzwerks Gedächtnisambulanzen e. V. basiert (105), und Tabelle 23 im Anhang.</div>"
          }
        }
      ]
    }
  ]
}

```
