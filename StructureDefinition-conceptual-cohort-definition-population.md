# Conceptual Cohort Definition Population - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Conceptual Cohort Definition Population**

## Resource Profile: Conceptual Cohort Definition Population 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-population | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ConceptualCohortDefinitionPopulation |

 
A structured definition of the population as defined for a PICO question. 

### Guidance

This profile represents a **Conceptual Cohort Definition for Population** – a structured definition of the population (the "P" in PICO) as defined for a clinical question.

#### Overview

The population definition describes who the recommendation applies to, including inclusion and exclusion criteria, demographic characteristics, and clinical conditions.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as a population definition:

```
* code = $cs-pico#population

```

#### Usage in PICO Questions

This profile is referenced from the [PICO Question](StructureDefinition-pico-question.md) profile:

```
// In PICOQuestion:
* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(MyPopulationDefinition)

```

#### Example Usage

```
Instance: AdultDiabetesPopulation
InstanceOf: conceptual-cohort-definition-population
Usage: #example
* code = $cs-pico#population
* characteristic[+]
  * code.text = "Adults with Type 2 Diabetes"
  * valueBoolean = true
* characteristic[+]
  * code.text = "Age"
  * valueRange.low.value = 18

```

This profile of a FHIR Group is derived from the [conceptual-cohort-definition](http://hl7.org/fhir/uv/ebm/StructureDefinition/conceptual-cohort-definition) FHIR resource.

**Usages:**

* Refer to this Profile: [PICO Question](StructureDefinition-pico-question.md)
* Examples for this Profile: [Group/PICOPopulationRec17](Group-PICOPopulationRec17.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/conceptual-cohort-definition-population)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-conceptual-cohort-definition-population.csv), [Excel](StructureDefinition-conceptual-cohort-definition-population.xlsx), [Schematron](StructureDefinition-conceptual-cohort-definition-population.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "conceptual-cohort-definition-population",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
      "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-population",
  "version" : "0.2.0",
  "name" : "ConceptualCohortDefinitionPopulation",
  "title" : "Conceptual Cohort Definition Population",
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
  "description" : "A structured definition of the population as defined for a PICO question.",
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
              "code" : "population"
            }
          ]
        }
      }
    ]
  }
}

```
