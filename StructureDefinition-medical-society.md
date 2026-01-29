# Medical Society - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medical Society**

## Resource Profile: Medical Society 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/medical-society | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:MedicalSociety |

 
A profile for medical societies. 

### Guidance

This profile represents a **Medical Society** – an organization involved in the development or endorsement of clinical practice guidelines.

#### Overview

Medical societies are professional organizations that bring together healthcare professionals in specific medical disciplines. This profile extends the base `Organization` resource to capture additional information relevant for guideline authorship.

#### Key Elements

##### Organization Type

The `type` element is fixed to identify the organization as a medical society:

```
* type = cs-awmf#medical-society

```

##### Medical Subject Category

Use the `medicalSubjectCategory` extension to specify the discipline(s) the society represents:

```
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#psychosocial "Psychosocial Disciplines"

```

##### Medical Subject

Use the `medicalSubject` extension for more specific subject areas:

```
* extension[medicalSubject][+].valueCodeableConcept.text = "Anesthesiology and Intensive Care Medicine"

```

##### Organization Branding

The `brand` extension allows for logo and visual identity information:

```
* extension[brand].extension[brandLogo].valueUrl = "https://www.example.org/logo.png"

```

##### Organization Period

Document the active period of the organization:

```
* extension[organizationPeriod].valuePeriod.start = "2000-01-01"
* extension[organizationPeriod].valuePeriod.end = "2050-12-31"

```

#### Example Usage

```
Instance: MySociety
InstanceOf: medical-society
Usage: #example
* name = "German Society for Example Medicine"
* contact.telecom
  * system = #url
  * value = "https://www.example-society.org"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubject][+].valueCodeableConcept.text = "Example Surgery"

```

This profile of a FHIR Organization is derived from the [Organization](http://hl7.org/fhir/StructureDefinition/Organization) FHIR resource.

**Usages:**

* Derived from this Profile: [AWMF Member Organization](StructureDefinition-awmf-member-organization.md)
* Examples for this Profile: [Example Medical Society](Organization-MedicalSocietyExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/medical-society)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-medical-society.csv), [Excel](StructureDefinition-medical-society.xlsx), [Schematron](StructureDefinition-medical-society.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "medical-society",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/medical-society",
  "version" : "0.2.0",
  "name" : "MedicalSociety",
  "title" : "Medical Society",
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
  "description" : "A profile for medical societies.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 V2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "servd",
      "uri" : "http://www.omg.org/spec/ServD/1.0/",
      "name" : "ServD"
    },
    {
      "identity" : "interface",
      "uri" : "http://hl7.org/fhir/interface",
      "name" : "Interface Pattern"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Organization",
        "path" : "Organization"
      },
      {
        "id" : "Organization.extension",
        "path" : "Organization.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Organization.extension:medicalSubjectCategory",
        "path" : "Organization.extension",
        "sliceName" : "medicalSubjectCategory",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject-category"
            ]
          }
        ]
      },
      {
        "id" : "Organization.extension:medicalSubject",
        "path" : "Organization.extension",
        "sliceName" : "medicalSubject",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject"
            ]
          }
        ]
      },
      {
        "id" : "Organization.extension:brand",
        "path" : "Organization.extension",
        "sliceName" : "brand",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/organization-brand"]
          }
        ]
      },
      {
        "id" : "Organization.extension:organizationPeriod",
        "path" : "Organization.extension",
        "sliceName" : "organizationPeriod",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.org/fhir/StructureDefinition/organization-period"
            ]
          }
        ]
      },
      {
        "id" : "Organization.type",
        "path" : "Organization.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "medical-society"
            }
          ]
        }
      }
    ]
  }
}

```
