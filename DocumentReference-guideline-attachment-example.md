# Guideline Attachment Example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Attachment Example**

## Example DocumentReference: Guideline Attachment Example

Guideline Attachment Example



## Resource Content

```json
{
  "resourceType" : "DocumentReference",
  "id" : "guideline-attachment-example",
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
          "code" : "slide-deck"
        }
      ]
    },
    {
      "coding" : [
        {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "visual-abstract",
          "display" : "Visual Abstract"
        }
      ]
    }
  ],
  "content" : [
    {
      "attachment" : {
        "contentType" : "application/pdf",
        "language" : "en",
        "title" : "Slide Deck"
      }
    }
  ]
}

```
