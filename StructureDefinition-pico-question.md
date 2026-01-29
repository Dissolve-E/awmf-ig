# PICO Question - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PICO Question**

## Resource Profile: PICO Question 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/pico-question | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:PICOQuestion |

 
A structured definition of the PICO question in the context of guidelines and recommendations. 

### Guidance

This profile represents a **PICO Question** – a structured definition of the clinical question in the context of guidelines and recommendations using the Population, Intervention, Comparator, and Outcome (PICO) framework.

#### Overview

PICO questions are fundamental to evidence-based medicine and guideline development. They structure clinical questions in a way that facilitates systematic literature searches and evidence evaluation.

#### Key Elements

##### Question Code

The `code` element identifies this as a PICO question:

```
* code = $cs-pico#pico-question

```

##### Combination Method

All characteristics must be present together (logical AND):

```
* combinationMethod = $cs-group-characteristic-combination#all-of

```

##### PICO Characteristics

The profile provides slices for each PICO component:

**Population (P)** – Who is affected?

```
* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(PopulationDefinition)

```

**Intervention (I)** – What is being evaluated?

```
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(InterventionDefinition)

```

**Comparator (C)** – What is the alternative?

```
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(ComparatorDefinition)

```

**Outcome (O)** – What are the relevant outcomes? (can have multiple)

```
* characteristic[outcome]
  * code = $cs-pico#outcome
  * valueReference = Reference(OutcomeDefinition)

```

##### Value Types

Each characteristic supports multiple value types:

* `CodeableConcept` – Coded values
* `Reference` – References to detailed definitions
* `Expression` – Formal expressions

#### Linking to Recommendations

PICO questions can be linked to recommendations using the `relatesTo[picoQuestion]` slice in the Recommendation profile:

```
// In the Recommendation instance:
* relatesTo[picoQuestion]
  * type = #derived-from
  * targetReference = Reference(MyPICOQuestion)

```

#### Example Usage

```
Instance: PICOQuestionExample
InstanceOf: pico-question
Usage: #example
* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(AdultPatientPopulation)
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(DrugAIntervention)
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(PlaceboComparator)
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(MortalityOutcome)
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(QualityOfLifeOutcome)

```

This profile of a FHIR Group is derived from the [conceptual-cohort-definition](http://hl7.org/fhir/uv/ebm/StructureDefinition/conceptual-cohort-definition) FHIR resource.

**Usages:**

* Refer to this Profile: [Recommendation](StructureDefinition-recommendation.md)
* Examples for this Profile: [Group/PICOQuestionRec17](Group-PICOQuestionRec17.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/pico-question)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-pico-question.csv), [Excel](StructureDefinition-pico-question.xlsx), [Schematron](StructureDefinition-pico-question.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "pico-question",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
      "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/pico-question",
  "version" : "0.2.0",
  "name" : "PICOQuestion",
  "title" : "PICO Question",
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
  "description" : "A structured definition of the PICO question in the context of guidelines and recommendations.",
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
              "code" : "pico-question"
            }
          ]
        }
      },
      {
        "id" : "Group.combinationMethod",
        "path" : "Group.combinationMethod",
        "patternCode" : "all-of"
      },
      {
        "id" : "Group.characteristic",
        "path" : "Group.characteristic",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Group.characteristic:population",
        "path" : "Group.characteristic",
        "sliceName" : "population",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Group.characteristic:population.code",
        "path" : "Group.characteristic.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "population"
            }
          ]
        }
      },
      {
        "id" : "Group.characteristic:population.value[x]",
        "path" : "Group.characteristic.value[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "type" : [
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Reference"
          },
          {
            "code" : "Expression"
          }
        ]
      },
      {
        "id" : "Group.characteristic:population.value[x]:valueReference",
        "path" : "Group.characteristic.value[x]",
        "sliceName" : "valueReference",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-population"
            ]
          }
        ]
      },
      {
        "id" : "Group.characteristic:intervention",
        "path" : "Group.characteristic",
        "sliceName" : "intervention",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Group.characteristic:intervention.code",
        "path" : "Group.characteristic.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "intervention"
            }
          ]
        }
      },
      {
        "id" : "Group.characteristic:intervention.value[x]",
        "path" : "Group.characteristic.value[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "type" : [
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Reference"
          },
          {
            "code" : "Expression"
          }
        ]
      },
      {
        "id" : "Group.characteristic:intervention.value[x]:valueReference",
        "path" : "Group.characteristic.value[x]",
        "sliceName" : "valueReference",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-intervention"
            ]
          }
        ]
      },
      {
        "id" : "Group.characteristic:comparator",
        "path" : "Group.characteristic",
        "sliceName" : "comparator",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Group.characteristic:comparator.code",
        "path" : "Group.characteristic.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "comparator"
            }
          ]
        }
      },
      {
        "id" : "Group.characteristic:comparator.value[x]",
        "path" : "Group.characteristic.value[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "type" : [
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Reference"
          },
          {
            "code" : "Expression"
          }
        ]
      },
      {
        "id" : "Group.characteristic:comparator.value[x]:valueReference",
        "path" : "Group.characteristic.value[x]",
        "sliceName" : "valueReference",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-comparator"
            ]
          }
        ]
      },
      {
        "id" : "Group.characteristic:outcome",
        "path" : "Group.characteristic",
        "sliceName" : "outcome",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Group.characteristic:outcome.code",
        "path" : "Group.characteristic.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "outcome"
            }
          ]
        }
      },
      {
        "id" : "Group.characteristic:outcome.value[x]",
        "path" : "Group.characteristic.value[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "type" : [
          {
            "code" : "CodeableConcept"
          },
          {
            "code" : "Reference"
          },
          {
            "code" : "Expression"
          }
        ]
      },
      {
        "id" : "Group.characteristic:outcome.value[x]:valueReference",
        "path" : "Group.characteristic.value[x]",
        "sliceName" : "valueReference",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-outcome"
            ]
          }
        ]
      }
    ]
  }
}

```
