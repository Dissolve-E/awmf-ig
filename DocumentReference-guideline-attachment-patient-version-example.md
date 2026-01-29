# Guideline Attachment Patient Version Example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Attachment Patient Version Example**

## Example DocumentReference: Guideline Attachment Patient Version Example

Guideline Attachment Patient Version Example



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "guideline-attachment-patient-version-example",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-attachment"
    ],
    "tag" : [
      {
        "display" : "Herz-Kreislauf-Erkrankungen"
      },
      {
        "display" : "Diabetes"
      }
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
        "title" : "Patient Version"
      }
    }
  ]
}

```
