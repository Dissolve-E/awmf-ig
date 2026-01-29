# Patienteninformation - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patienteninformation**

## Example DocumentReference: Patienteninformation

Patienteninformation Leitlinie 020-013



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "Guideline-020-013-PatientVersion",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-attachment"
    ]
  },
  "status" : "current",
  "type" : {
    "coding" : [
      {
        "system" : "https://fevir.net/resources/CodeSystem/179423",
        "code" : "attachments",
        "display" : "Attachments"
      }
    ]
  },
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "patient-version"
        }
      ]
    }
  ],
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/pdf",
        "language" : "de",
        "url" : "020_D_Ges_fuer_Pneumologie/020-013pi_S3_Epidemiologie-Diagnostik-Therapie-erwachsener-Patienten-nosokomiale-Pneumonie__2024-03.pdf",
        "title" : "Patienteninformation"
      }
    }
  ]
}

```
