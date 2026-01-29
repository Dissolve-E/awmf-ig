# Medical Subject - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medical Subject**

## Extension: Medical Subject 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:MedicalSubject |

An extension to specify medical subjects related to an organization.

**Context of Use**

### Guidance

This extension specifies **medical subjects** (specific topic areas) related to an organization.

#### Overview

Medical subjects represent specific fields or topics within broader categories. For example, while a medical subject category might be "Surgical Disciplines", specific medical subjects could be "Cardiac Surgery" or "Orthopedic Surgery".

#### Context

This extension can be applied to `Organization` resources.

#### Value Type

The value is a `CodeableConcept` that can contain coded values or free text:

```
* value[x] only CodeableConcept
* valueCodeableConcept 1..1

```

#### Related Extension

* `medicalSubjectCategory` – Broader discipline categories

#### Example Usage

```
// Using free text (when no standard code exists):
* extension[medicalSubject][+].valueCodeableConcept.text = "Anesthesiology and Intensive Care Medicine"

// Using coded value:
* extension[medicalSubject][+].valueCodeableConcept.coding
  * system = "http://example.org/medical-subjects"
  * code = #anesthesiology
  * display = "Anesthesiology"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Medical Society](StructureDefinition-medical-society.md)
* Examples for this Extension: [Example AWMF Member Organization](Organization-AWMFMemberOrganizationExample.md) and [Example Medical Society](Organization-MedicalSocietyExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-medical-subject)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-medical-subject.csv), [Excel](StructureDefinition-ext-medical-subject.xlsx), [Schematron](StructureDefinition-ext-medical-subject.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-medical-subject",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject",
  "version" : "0.2.0",
  "name" : "MedicalSubject",
  "title" : "Medical Subject",
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
  "description" : "An extension to specify medical subjects related to an organization.",
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
      "expression" : "Organization"
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
        "short" : "Medical Subject",
        "definition" : "An extension to specify medical subjects related to an organization."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject"
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
