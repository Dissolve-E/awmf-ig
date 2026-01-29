# Content Types - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Content Types**

## ValueSet: Content Types 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/vs-content-types | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ContentTypesVS |

 
ValueSet listing types of content that can be part of a guideline or recommendation. 

 **References** 

* [Guideline Attachment](StructureDefinition-guideline-attachment.md)
* [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* [Recommendation](StructureDefinition-recommendation.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R5/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "vs-content-types",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-content-types",
  "version" : "0.2.0",
  "name" : "ContentTypesVS",
  "title" : "Content Types",
  "status" : "draft",
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
  "description" : "ValueSet listing types of content that can be part of a guideline or recommendation.",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
        "concept" : [
          {
            "code" : "long-version",
            "display" : "Long Version"
          },
          {
            "code" : "short-version",
            "display" : "Short Version"
          },
          {
            "code" : "guideline-report",
            "display" : "Guideline Report"
          },
          {
            "code" : "evidence-report",
            "display" : "Evidence Report"
          },
          {
            "code" : "implementation-guidance",
            "display" : "Implementation Guidance"
          },
          {
            "code" : "decision-support",
            "display" : "Decision Support"
          },
          {
            "code" : "patient-version",
            "display" : "Patient Version"
          },
          {
            "code" : "choosing-wisely",
            "display" : "Choosing Wisely"
          },
          {
            "code" : "quality-indicators",
            "display" : "Quality Indicators"
          },
          {
            "code" : "declaration-of-interests",
            "display" : "Declaration of Interests"
          },
          {
            "code" : "short-patient-version",
            "display" : "Short Version for Patients"
          },
          {
            "code" : "update-info",
            "display" : "Short Information About an Update"
          },
          {
            "code" : "slide-deck",
            "display" : "Slide Deck"
          },
          {
            "code" : "visual-abstract",
            "display" : "Visual Abstract"
          },
          {
            "code" : "document",
            "display" : "Document"
          },
          {
            "code" : "image",
            "display" : "Image"
          },
          {
            "code" : "video",
            "display" : "Video"
          },
          {
            "code" : "podcast",
            "display" : "Podcast"
          },
          {
            "code" : "other",
            "display" : "Other"
          }
        ]
      }
    ]
  }
}

```
