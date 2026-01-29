# AWMF Guideline Class - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AWMF Guideline Class**

## CodeSystem: AWMF Guideline Class 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-class | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:AWMFGuidelineClass |

 
As part of the project planning for the creation or updating of a guideline, a decision should be made at an early stage about the planned level classification ("S classification") according to the AWMF's system of rules (1-3). The S-classification scheme of the AWMF differentiates between the classes S1 treatment recommendation as well as S2e, S2k and S3 guideline. The "S" stands for the extent of the applied systematic approach in the development process of a guideline. Each class thus stands for a specific methodological concept that must be presented in a way that is comprehensible to the users. The choice of class is based on the question of how much effort is appropriate and feasible. The need for legitimacy for the implementation of the guideline (convincing the target group) must be taken into account. When choosing a higher S-classification in the context of updating a guideline, the adaptation to the corresponding methodology has to be considered. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AWMFGuidelineClassVS](ValueSet-vs-awmf-guideline-class.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-awmf-guideline-class",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-class",
  "version" : "0.2.0",
  "name" : "AWMFGuidelineClass",
  "title" : "AWMF Guideline Class",
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
  "description" : "As part of the project planning for the creation or updating of a guideline,\n    a decision should be made at an early stage about the planned level classification (\"S classification\") according to the AWMF's system of rules (1-3).\n    The S-classification scheme of the AWMF differentiates between the classes S1 treatment recommendation as well as S2e, S2k and S3 guideline.\n    The \"S\" stands for the extent of the applied systematic approach in the development process of a guideline.\n    Each class thus stands for a specific methodological concept that must be presented in a way that is comprehensible to the users.\n    The choice of class is based on the question of how much effort is appropriate and feasible.\n    The need for legitimacy for the implementation of the guideline (convincing the target group) must be taken into account.\n    When choosing a higher S-classification in the context of updating a guideline, the adaptation to the corresponding methodology has to be considered.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "S3",
      "display" : "Evidence- and consensus-based guideline",
      "definition" : "Representative panel, Systematic search, selection, evaluation of literature, Structured consensus building.",
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
                "valueString" : "Repräsentatives Gremium, Systematische Recherche, Auswahl, Bewertung der Literatur, Strukturierte Konsensfindung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Evidenz- und Konsensusbasierte Leitlinie"
        }
      ]
    },
    {
      "code" : "S2e",
      "display" : "Evidence-based Guideline",
      "definition" : "Systematic search, selection, evaluation of literature",
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
                "valueString" : "Systematische Recherche, Auswahl, Bewertung der Literatur"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Evidenzbasierte Leitlinie"
        }
      ]
    },
    {
      "code" : "S2k",
      "display" : "Consensus-based Guideline",
      "definition" : "Representative panel, structured consensus building",
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
                "valueString" : "Repräsentatives Gremium, Strukturierte Konsensfindung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Konsensusbasierte Leitlinie"
        }
      ]
    },
    {
      "code" : "S1",
      "display" : "Action recommendations from expert groups",
      "definition" : "Consensus building in an informal process",
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
                "valueString" : "Konsensfindung in einem informellen Verfahren"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Handlungsempfehlungen von Expertengruppen"
        }
      ]
    }
  ]
}

```
