# HAP Diagnose - Empfehlung B - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **HAP Diagnose - Empfehlung B**

## Example Composition: HAP Diagnose - Empfehlung B

HAP Diagnose - Empfehlung B



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RecommendationHAPDiagnosis-B",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/examples",
      "value" : "RecommendationHAPDiagnosis-Bs"
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
    },
    {
      "type" : "part-of",
      "targetCanonical" : "http://fhir.awmf.org/awmf.ig/Composition/RecommendationHAPDiagnosis|3.0"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">Differenzialdiagnostisch sollten u.a. Atelektasen (Sekretverlegung), Herzinsuffizienz/Überwässerung, Lungenarterienembolien, alveoläre Hämorrhagie, interstitielle Lungenerkrankungen wie eine organisierende Pneumonie (OP) und das ARDS abgegrenzt werden.</div>"
          }
        }
      ]
    }
  ]
}

```
