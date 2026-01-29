# Outcome Evidence - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Outcome Evidence**

## Resource Profile: Outcome Evidence 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/outcome-evidence | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:OutcomeEvidence |

 
Represents evidence supporting a specific outcome within a body of clinical or scientific evidence. 

### Guidance

This profile represents **Outcome Evidence** – evidence supporting a specific outcome within a body of clinical or scientific evidence.

#### Overview

Outcome evidence resources capture the quantitative or qualitative findings for specific clinical outcomes (e.g., mortality, quality of life, adverse events) from studies or systematic reviews.

#### Key Elements

##### Variable Definition (Required)

The `variableDefinition` element must include at least one outcome definition:

```
* variableDefinition[outcome]
  * variableRole = #outcome
  * observed = Reference(OutcomeDefinition)

```

#### Relationship to Other Profiles

Outcome Evidence resources are:

* Assessed by [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md) profiles
* Referenced from [Recommendation Justification](StructureDefinition-recommendation-justification.md) to link evidence to recommendations
* Derived from PICO questions via the [Conceptual Cohort Definition Outcome](StructureDefinition-conceptual-cohort-definition-outcome.md) profile.

#### Example Usage

```
Instance: MortalityEvidenceExample
InstanceOf: outcome-evidence
Usage: #example
* variableDefinition[outcome]
  * variableRole = #outcome
  * observed = Reference(MortalityOutcomeDefinition)
* statistic[+]
  * statisticType = #relative-risk
  * quantity.value = 0.85

```

This profile of a FHIR Evidence is derived from the [Evidence](http://hl7.org/fhir/StructureDefinition/Evidence) FHIR resource.

**Usages:**

* Refer to this Profile: [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md) and [Recommendation Justification](StructureDefinition-recommendation-justification.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/outcome-evidence)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-outcome-evidence.csv), [Excel](StructureDefinition-outcome-evidence.xlsx), [Schematron](StructureDefinition-outcome-evidence.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "outcome-evidence",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-implements",
      "valueUri" : "http://hl7.org/fhir/StructureDefinition/MetadataResource"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/outcome-evidence",
  "version" : "0.2.0",
  "name" : "OutcomeEvidence",
  "title" : "Outcome Evidence",
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
  "description" : "Represents evidence supporting a specific outcome within a body of clinical or scientific evidence.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Evidence",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Evidence",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Evidence",
        "path" : "Evidence"
      },
      {
        "id" : "Evidence.variableDefinition",
        "path" : "Evidence.variableDefinition",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "variableRole"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Evidence.variableDefinition:outcome",
        "path" : "Evidence.variableDefinition",
        "sliceName" : "outcome",
        "min" : 1,
        "max" : "*"
      },
      {
        "id" : "Evidence.variableDefinition:outcome.variableRole",
        "path" : "Evidence.variableDefinition.variableRole",
        "patternCode" : "outcome"
      }
    ]
  }
}

```
