# Conceptual Cohort Definition Outcome - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Conceptual Cohort Definition Outcome**

## Resource Profile: Conceptual Cohort Definition Outcome 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-outcome | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ConceptualCohortDefinitionOutcome |

 
A structured definition of the outcome as defined for a PICO question. 

### Guidance

This profile represents a **Conceptual Cohort Definition for Outcome** – a structured definition of the outcome (the "O" in PICO) as defined for a clinical question.

#### Overview

The outcome definition describes what clinical endpoints or results are being measured, such as mortality, morbidity, quality of life, adverse events, or other patient-relevant outcomes.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as an outcome definition:

```
* code = $cs-pico#outcome

```

#### Usage in PICO Questions

Multiple outcomes can be defined for a single PICO question. This profile is referenced from the [PICO Question](StructureDefinition-pico-question.md) profile:

```
// In PICOQuestion:
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(MortalityOutcome)
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(QualityOfLifeOutcome)

```

#### Relationship to Evidence Assessment

Outcome definitions are also referenced by [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md) profiles when assessing the evidence for specific outcomes.

#### Example Usage

```
Instance: AllCauseMortalityOutcome
InstanceOf: conceptual-cohort-definition-outcome
Usage: #example
* code = $cs-pico#outcome
* characteristic[+]
  * code.text = "All-cause mortality"
  * valueBoolean = true

```

This profile of a FHIR Group is derived from the [conceptual-cohort-definition](http://hl7.org/fhir/uv/ebm/StructureDefinition/conceptual-cohort-definition) FHIR resource.

**Usages:**

* Refer to this Profile: [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md), [PICO Question](StructureDefinition-pico-question.md) and [Recommendation Justification](StructureDefinition-recommendation-justification.md)
* Examples for this Profile: [Group/PICOOutcomeSensitivityRec17](Group-PICOOutcomeSensitivityRec17.md) and [Group/PICOOutcomeSpecificityRec17](Group-PICOOutcomeSpecificityRec17.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/conceptual-cohort-definition-outcome)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-conceptual-cohort-definition-outcome.csv), [Excel](StructureDefinition-conceptual-cohort-definition-outcome.xlsx), [Schematron](StructureDefinition-conceptual-cohort-definition-outcome.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "conceptual-cohort-definition-outcome",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
      "valueUri" : "http://hl7.org/fhir/StructureDefinition/CanonicalResource"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-outcome",
  "version" : "0.2.0",
  "name" : "ConceptualCohortDefinitionOutcome",
  "title" : "Conceptual Cohort Definition Outcome",
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
  "description" : "A structured definition of the outcome as defined for a PICO question.",
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
              "code" : "outcome"
            }
          ]
        }
      }
    ]
  }
}

```
