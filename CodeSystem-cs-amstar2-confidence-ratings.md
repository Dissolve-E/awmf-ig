# AMSTAR 2 Overall Confidence Ratings - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AMSTAR 2 Overall Confidence Ratings**

## CodeSystem: AMSTAR 2 Overall Confidence Ratings 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-amstar2-confidence-ratings | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:AMSTAR2ConfidenceRatings |

 
CodeSystem representing the overall confidence ratings from the AMSTAR 2 critical appraisal tool. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AMSTAR2ConfidenceRatingsVS](ValueSet-vs-amstar2-confidence-ratings.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-amstar2-confidence-ratings",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-amstar2-confidence-ratings",
  "version" : "0.2.0",
  "name" : "AMSTAR2ConfidenceRatings",
  "title" : "AMSTAR 2 Overall Confidence Ratings",
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
  "description" : "CodeSystem representing the overall confidence ratings from the AMSTAR 2 critical appraisal tool.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "high",
      "display" : "High",
      "definition" : "Zero or one non-critical weakness: The systematic review provides an accurate and comprehensive summary of the results of the available studies that address the question of interest.",
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
                "valueString" : "Keine oder eine nicht kritische Schwäche: Der systematische Review bietet eine verlässliche und\n    umfassende Zusammenfassung der Ergebnisse der verfügbaren Studien zu der interessierenden\n    Frage."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Hoch"
        }
      ]
    },
    {
      "code" : "moderate",
      "display" : "Moderate",
      "definition" : "More than one non-critical weakness: The systematic review has more than one weakness but no critical flaws. It may provide an accurate summary of the results of the available studies that were included in the review.",
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
                "valueString" : "Mehr als eine nicht kritische Schwäche*: Der systematische Review hat mehr als eine Schwäche,\n    aber keine kritischen Schwächen. Möglicherweise bietet es eine akkurate Zusammenfassung der\n    Ergebnisse der verfügbaren, in den Review eingeschlossenen Studien. *Mehrere nicht kritische Schwächen können das Vertrauen in den Review mindern, und es kann angemessen\n    sein, das Gesamturteil von moderat auf niedrig herabzustufen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Moderat"
        }
      ]
    },
    {
      "code" : "low",
      "display" : "Low",
      "definition" : "One critical flaw with or without non-critical weaknesses: The review has a critical flaw and may not provide an accurate and comprehensive summary of the available studies that address the question of interest.",
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
                "valueString" : "Eine kritische Schwäche mit oder ohne nicht kritische Schwächen: Der Review hat eine kritische\n    Schwäche und bietet möglicherweise keine akkurate und umfassende Zusammenfassung der\n    verfügbaren Studien zu der interessierenden Frage."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Niedrig"
        }
      ]
    },
    {
      "code" : "critically_low",
      "display" : "Critically Low",
      "definition" : "More than one critical flaw with or without non-critical weaknesses: The review has more than one critical flaw and should not be relied on to provide an accurate and comprehensive summary of the available studies.",
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
                "valueString" : "Mehr als eine kritische Schwäche mit oder ohne nicht kritische Schwächen: Der Review hat mehr als\n    eine kritische Schwäche. Es sollte nicht darauf vertraut werden, dass er eine akkurate und\n    umfassende Zusammenfassung der verfügbaren Studien bietet."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Kritisch niedrig"
        }
      ]
    }
  ]
}

```
