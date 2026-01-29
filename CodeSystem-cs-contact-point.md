# Contact Point - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Contact Point**

## CodeSystem: Contact Point 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:ContactPoint |

 
CodeSystem defining types of contact points for a guideline 

 This Code system is referenced in the content logical definition of the following value sets: 

* [GuidelineContactPointVS](ValueSet-vs-guideline-contact-point.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-contact-point",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point",
  "version" : "0.2.0",
  "name" : "ContactPoint",
  "title" : "Contact Point",
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
  "description" : "CodeSystem defining types of contact points for a guideline",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "registrant",
      "display" : "Registrant",
      "definition" : "The contact is the registrant of the guideline.",
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
                "valueString" : "Der Kontakt ist die anmeldende Person oder Organisation der Leitlinie."
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
      "code" : "contact",
      "display" : "Contact",
      "definition" : "The main contact for the guideline.",
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
                "valueString" : "Der Kontakt ist der/die Hauptansprechpartner*in für die Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Kontakt"
        }
      ]
    },
    {
      "code" : "coordinator",
      "display" : "Coordinator",
      "definition" : "The contact is the coordinator of the guideline.",
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
                "valueString" : "Der Kontakt ist der/die Koordinator*in der Leitlinie."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Koordination"
        }
      ]
    }
  ]
}

```
