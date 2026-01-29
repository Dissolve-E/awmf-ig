# Planned Completion Date - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Planned Completion Date**

## Extension: Planned Completion Date 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:PlannedCompletionDate |

This extension allows for the indication of the date when the guideline is planned to be completed.

The PlannedCompletionDate extension allows to indicate the date when the guideline is planned to be completed.

**Context of Use**

### Guidance

This extension indicates the **date when the guideline is planned to be completed**.

#### Overview

During the registration phase, guideline developers specify an expected completion date. This helps with planning and tracking guideline development progress.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```
* value[x] only date

```

#### Usage Note

In the `GuidelineRegistryRecord` profile, this extension is **required when status = `#registered`**.

#### Example Usage

```
* extension[plannedCompletionDate].valueDate = "2026-06-30"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline](StructureDefinition-awmf-guideline.md) and [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Extension: [Composition/RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS.md), [Composition/RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL](Composition-RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS.md) and [Composition/RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-planned-completion-date)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-planned-completion-date.csv), [Excel](StructureDefinition-ext-planned-completion-date.xlsx), [Schematron](StructureDefinition-ext-planned-completion-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-planned-completion-date",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date",
  "version" : "0.2.0",
  "name" : "PlannedCompletionDate",
  "title" : "Planned Completion Date",
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
  "description" : "This extension allows for the indication of the date when the guideline is planned to be completed.",
  "purpose" : "The PlannedCompletionDate extension allows to indicate the date when the guideline is planned to be completed.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Composition"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Planned Completion Date",
        "definition" : "The date when the guideline is planned to be completed.",
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
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "date"
          }
        ]
      }
    ]
  }
}

```
