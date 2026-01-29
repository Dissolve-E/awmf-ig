# Citation List - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Citation List**

## Resource Profile: Citation List 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/citation-list | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:CitationList |

 
List of citations. 

### Guidance

This profile of a FHIR List is derived from the [List](http://hl7.org/fhir/StructureDefinition/List) FHIR resource.

**Usages:**

* Refer to this Profile: [Evidence Assessment](StructureDefinition-evidence-assessment.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/citation-list)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-citation-list.csv), [Excel](StructureDefinition-citation-list.xlsx), [Schematron](StructureDefinition-citation-list.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "citation-list",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/citation-list",
  "version" : "0.2.0",
  "name" : "CitationList",
  "title" : "Citation List",
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
  "description" : "List of citations.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "xds",
      "uri" : "https://profiles.ihe.net/ITI/TF/Volume3",
      "name" : "XDS metadata equivalent"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "List",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/List",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "List",
        "path" : "List"
      },
      {
        "id" : "List.entry.item",
        "path" : "List.entry.item",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Citation"]
          }
        ]
      }
    ]
  }
}

```
