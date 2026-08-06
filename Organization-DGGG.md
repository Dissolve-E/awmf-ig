# DGGG - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **DGGG**

## Example Organization: DGGG

Deutsche Gesellschaft für Gynäkologie und Geburtshilfe e.V. (DGGG)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "DGGG",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"]
  },
  "identifier" : [{
    "system" : "http://fhir.awmf.org/association",
    "value" : "015"
  }],
  "type" : [{
    "coding" : [{
      "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
      "code" : "medical-society"
    }]
  }],
  "name" : "Deutsche Gesellschaft für Gynäkologie und Geburtshilfe e.V. (DGGG)",
  "contact" : [{
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.awmf.org/fachgesellschaften/deutsche-gesellschaft-fuer-gynaekologie-und-geburtshilfe-e-v-dggg"
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
