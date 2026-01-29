# DGI - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGI**

## Example Organization: DGI

Deutsche Gesellschaft für Infektiologie e.V. (DGI)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGI",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.awmf.org/association",
      "value" : "092"
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
  "name" : "Deutsche Gesellschaft für Infektiologie e.V. (DGI)",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-infektiologie-e-v-dgi"
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
