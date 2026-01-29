# Evidence Report with Contact Slices - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Report with Contact Slices**

## Resource Profile: Evidence Report with Contact Slices 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-report-with-contact-slices | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceReportWithContactSlices |

 
Intermediate profile that re-slices the extendedContactDetail extension from EvidenceReport. This workaround profile isolates the re-slicing to avoid 'Named items are out of order in the slice' errors in derived profiles. See profile comments for detailed explanation. 

### Guidance

This is an **intermediate technical profile** that handles re-slicing of the `extendedContactDetail` extension. It exists as a workaround for FHIR IG Publisher limitations.

#### Overview

This profile is not intended for direct use by implementers. It serves as an intermediate layer between the EBM Evidence Report and the `GuidelineRegistryRecord` profile.

#### Technical Background

The FHIR IG Publisher's snapshot generation algorithm enforces strict ordering rules for slices. When attempting to re-slice the parent's `extendedContactDetail` extension to create sub-slices (registrant, coordinator, mainContact), these new slices can cause ordering errors.

This intermediate profile isolates the re-slicing, allowing the main `GuidelineRegistryRecord` profile to inherit cleanly.

#### Contact Slices Defined

| | | |
| :--- | :--- | :--- |
| `registrant` | Registrant contact | Person who registered the guideline |
| `coordinator` | Coordinator | Coordination contact |
| `mainContact` | Main contact | Primary contact for inquiries |

#### For Implementers

You should use the [Guideline Registry Record](StructureDefinition-guideline-registry-record.md) profile directly, which inherits from this profile and provides all the necessary functionality.

This profile of a FHIR Composition is derived from the [evidence-report](http://hl7.org/fhir/uv/ebm/StructureDefinition/evidence-report) FHIR resource.

**Usages:**

* Derived from this Profile: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-report-with-contact-slices)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-report-with-contact-slices.csv), [Excel](StructureDefinition-evidence-report-with-contact-slices.xlsx), [Schematron](StructureDefinition-evidence-report-with-contact-slices.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-report-with-contact-slices",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-report-with-contact-slices",
  "version" : "0.2.0",
  "name" : "EvidenceReportWithContactSlices",
  "title" : "Evidence Report with Contact Slices",
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
  "description" : "Intermediate profile that re-slices the extendedContactDetail extension from EvidenceReport. This workaround profile isolates the re-slicing to avoid 'Named items are out of order in the slice' errors in derived profiles. See profile comments for detailed explanation.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "fhirdocumentreference",
      "uri" : "http://hl7.org/fhir/documentreference",
      "name" : "FHIR DocumentReference"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Composition",
  "baseDefinition" : "http://hl7.org/fhir/uv/ebm/StructureDefinition/evidence-report",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition",
        "path" : "Composition"
      },
      {
        "id" : "Composition.extension",
        "path" : "Composition.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            },
            {
              "type" : "value",
              "path" : "value.ofType(ExtendedContactDetail).purpose"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.extension:extendedContactDetail",
        "path" : "Composition.extension",
        "sliceName" : "extendedContactDetail"
      },
      {
        "id" : "Composition.extension:extendedContactDetail.value[x].purpose",
        "path" : "Composition.extension.value[x].purpose",
        "min" : 1
      },
      {
        "id" : "Composition.extension:extendedContactDetail/registrant",
        "path" : "Composition.extension",
        "sliceName" : "extendedContactDetail/registrant",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:extendedContactDetail/registrant.value[x].purpose",
        "path" : "Composition.extension.value[x].purpose",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point",
              "code" : "registrant"
            }
          ]
        }
      },
      {
        "id" : "Composition.extension:extendedContactDetail/registrant.value[x].name",
        "path" : "Composition.extension.value[x].name",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.extension:extendedContactDetail/registrant.value[x].telecom.value",
        "path" : "Composition.extension.value[x].telecom.value",
        "min" : 1
      },
      {
        "id" : "Composition.extension:extendedContactDetail/coordinator",
        "path" : "Composition.extension",
        "sliceName" : "extendedContactDetail/coordinator",
        "min" : 0,
        "max" : "*",
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:extendedContactDetail/coordinator.value[x].purpose",
        "path" : "Composition.extension.value[x].purpose",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point",
              "code" : "coordinator"
            }
          ]
        }
      },
      {
        "id" : "Composition.extension:extendedContactDetail/coordinator.value[x].name",
        "path" : "Composition.extension.value[x].name",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.extension:extendedContactDetail/coordinator.value[x].telecom.value",
        "path" : "Composition.extension.value[x].telecom.value",
        "min" : 1
      },
      {
        "id" : "Composition.extension:extendedContactDetail/mainContact",
        "path" : "Composition.extension",
        "sliceName" : "extendedContactDetail/mainContact",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:extendedContactDetail/mainContact.value[x].purpose",
        "path" : "Composition.extension.value[x].purpose",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point",
              "code" : "contact"
            }
          ]
        }
      },
      {
        "id" : "Composition.extension:extendedContactDetail/mainContact.value[x].name",
        "path" : "Composition.extension.value[x].name",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.extension:extendedContactDetail/mainContact.value[x].telecom.value",
        "path" : "Composition.extension.value[x].telecom.value",
        "min" : 1
      }
    ]
  }
}

```
