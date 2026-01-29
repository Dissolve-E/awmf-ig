# Guideline Author Role - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Author Role**

## CodeSystem: Guideline Author Role 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:GuidelineAuthorRoleCS |

 
CodeSystem defining roles for the author of the guideline. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GuidelineAuthorRoleVS](ValueSet-vs-guideline-author-role.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-guideline-author-role",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
  "version" : "0.2.0",
  "name" : "GuidelineAuthorRoleCS",
  "title" : "Guideline Author Role",
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
  "description" : "CodeSystem defining roles for the author of the guideline.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 9,
  "concept" : [
    {
      "code" : "leading",
      "display" : "Leading",
      "definition" : "Main party responsible for the development of the guideline.",
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
                "valueString" : "Federführende Organisation oder Person für die Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Federführend"
        }
      ]
    },
    {
      "code" : "contributing",
      "display" : "Contributing",
      "definition" : "Party involved in the development of the guideline.",
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
                "valueString" : "Organisation oder Person, die an der Leitlinie mitgewirkt hat."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Beteiligt"
        }
      ]
    },
    {
      "code" : "registrant",
      "display" : "Registrant",
      "definition" : "Person responsible for registering the guideline in the registry.",
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
                "valueString" : "Die Person, die das Leitlinienprojekt im Register angemeldet hat."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Anmelder*in"
        }
      ]
    },
    {
      "code" : "technical-editor",
      "display" : "Technical Editor",
      "definition" : "Responsible for preparing the technical or machine-readable format of the guideline.",
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
                "valueString" : "Verantwortlich für die technische oder maschinenlesbare Formatierung der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Technische Redaktion"
        }
      ]
    },
    {
      "code" : "content-author",
      "display" : "Content Author",
      "definition" : "Authored or co-authored the content of the guideline.",
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
                "valueString" : "Autor*in der Inhalte der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Inhaltliche*r Autor*in"
        }
      ]
    },
    {
      "code" : "coding-author",
      "display" : "Coding Author",
      "definition" : "Responsible for semantic encoding of guideline content using terminologies or ontologies.",
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
                "valueString" : "Verantwortlich für die semantische Kodierung der Leitlinie mittels Terminologien oder Ontologien."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Kodierer*in"
        }
      ]
    },
    {
      "code" : "moderator",
      "display" : "Moderator",
      "definition" : "Person moderating consensus-building sessions in guideline development.",
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
                "valueString" : "Moderiert den Konsensprozess während der Leitlinienentwicklung."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Moderator*in"
        }
      ]
    },
    {
      "code" : "method-advisor",
      "display" : "Methodological Advisor",
      "definition" : "Supports the development team with methodological expertise.",
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
                "valueString" : "Bietet methodische Beratung zur Leitlinienentwicklung."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Methodische*r Berater*in"
        }
      ]
    },
    {
      "code" : "evidence-analyst",
      "display" : "Evidence Analyst",
      "definition" : "Conducts or oversees evidence synthesis and appraisal.",
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
                "valueString" : "Verantwortlich für die Recherche, Bewertung und Aufbereitung der Evidenz."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Evidenzaufbereitung"
        }
      ]
    }
  ]
}

```
