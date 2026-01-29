# DGP - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGP**

## Example Organization: DGP

Deutsche Gesellschaft für Pneumologie und Beatmungsmedizin e.V. (DGP)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGP",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.awmf.org/association",
      "value" : "020"
    }
  ],
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
          "code" : "medical-society"
        }
      ]
    }
  ],
  "name" : "Deutsche Gesellschaft für Pneumologie und Beatmungsmedizin e.V. (DGP)",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-pneumologie-und-beatmungsmedizin-e-v-dgp"
        }
      ]
    }
  ],
  "qualification" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
            "code" : "awmf-member-organization"
          }
        ]
      }
    }
  ]
}

```
