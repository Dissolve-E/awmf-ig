# Composition Approval Date - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Composition Approval Date**

## Extension: Composition Approval Date 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-approval-date | *Version*:0.2.0 |
| Draft as of 2026-03-19 | *Computable Name*:CompositionApprovalDate |

The date on which the composition content was approved by the publisher. Approval happens once when the content is officially approved for usage.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-composition-approval-date)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-composition-approval-date.csv), [Excel](StructureDefinition-ext-composition-approval-date.xlsx), [Schematron](StructureDefinition-ext-composition-approval-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-composition-approval-date",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-bind"
  }],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-approval-date",
  "version" : "0.2.0",
  "name" : "CompositionApprovalDate",
  "title" : "Composition Approval Date",
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
  "description" : "The date on which the composition content was approved by the publisher. Approval happens once when the content is officially approved for usage.",
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
      "short" : "When composition approved by publisher",
      "definition" : "The date on which the asset content was approved by the publisher. Approval happens once when the content is officially approved for usage.",
      "comment" : "The date may be more recent than the approval date because of minor changes / editorial corrections.",
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
      "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-composition-approval-date"
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
