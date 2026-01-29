# DGIM - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGIM**

## Example Organization: DGIM

Deutsche Gesellschaft für Innere Medizin e.V. (DGIM)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGIM",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.awmf.org/association",
      "value" : "100"
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
  "name" : "Deutsche Gesellschaft für Innere Medizin e.V. (DGIM)",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-innere-medizin-e-v-dgim"
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
