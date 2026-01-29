# AWMF Guideline Status - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AWMF Guideline Status**

## CodeSystem: AWMF Guideline Status 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-status | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:AWMFGuidelineStatus |

 
CodeSystem representing the guideline status according to the AWMF. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [AWMFGuidelineStatusVS](ValueSet-vs-awmf-guideline-status.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-awmf-guideline-status",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-status",
  "version" : "0.2.0",
  "name" : "AWMFGuidelineStatus",
  "title" : "AWMF Guideline Status",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-01-29T18:27:10+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [
    {
      "name" : "AWMF e.V.",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org"
        }
      ]
    }
  ],
  "description" : "CodeSystem representing the guideline status according to the AWMF.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 7,
  "concept" : [
    {
      "code" : "registered",
      "display" : "Registered",
      "designation" : [
        {
          "language" : "de",
          "value" : "Angemeldet"
        }
      ]
    },
    {
      "code" : "preliminary",
      "display" : "Preliminary",
      "designation" : [
        {
          "language" : "de",
          "value" : "Konsultationsfassung"
        }
      ]
    },
    {
      "code" : "final",
      "display" : "Final",
      "designation" : [
        {
          "language" : "de",
          "value" : "Veröffentlicht"
        }
      ]
    },
    {
      "code" : "amended",
      "display" : "Amended",
      "designation" : [
        {
          "language" : "de",
          "value" : "Amendment publiziert"
        }
      ]
    },
    {
      "code" : "corrected",
      "display" : "Corrected",
      "designation" : [
        {
          "language" : "de",
          "value" : "Korrigiert"
        }
      ]
    },
    {
      "code" : "cancelled",
      "display" : "Cancelled",
      "designation" : [
        {
          "language" : "de",
          "value" : "Zurückgezogen"
        }
      ]
    },
    {
      "code" : "deprecated",
      "display" : "Deprecated",
      "designation" : [
        {
          "language" : "de",
          "value" : "Abgelaufen"
        }
      ]
    }
  ]
}

```
