# Target Patient Group - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Target Patient Group**

## CodeSystem: Target Patient Group 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-target-patient-group | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:TargetPatientGroup |

 
CodeSystem defining the intended patient population for whom the guideline is applicable. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [TargetPatientGroupVS](ValueSet-vs-target-patient-group.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-target-patient-group",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-target-patient-group",
  "version" : "0.2.0",
  "name" : "TargetPatientGroup",
  "title" : "Target Patient Group",
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
  "description" : "CodeSystem defining the intended patient population for whom the guideline is applicable.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "adults",
      "display" : "Adults",
      "definition" : "Guideline specifically targeted at adult patients.",
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
                "valueString" : "Leitlinie richtet sich an Erwachsene."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Erwachsene"
        }
      ]
    },
    {
      "code" : "children-adolescents",
      "display" : "Children/Adolescents",
      "definition" : "Guideline specifically targeted at children and adolescents.",
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
                "valueString" : "Leitlinie richtet sich an Kinder und Jugendliche."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Kinder und Jugendliche"
        }
      ]
    }
  ]
}

```
