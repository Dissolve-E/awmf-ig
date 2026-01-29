# AWMF S1 Guideline Registry Record - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AWMF S1 Guideline Registry Record**

## Resource Profile: AWMF S1 Guideline Registry Record 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s1 | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:AWMFGuidelineRecordS1 |

 
AWMF S1 guideline representing expert recommendations developed through informal consensus. 

### Guidance

This profile represents an **AWMF S1 Guideline Registry Record** for expert recommendations developed through informal consensus. S1 guidelines represent "Action recommendations from expert groups" and are the simplest level in the AWMF classification system.

#### Overview

S1 guidelines are characterized by:

* Expert consensus without formal evidence-based methodology
* Informal agreement among specialists
* Recommendations based primarily on clinical experience

This profile inherits from `AWMFGuidelineRegistryRecord` and pre-sets the guideline classification to S1.

#### Key Element: Guideline Classification

The `category[awmfGuidelineClass]` is fixed to the S1 classification:

```
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S1 "Action recommendations from expert groups"

```

#### Example Usage

```
Instance: MyS1Guideline
InstanceOf: awmf-guideline-record-s1
Usage: #example
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "S1 Guideline for [Topic]"
* identifier[awmf-register-number]
  * use = #official
  * value = "XXX-XXX"
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant

```

For detailed information on all available elements, please refer to the parent profile [Guideline Registry Record](StructureDefinition-guideline-registry-record.md).

This profile of a FHIR Composition is derived from the [guideline-registry-record](http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record) FHIR resource.

**Usages:**

* Examples for this Profile: [Composition/AWMFGuidelineS1Example](Composition-AWMFGuidelineS1Example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/awmf-guideline-record-s1)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-awmf-guideline-record-s1.csv), [Excel](StructureDefinition-awmf-guideline-record-s1.xlsx), [Schematron](StructureDefinition-awmf-guideline-record-s1.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "awmf-guideline-record-s1",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s1",
  "version" : "0.2.0",
  "name" : "AWMFGuidelineRecordS1",
  "title" : "AWMF S1 Guideline Registry Record",
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
  "description" : "AWMF S1 guideline representing expert recommendations developed through informal consensus.",
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
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition",
        "path" : "Composition"
      },
      {
        "id" : "Composition.category:awmfGuidelineClass",
        "path" : "Composition.category",
        "sliceName" : "awmfGuidelineClass",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-class",
              "code" : "S1",
              "display" : "Action recommendations from expert groups"
            }
          ]
        }
      }
    ]
  }
}

```
