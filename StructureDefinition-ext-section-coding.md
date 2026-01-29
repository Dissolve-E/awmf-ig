# Section Coding - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Section Coding**

## Extension: Section Coding 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:SectionCoding |

This extension allows for the assignment of a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts.

The SectionCoding extension is used to indicate a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts.

**Context of Use**

### Guidance

This extension allows **assigning a specific code to a section** within a Composition resource.

#### Overview

Section coding provides a standardized way to categorize or identify the content of sections, enabling better organization, searchability, and interoperability. It is particularly useful for sections that need coded values (e.g., care setting, care stage).

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a `CodeableConcept`:

```
* value[x] only CodeableConcept
* valueCodeableConcept 1..1

```

#### Use Cases

* **Care Setting**: Classify whether ambulatory, inpatient, or mixed
* **Care Stage**: Classify as prevention, diagnosis, therapy, etc.
* **Care Level**: Classify as primary care, specialist care, etc.

#### Example Usage

```
// In a care setting section:
* section[careSetting]
  * section[careSetting]
    * extension[value].valueCodeableConcept from vs-encounter-type (extensible)
  * section[careStage]
    * extension[value].valueCodeableConcept from vs-care-stage (extensible)
  * section[careLevel]
    * extension[value].valueCodeableConcept from vs-care-level (extensible)

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Extension: [Composition/NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-section-coding)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-section-coding.csv), [Excel](StructureDefinition-ext-section-coding.xlsx), [Schematron](StructureDefinition-ext-section-coding.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-section-coding",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding",
  "version" : "0.2.0",
  "name" : "SectionCoding",
  "title" : "Section Coding",
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
  "description" : "This extension allows for the assignment of a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts.",
  "purpose" : "The SectionCoding extension is used to indicate a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts.",
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
      "expression" : "Element"
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
        "short" : "Section Coding",
        "definition" : "Section Coding of a Composition providing a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```
