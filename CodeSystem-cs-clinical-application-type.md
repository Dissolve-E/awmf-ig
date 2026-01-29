# Clinical Application Type - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Clinical Application Type**

## CodeSystem: Clinical Application Type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-clinical-application-type | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:ClinicalApplicationTypeCS |

 
CodeSystem defining different clinical application types 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ClinicalApplicationTypeVS](ValueSet-vs-clinical-application-type.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-clinical-application-type",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-clinical-application-type",
  "version" : "0.2.0",
  "name" : "ClinicalApplicationTypeCS",
  "title" : "Clinical Application Type",
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
  "description" : "CodeSystem defining different clinical application types",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 6,
  "concept" : [
    {
      "code" : "diagnostic",
      "display" : "Diagnostic",
      "definition" : "Diagnostic",
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
                "valueString" : "Diagnostisch"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Diagnostisch"
        }
      ]
    },
    {
      "code" : "therapeutic",
      "display" : "Therapeutic",
      "definition" : "Therapeutic",
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
                "valueString" : "Therapeutisch"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Therapeutisch"
        }
      ]
    },
    {
      "code" : "prognostic",
      "display" : "Prognostic",
      "definition" : "Prognostic",
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
                "valueString" : "Prognostisch"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Prognostisch"
        }
      ]
    },
    {
      "code" : "monitoring",
      "display" : "Monitoring",
      "definition" : "Monitoring",
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
                "valueString" : "Monitoring"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Monitoring"
        }
      ]
    },
    {
      "code" : "screening",
      "display" : "Screening",
      "definition" : "Screening",
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
                "valueString" : "Screening"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Screening"
        }
      ]
    },
    {
      "code" : "preventive",
      "display" : "Preventive",
      "definition" : "Preventive",
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
                "valueString" : "Präventiv"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Präventiv"
        }
      ]
    }
  ]
}

```
