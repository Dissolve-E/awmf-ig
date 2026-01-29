# RoB2 Overall Judgment ValueSet - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **RoB2 Overall Judgment ValueSet**

## ValueSet: RoB2 Overall Judgment ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/vs-rob-2-overall-judgment | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RoB2OverallJudmentVS |

 
ValueSet listing values to represent the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

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
  "id" : "vs-rob-2-overall-judgment",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rob-2-overall-judgment",
  "version" : "0.2.0",
  "name" : "RoB2OverallJudmentVS",
  "title" : "RoB2 Overall Judgment ValueSet",
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
  "description" : "ValueSet listing values to represent the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials.",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-rob-2-overall-judgment"
      }
    ]
  }
}

```
