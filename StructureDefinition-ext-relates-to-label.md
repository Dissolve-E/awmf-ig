# RelatesTo Label - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **RelatesTo Label**

## Extension: RelatesTo Label 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RelatesToLabel |

This extension defines a label for the 'relatesTo' relationship using a CodeableConcept.

**Context of Use**

### Guidance

This extension defines a **human-readable label for the `relatesTo` relationship**.

#### Overview

When linking to related artifacts, this extension allows adding a descriptive label that can be displayed to users, making the relationship clearer and more informative.

#### Context

This extension can be applied to `Composition.relatesTo` elements.

#### Value Type

The value is a `string`:

```
* value[x] only string
* valueString 1..1

```

#### Example Usage

```
* relatesTo[similarTo]
  * type = #similar-to
  * extension[label].valueString = "English version of this guideline"
  * targetReference = Reference(EnglishGuideline)

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Extension: [Composition/NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-relates-to-label)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-relates-to-label.csv), [Excel](StructureDefinition-ext-relates-to-label.xlsx), [Schematron](StructureDefinition-ext-relates-to-label.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-relates-to-label",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label",
  "version" : "0.2.0",
  "name" : "RelatesToLabel",
  "title" : "RelatesTo Label",
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
  "description" : "This extension defines a label for the 'relatesTo' relationship using a CodeableConcept.",
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
      "expression" : "Composition.relatesTo"
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
        "short" : "RelatesTo Label",
        "definition" : "This extension defines a label for the 'relatesTo' relationship using a CodeableConcept."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "string"
          }
        ]
      }
    ]
  }
}

```
