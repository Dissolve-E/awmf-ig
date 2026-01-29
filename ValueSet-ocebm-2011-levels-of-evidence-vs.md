# OCEBM 2011 Levels of Evidence Value Set - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **OCEBM 2011 Levels of Evidence Value Set**

## ValueSet: OCEBM 2011 Levels of Evidence Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/ocebm-2011-levels-of-evidence-vs | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:OCEBM2011LevelsOfEvidenceVS |

 
ValueSet encompassing all levels from the OCEBM 2011 Levels of Evidence. 

 **References** 

* [Recommendation Justification OXFORD 2011](StructureDefinition-recommendation-justification-oxford-2011.md)

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
  "id" : "ocebm-2011-levels-of-evidence-vs",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/ocebm-2011-levels-of-evidence-vs",
  "version" : "0.2.0",
  "name" : "OCEBM2011LevelsOfEvidenceVS",
  "title" : "OCEBM 2011 Levels of Evidence Value Set",
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
  "description" : "ValueSet encompassing all levels from the OCEBM 2011 Levels of Evidence.",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-ocebm-2011-levels-of-evidence"
      }
    ]
  }
}

```
