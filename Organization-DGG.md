# DGG - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGG**

## Example Organization: DGG

Deutsche Gesellschaft für Geriatrie e.V. (DGG)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGG",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"]
  },
  "identifier" : [{
    "system" : "http://fhir.awmf.org/association",
    "value" : "070"
  }],
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
      "code" : "medical-society"
    }]
  }],
  "name" : "Deutsche Gesellschaft für Geriatrie e.V. (DGG)",
  "contact" : [{
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-geriatrie-e-v-dgg"
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
