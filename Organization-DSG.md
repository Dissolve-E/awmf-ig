# DSG - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DSG**

## Example Organization: DSG

Deutsche Sepsis-Gesellschaft e.V. (DSG)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DSG",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.awmf.org/association",
      "value" : "079"
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
  "name" : "Deutsche Sepsis-Gesellschaft e.V. (DSG)",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org/fachgesellschaften/deutsche-sepsis-gesellschaft-e-v-dsg"
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
