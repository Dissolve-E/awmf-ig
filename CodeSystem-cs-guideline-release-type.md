# Guideline Release Type - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Release Type**

## CodeSystem: Guideline Release Type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-release-type | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:GuidelineReleaseType |

 
CodeSystem defining different guideline release types 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GuidelinesReleaseTypeVS](ValueSet-vs-guideline-release-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-guideline-release-type",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-release-type",
  "version" : "0.2.0",
  "name" : "GuidelineReleaseType",
  "title" : "Guideline Release Type",
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
  "description" : "CodeSystem defining different guideline release types",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 5,
  "concept" : [
    {
      "code" : "new-registration",
      "display" : "New Registration",
      "definition" : "New Registration",
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
                "valueString" : "Neuanmeldung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Neuanmeldung"
        }
      ]
    },
    {
      "code" : "update",
      "display" : "Update",
      "definition" : "Update",
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
                "valueString" : "Aktualisierung"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Aktualisierung"
        }
      ]
    },
    {
      "code" : "class-upgrade",
      "display" : "Class Upgrade",
      "definition" : "Upgrade to a higher guideline class",
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
                "valueString" : "Klassen-Upgrade"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Klassen-Upgrade"
        }
      ]
    },
    {
      "code" : "class-downgrade",
      "display" : "Class Downgrade",
      "definition" : "Downgrade to a lower guideline class",
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
                "valueString" : "Herabstufung in eine niedrigere Leitlinienklasse."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Klassen-Downgrade"
        }
      ]
    },
    {
      "code" : "living-guideline",
      "display" : "Living Guideline",
      "definition" : "A guideline designated as a continuously updated living guideline.",
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
                "valueString" : "Leitlinie mit dem Status einer Living Guideline (kontinuierlich aktualisiert)."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Living Guideline"
        }
      ]
    }
  ]
}

```
