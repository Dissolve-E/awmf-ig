# Consultation Period - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Consultation Period**

## Extension: Consultation Period 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ConsultationPeriod |

This extension allows for the indication of the period during which the guideline is open for consultation.

The ConsultationPeriod extensions allows to indicate the period during which the guideline is open for consultation.

**Context of Use**

### Guidance

This extension indicates the **period during which the guideline is open for consultation**.

#### Overview

During guideline development, there is typically a consultation phase where external stakeholders can provide feedback. This extension captures the start and end dates of that period.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `Period` with start and end dates:

```
* value[x] only Period

```

#### Usage Note

In the `GuidelineRegistryRecord` profile, this extension is **required when status = `#preliminary`** (indicating consultation phase).

#### Example Usage

```
* extension[consultationPeriod].valuePeriod
  * start = "2025-01-15"
  * end = "2025-03-15"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline](StructureDefinition-awmf-guideline.md) and [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Extension: [Composition/RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS](Composition-RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-consultation-period)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-consultation-period.csv), [Excel](StructureDefinition-ext-consultation-period.xlsx), [Schematron](StructureDefinition-ext-consultation-period.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-consultation-period",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period",
  "version" : "0.2.0",
  "name" : "ConsultationPeriod",
  "title" : "Consultation Period",
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
  "description" : "This extension allows for the indication of the period during which the guideline is open for consultation.",
  "purpose" : "The ConsultationPeriod extensions allows to indicate the period during which the guideline is open for consultation.",
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
        "short" : "Consultation Period",
        "definition" : "The period during which the guideline is open for consultation.",
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
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "Period"
          }
        ]
      }
    ]
  }
}

```
