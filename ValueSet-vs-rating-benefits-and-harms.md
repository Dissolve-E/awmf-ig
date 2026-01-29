# Rating Benefits And Harms - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rating Benefits And Harms**

## ValueSet: Rating Benefits And Harms 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-benefits-and-harms | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RatingBenefitAndHarms |

 
ValueSet listing values to represent the summary of the most important benefits and harms 

 **References** 

* [Recommendation Justification GRADE](StructureDefinition-recommendation-justification-grade.md)

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
  "id" : "vs-rating-benefits-and-harms",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-benefits-and-harms",
  "version" : "0.2.0",
  "name" : "RatingBenefitAndHarms",
  "title" : "Rating Benefits And Harms",
  "status" : "draft",
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
  "description" : "ValueSet listing values to represent the summary of the most important benefits and harms",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-evidence-to-decision-certainty-rating",
        "concept" : [
          {
            "code" : "small-net-benefit",
            "display" : "Small net benefit"
          },
          {
            "code" : "substantial-net-benefit",
            "display" : "Substantial net benefit"
          },
          {
            "code" : "important-harms",
            "display" : "Important harms"
          }
        ]
      }
    ]
  }
}

```
