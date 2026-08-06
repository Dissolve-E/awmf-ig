# S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten**

## Example Composition: S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten

S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "DiffuseLargeBCellLymphomaGuideline",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline"]
  },
  "identifier" : [{
    "use" : "official",
    "system" : "http://fhir.awmf.org/guidelines",
    "value" : "018-038"
  }],
  "version" : "1.0",
  "status" : "final",
  "type" : {
    "coding" : [{
      "system" : "https://fevir.net/resources/CodeSystem/179423",
      "code" : "Guideline",
      "display" : "Guideline"
    }]
  },
  "date" : "2022-10-01",
  "author" : [{
    "reference" : "Organization/DGHO"
  }],
  "title" : "Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten",
  "section" : [{
    "code" : {
      "coding" : [{
        "system" : "https://fevir.net/resources/CodeSystem/179423",
        "code" : "text",
        "display" : "Text"
      }]
    },
    "section" : [{
      "extension" : [{
        "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
        "valueCode" : "de"
      }],
      "title" : "5. Diagnostik II – Staging und andere prätherapeutische Maßnahmen",
      "code" : {
        "coding" : [{
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }]
      },
      "text" : {
        "status" : "generated",
        "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">5. Diagnostik II – Staging und andere prätherapeutische Maßnahmen</div>"
      }
    },
    {
      "code" : {
        "coding" : [{
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }]
      },
      "section" : [{
        "extension" : [{
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
          "valueCode" : "de"
        }],
        "title" : "5.2. Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung",
        "code" : {
          "coding" : [{
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
            "code" : "language",
            "display" : "Language"
          }]
        },
        "text" : {
          "status" : "generated",
          "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">Knochenmarkbiopsie</div>"
        }
      },
      {
        "code" : {
          "coding" : [{
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "text",
            "display" : "Text"
          }]
        },
        "section" : [{
          "extension" : [{
            "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
            "valueCode" : "de"
          }],
          "title" : "5.2.2. Knochenmarkbiopsie",
          "code" : {
            "coding" : [{
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }]
          },
          "text" : {
            "status" : "generated",
            "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">[[]]</div>"
          },
          "emptyReason" : {
            "coding" : [{
              "system" : "http://terminology.hl7.org/CodeSystem/list-empty-reason",
              "code" : "unavailable"
            }]
          }
        },
        {
          "code" : {
            "coding" : [{
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }]
          },
          "section" : [{
            "extension" : [{
              "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
              "valueCode" : "de"
            }],
            "title" : "5.2.2.1. Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie",
            "code" : {
              "coding" : [{
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "language",
                "display" : "Language"
              }]
            },
            "text" : {
              "status" : "generated",
              "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">[[]]</div>"
            },
            "emptyReason" : {
              "coding" : [{
                "system" : "http://terminology.hl7.org/CodeSystem/list-empty-reason",
                "code" : "unavailable"
              }]
            }
          },
          {
            "code" : {
              "coding" : [{
                "system" : "https://fevir.net/resources/CodeSystem/179423",
                "code" : "text",
                "display" : "Text"
              }]
            },
            "entry" : [{
              "reference" : "Composition/RecommendationAgainstBoneMarrowBiopsy"
            }]
          }]
        }]
      }]
    }]
  }]
}

```
