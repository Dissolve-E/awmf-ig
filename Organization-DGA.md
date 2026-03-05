# DGA - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGA**

## Example Organization: DGA

Deutsche Gesellschaft für Andrologie e.V. (DGA)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGA",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"]
  },
  "identifier" : [{
    "system" : "http://fhir.awmf.org/association",
    "value" : "-1"
  }],
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
      "code" : "medical-society"
    }]
  }],
  "name" : "Deutsche Gesellschaft für Andrologie e.V. (DGA)",
  "contact" : [{
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-andrologie-e-v-dga"
    }]
  }],
  "qualification" : [{
    "code" : {
      "coding" : [{
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
        "code" : "awmf-member-organization"
      }]
    }
  }]
}

```
