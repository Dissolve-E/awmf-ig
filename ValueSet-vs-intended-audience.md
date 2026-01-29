# Intended Audience Value Set - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Intended Audience Value Set**

## ValueSet: Intended Audience Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ValueSet/vs-intended-audience | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:IntendedAudienceVS |

 
ValueSet listing codes representing intended audiences for a section 

 **References** 

* [Section Intended Audience](StructureDefinition-ext-section-intended-audience.md)

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
  "id" : "vs-intended-audience",
  "url" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-intended-audience",
  "version" : "0.2.0",
  "name" : "IntendedAudienceVS",
  "title" : "Intended Audience Value Set",
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
  "description" : "ValueSet listing codes representing intended audiences for a section",
  "compose" : {
    "include" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-intended-audience"
      }
    ]
  }
}

```
