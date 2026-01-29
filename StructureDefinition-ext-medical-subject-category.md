# Medical Subject Category - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medical Subject Category**

## Extension: Medical Subject Category 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject-category | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:MedicalSubjectCategory |

An extension to specify medical subject category related to an organization.

**Context of Use**

### Guidance

This extension specifies **medical subject categories** (broad discipline areas) related to an organization.

#### Overview

Medical subject categories represent broad groupings of medical disciplines. This extension is used to classify medical societies and organizations by their primary areas of focus.

#### Context

This extension can be applied to `Organization` resources.

#### Value Type

The value is a `CodeableConcept` bound to the medical subject categories value set:

```
* value[x] only CodeableConcept
* valueCodeableConcept.coding from vs-medical-subject-categories (required)

```

#### Related Extension

* `medicalSubject` – More specific subject areas within a category

#### Example Usage

```
// Assign multiple categories:
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#psychosocial "Psychosocial Disciplines"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Medical Society](StructureDefinition-medical-society.md)
* Examples for this Extension: [Example AWMF Member Organization](Organization-AWMFMemberOrganizationExample.md) and [Example Medical Society](Organization-MedicalSocietyExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-medical-subject-category)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-medical-subject-category.csv), [Excel](StructureDefinition-ext-medical-subject-category.xlsx), [Schematron](StructureDefinition-ext-medical-subject-category.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-medical-subject-category",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject-category",
  "version" : "0.2.0",
  "name" : "MedicalSubjectCategory",
  "title" : "Medical Subject Category",
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
  "description" : "An extension to specify medical subject category related to an organization.",
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
        "short" : "Medical Subject Category",
        "definition" : "An extension to specify medical subject category related to an organization."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject-category"
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
      },
      {
        "id" : "Extension.value[x].coding",
        "path" : "Extension.value[x].coding",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-medical-subject-categories"
        }
      },
      {
        "id" : "Extension.value[x].coding.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding.code",
        "path" : "Extension.value[x].coding.code",
        "min" : 1,
        "mustSupport" : true
      }
    ]
  }
}

```
