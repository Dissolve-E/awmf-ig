# HAP Diagnose - Empfehlung A - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **HAP Diagnose - Empfehlung A**

## Example Composition: HAP Diagnose - Empfehlung A

HAP Diagnose - Empfehlung A



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RecommendationHAPDiagnosis-A",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/examples",
      "value" : "RecommendationHAPDiagnosis-A"
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
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">Therapierelevant ist bereits die Verdachtsdiagnose einer HAP, diese soll gestellt werden bei neuem, persistierendem oder progredientem Infiltrat in der Thorax-Röntgenaufnahme in Kombination mit 2 von 3 weiteren Kriterien: - Leukozyten &gt; 10 000 oder &lt; 4000 /μl, - Fieber &gt; 38,3 °C, - purulentes Sekret.</div>"
          }
        }
      ]
    }
  ]
}

```
