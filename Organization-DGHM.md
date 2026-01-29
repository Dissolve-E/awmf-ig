# DGHM - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGHM**

## Example Organization: DGHM

Deutsche Gesellschaft für Hygiene und Mikrobiologie e.V. (DGHM)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGHM",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "http://fhir.awmf.org/association",
      "value" : "067"
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
  "name" : "Deutsche Gesellschaft für Hygiene und Mikrobiologie e.V. (DGHM)",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-hygiene-und-mikrobiologie-e-v-dghm"
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
