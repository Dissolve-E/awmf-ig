# AMSTAR 2 Confidence Ratings Value Set - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AMSTAR 2 Confidence Ratings Value Set**

## ValueSet: AMSTAR 2 Confidence Ratings Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/vs-amstar2-confidence-ratings | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:AMSTAR2ConfidenceRatingsVS |

 
ValueSet encompassing all overall confidence ratings from the AMSTAR 2 critical appraisal tool. 

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
  "id" : "vs-amstar2-confidence-ratings",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-amstar2-confidence-ratings",
  "version" : "0.2.0",
  "name" : "AMSTAR2ConfidenceRatingsVS",
  "title" : "AMSTAR 2 Confidence Ratings Value Set",
  "status" : "active",
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
  "description" : "ValueSet encompassing all overall confidence ratings from the AMSTAR 2 critical appraisal tool.",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-amstar2-confidence-ratings"
      }
    ]
  }
}

```
