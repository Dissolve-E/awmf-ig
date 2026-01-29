# Guideline Sections - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Sections**

## ValueSet: Guideline Sections 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-sections | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:GuidelineSectionsVS |

 
ValueSet listing values to use to define guideline sections 

 **References** 

* [Guideline](StructureDefinition-awmf-guideline.md)
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
  "id" : "vs-guideline-sections",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-sections",
  "version" : "0.2.0",
  "name" : "GuidelineSectionsVS",
  "title" : "Guideline Sections",
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
  "description" : "ValueSet listing values to use to define guideline sections",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections"
      },
      {
        "system" : "https://fevir.net/resources/CodeSystem/179423"
      }
    ]
  }
}

```
