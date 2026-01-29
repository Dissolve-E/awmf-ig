# Conceptual Cohort Definition Intervention - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Conceptual Cohort Definition Intervention**

## Resource Profile: Conceptual Cohort Definition Intervention 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-intervention | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ConceptualCohortDefinitionIntervention |

 
A structured definition of the intervention as defined for a PICO question. 

### Guidance

This profile represents a **Conceptual Cohort Definition for Intervention** – a structured definition of the intervention (the "I" in PICO) as defined for a clinical question.

#### Overview

The intervention definition describes what treatment, procedure, or exposure is being evaluated in the clinical question.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as an intervention definition:

```
* code = $cs-pico#intervention

```

#### Usage in PICO Questions

This profile is referenced from the [PICO Question](StructureDefinition-pico-question.md) profile:

```
// In PICOQuestion:
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(MyInterventionDefinition)

```

#### Example Usage

```
Instance: MetforminIntervention
InstanceOf: conceptual-cohort-definition-intervention
Usage: #example
* code = $cs-pico#intervention
* characteristic[+]
  * code.text = "Metformin therapy"
  * valueBoolean = true

```

This profile of a FHIR Group is derived from the [conceptual-cohort-definition](http://hl7.org/fhir/uv/ebm/StructureDefinition/conceptual-cohort-definition) FHIR resource.

**Usages:**

* Refer to this Profile: [PICO Question](StructureDefinition-pico-question.md)
* Examples for this Profile: [Group/PICOInterventionRec17](Group-PICOInterventionRec17.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/conceptual-cohort-definition-intervention)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-conceptual-cohort-definition-intervention.csv), [Excel](StructureDefinition-conceptual-cohort-definition-intervention.xlsx), [Schematron](StructureDefinition-conceptual-cohort-definition-intervention.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "conceptual-cohort-definition-intervention",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
      "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-intervention",
  "version" : "0.2.0",
  "name" : "ConceptualCohortDefinitionIntervention",
  "title" : "Conceptual Cohort Definition Intervention",
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
  "description" : "A structured definition of the intervention as defined for a PICO question.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
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
      "identity" : "interface",
      "uri" : "http://hl7.org/fhir/interface",
      "name" : "Interface Pattern"
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Group",
  "baseDefinition" : "http://hl7.org/fhir/uv/ebm/StructureDefinition/conceptual-cohort-definition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Group",
        "path" : "Group"
      },
      {
        "id" : "Group.code",
        "path" : "Group.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "intervention"
            }
          ]
        }
      }
    ]
  }
}

```
