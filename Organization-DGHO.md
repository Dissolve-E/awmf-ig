# DGHO - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGHO**

## Example Organization: DGHO

Deutsche Gesellschaft für Hämatologie und Medizinische Onkologie e.V. (DGHO)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGHO",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"]
  },
  "identifier" : [{
    "system" : "http://fhir.awmf.org/association",
    "value" : "068"
  }],
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
      "code" : "medical-society"
    }]
  }],
  "name" : "Deutsche Gesellschaft für Hämatologie und Medizinische Onkologie e.V. (DGHO)",
  "contact" : [{
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-haematologie-und-medizinische-onkologie-e-v-dgho"
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
