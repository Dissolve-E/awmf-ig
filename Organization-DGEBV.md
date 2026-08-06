# DGE-BV - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGE-BV**

## Example Organization: DGE-BV

Deutsche Gesellschaft für Endoskopie und Bildgebende Verfahren e.V. (DGE-BV)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGEBV",
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
  "name" : "Deutsche Gesellschaft für Endoskopie und Bildgebende Verfahren e.V. (DGE-BV)",
  "contact" : [{
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-endoskopie-und-bildgebende-verfahren-e-v-dge-bv"
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
