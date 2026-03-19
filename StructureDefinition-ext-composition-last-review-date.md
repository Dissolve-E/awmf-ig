# Composition Last Review Date - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Composition Last Review Date**

## Extension: Composition Last Review Date 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-last-review-date | *Version*:0.2.0 |
| Draft as of 2026-03-19 | *Computable Name*:CompositionLastReviewDate |

The date on which the composition content was last reviewed. Review happens periodically after that, but doesn't change the original approval date.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-composition-last-review-date)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-composition-last-review-date.csv), [Excel](StructureDefinition-ext-composition-last-review-date.xlsx), [Schematron](StructureDefinition-ext-composition-last-review-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-composition-last-review-date",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-last-review-date",
  "version" : "0.2.0",
  "name" : "CompositionLastReviewDate",
  "title" : "Composition Last Review Date",
  "status" : "draft",
  "date" : "2026-03-19T10:36:56+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [{
    "name" : "AWMF e.V.",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.awmf.org"
    }]
  }],
  "description" : "The date on which the composition content was last reviewed. Review happens periodically after that, but doesn't change the original approval date.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Composition"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Last review date for the composition",
      "definition" : "The date on which the composition content was last reviewed. Review happens periodically after that, but doesn't change the original approval date.",
      "comment" : "If specified, this is usually after the approval date.",
      "max" : "1"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-last-review-date"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "date"
      }]
    }]
  }
}

```
