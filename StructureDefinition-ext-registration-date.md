# Registration Date - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Registration Date**

## Extension: Registration Date 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RegistrationDate |

This extensions allows for the indication of the date the guideline project was registered.

The RegistrationDate extensions allows to indicate the date the guideline project was registered.

**Context of Use**

### Guidance

This extension indicates the **date when the guideline project was registered**.

#### Overview

The registration date marks when the guideline development project was formally registered with the AWMF or another guideline registry.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```
* value[x] only date

```

#### Example Usage

```
* extension[registrationDate].valueDate = "2023-01-15"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline](StructureDefinition-awmf-guideline.md) and [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-registration-date)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-registration-date.csv), [Excel](StructureDefinition-ext-registration-date.xlsx), [Schematron](StructureDefinition-ext-registration-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-registration-date",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date",
  "version" : "0.2.0",
  "name" : "RegistrationDate",
  "title" : "Registration Date",
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
  "description" : "This extensions allows for the indication of the date the guideline project was registered.",
  "purpose" : "The RegistrationDate extensions allows to indicate the date the guideline project was registered.",
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
        "short" : "Registration Date",
        "definition" : "The date the guideline project was registered.",
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
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date"
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
