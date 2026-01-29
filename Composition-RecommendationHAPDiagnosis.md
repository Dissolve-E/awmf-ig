# HAP Diagnose - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **HAP Diagnose**

## Example Composition: HAP Diagnose

HAP Diagnose



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RecommendationHAPDiagnosis",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/examples",
      "value" : "RecommendationHAPDiagnosis"
    }
  ],
  "version" : "3.0",
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
          "code" : "expert-consensus"
        }
      ]
    }
  ],
  "date" : "2024-12-05",
  "author" : [
    {
      "reference" : "PractitionerRole/JessicaRademacherDGPFor020-013"
    }
  ],
  "title" : "HAP Diagnose",
  "relatesTo" : [
    {
      "type" : "part-of",
      "targetCanonical" : "http://fhir.awmf.org/awmf.ig/Composition/NosokomialePneumonie|3.0"
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
      "entry" : [
        {
          "reference" : "Composition/RecommendationHAPDiagnosis-A"
        },
        {
          "reference" : "Composition/RecommendationHAPDiagnosis-B"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">Die klinische Diagnose einer HAP ist schwierig. Es gibt keine allgemein akzeptierten Kriterien auf der Basis randomisierter Studien, sondern lediglich prospektive Kohortenanalysen. Die Inzidenz der VAP variiert stark in Abhängigkeit von den eingesetzten Diagnosekriterien (62). Therapierelevant ist die klinisch zu stellende Verdachtsdiagnose einer HAP. Die in der 1. Empfehlung genannten Kriterien von Johanson et al. (Infiltrat in Kombination mit 2-3 weiteren Kriterien) werden in den meisten Leitlinien verwendet und sind in einer prospektiven Kohortenanalyse an 25 verstorbenen beatmeten Patienten validiert worden (36,63). In dieser lag die histologisch überprüfte Sensitivität bei 69 % und die Spezifität bei 75 % (64). Fagon et al. konnte 1993 in einer Studie an 84 beatmeten Patienten zeigen, dass die klinische Diagnose in 62 % eine VAP korrekt vorhersagt, und bei 84 % korrekt keine VAP diagnostiziert wurde (65). In allen Studien liegen Sensitivität und Spezifität dieser Kriterien bei ca. 70 %, sodass etwa 30 % der HAP-Patienten nicht erkannt werden und bei ca. 30% eine andere Diagnose als eine HAP vorliegt. Kritisch zu bedenken ist zudem, dass die Beurteilung des Röntgenbildes einer Interobservervariabilität unterliegt (66) und im klinischen Alltag etwa 1/3 der Patienten, die als V. a. HAP diagnostiziert werden, die oben beschriebenen radiologischen Veränderungen (Infiltrate) objektiv nicht erfüllen (67,68). Der Einsatz mikrobiologischer Kriterien zur Diagnose einer HAP verbessert die Sensitivität und Spezifität (64). Andere Autoren konnten zeigen, dass postoperative Patienten mit der klinischen Diagnose HAP (beruhend auf diesen Kriterien) eine höhere Letalität hatten als Patienten ohne Verdacht auf HAP (8 von 46, 17 % vs. 16 von 306, 5 %, p = 0,046) (69). Insbesondere bei schwerer HAP sollten die klinischen Kriterien der Sepsis beachtet werden (70). Zeichen der Sepsis oder des septischen Schocks sind jedoch nicht spezifisch für eine HAP. Insgesamt ist die klinische Diagnose der HAP eine Arbeitsdiagnose, die für die zeitnahe Einleitung einer kalkulierten antimikrobiellen Therapie relevant ist und der regelmäßigen Überprüfung bedarf. In diesem Zusammenhang sind die aufgeführten Differenzialdiagnosen zu bedenken</div>"
          }
        }
      ]
    }
  ]
}

```
