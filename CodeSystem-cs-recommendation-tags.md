# Recommendation Tags - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Tags**

## CodeSystem: Recommendation Tags 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-tags | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RecommendationTagsCS |

 
CodeSystem defining codes to represent tags for recommendations 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RecommendationTagsVS](ValueSet-vs-recommendation-tags.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-recommendation-tags",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-recommendation-tags",
  "version" : "0.2.0",
  "name" : "RecommendationTagsCS",
  "title" : "Recommendation Tags",
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
  "description" : "CodeSystem defining codes to represent tags for recommendations",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "quality-indicators-derivable",
      "display" : "Derivable as Quality Indicator",
      "definition" : "This recommendation can be operationalized into a measurable quality indicator",
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
                "valueString" : "Diese Empfehlung kann in einem messbaren Qualitätsindikator operationalisiert werden."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Als Qualitätsindikator ableitbar"
        }
      ]
    },
    {
      "code" : "highly-care-relevant",
      "display" : "Highly Relevant for Care Delivery",
      "definition" : "This recommendation is considered particularly relevant for clinical care",
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
                "valueString" : "Diese Empfehlung wird als besonders relevant für die klinische Versorgung angesehen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Hochrelevant für die Gesundheitsversorgung"
        }
      ]
    },
    {
      "code" : "student-relevant",
      "display" : "Relevant for Medical Education",
      "definition" : "This recommendation is considered relevant for students in medical or healthcare education",
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
                "valueString" : "Diese Empfehlung wird als relevant für Studierende der Medizin oder weiterer Fächer im Gesundheitswesen angesehen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Relevant für die medizinische Ausbildung"
        }
      ]
    },
    {
      "code" : "choosing-wisely",
      "display" : "Choosing Wisely Recommendation",
      "definition" : "This recommendation is part of a 'Choosing Wisely' campaign or follows similar principles",
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
                "valueString" : "Diese Empfehlung ist Teil der Gemeinsam Klug Entscheiden-Initiative oder folgt ähnlichen Prinzipien."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Gemeinsam Klug Entscheiden-Empfehlungen"
        }
      ]
    },
    {
      "code" : "off-label",
      "display" : "Off-Label Use",
      "definition" : "This recommendation involves off-label use of a medication or device",
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
                "valueString" : "Diese Empfehlung beinhaltet die Off-Label-Anwendung eines Arzneitmittels oder Geräts."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Off-Label-Anwendung"
        }
      ]
    }
  ]
}

```
