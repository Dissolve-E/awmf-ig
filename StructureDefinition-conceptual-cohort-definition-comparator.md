# Conceptual Cohort Definition Comparator - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Conceptual Cohort Definition Comparator**

## Resource Profile: Conceptual Cohort Definition Comparator 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-comparator | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ConceptualCohortDefinitionComparator |

 
A structured definition of the comparator as defined for a PICO question. 

### Guidance

This profile represents a **Conceptual Cohort Definition for Comparator** – a structured definition of the comparator (the "C" in PICO) as defined for a clinical question.

#### Overview

The comparator definition describes the alternative treatment, placebo, or standard of care against which the intervention is being compared.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as a comparator definition:

```
* code = $cs-pico#comparator

```

#### Usage in PICO Questions

This profile is referenced from the [PICO Question](StructureDefinition-pico-question.md) profile:

```
// In PICOQuestion:
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(MyComparatorDefinition)

```

#### Example Usage

```
Instance: PlaceboComparator
InstanceOf: conceptual-cohort-definition-comparator
Usage: #example
* code = $cs-pico#comparator
* characteristic[+]
  * code.text = "Placebo"
  * valueBoolean = true

```

This profile of a FHIR Group is derived from the [conceptual-cohort-definition](http://hl7.org/fhir/uv/ebm/StructureDefinition/conceptual-cohort-definition) FHIR resource.

**Usages:**

* Refer to this Profile: [PICO Question](StructureDefinition-pico-question.md)
* Examples for this Profile: [Group/PICOComparatorRec17](Group-PICOComparatorRec17.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/conceptual-cohort-definition-comparator)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-conceptual-cohort-definition-comparator.csv), [Excel](StructureDefinition-conceptual-cohort-definition-comparator.xlsx), [Schematron](StructureDefinition-conceptual-cohort-definition-comparator.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "conceptual-cohort-definition-comparator",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
      "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-comparator",
  "version" : "0.2.0",
  "name" : "ConceptualCohortDefinitionComparator",
  "title" : "Conceptual Cohort Definition Comparator",
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
  "description" : "A structured definition of the comparator as defined for a PICO question.",
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
              "code" : "comparator"
            }
          ]
        }
      }
    ]
  }
}

```
