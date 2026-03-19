# Composition Effective Period - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Composition Effective Period**

## Extension: Composition Effective Period 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-effective-period | *Version*:0.2.0 |
| Draft as of 2026-03-19 | *Computable Name*:CompositionEffectivePeriod |

The period during which the composition content was or is planned to be effective.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-composition-effective-period)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-composition-effective-period.csv), [Excel](StructureDefinition-ext-composition-effective-period.xlsx), [Schematron](StructureDefinition-ext-composition-effective-period.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-composition-effective-period",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-effective-period",
  "version" : "0.2.0",
  "name" : "CompositionEffectivePeriod",
  "title" : "Composition Effective Period",
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
  "description" : "The period during which the composition content was or is planned to be effective.",
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
      "short" : "The effective date range for the composition",
      "definition" : "The period during which the composition content was or is planned to be effective.",
      "comment" : "The effective period for a composition determines when the content is applicable for usage and is independent of publication and review dates. For example, a measure intended to be used for the year 2016 would be published in 2015.",
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
      "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-effective-period"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "Period"
      }]
    }]
  }
}

```
