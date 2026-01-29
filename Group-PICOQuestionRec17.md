# PICO Question of Recommendation 17 from Guideline 038-013 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PICO Question of Recommendation 17 from Guideline 038-013**

## Example Group: PICO Question of Recommendation 17 from Guideline 038-013

Profile: [PICO Question](StructureDefinition-pico-question.md)

**description**: 

Schlüsselfrage: Sind Tests in nicht-spezialisierten Settings sinnvoll, um eine Demenz zu erkennen bei Personen, die kognitive Störungen berichten oder bei denen eine kognitive Störung beobachtet wird und die einer solchen Untersuchung zustimmen?

**membership**: Conceptual

> **characteristic****code**: Population**value**: [Group Population](Group-PICOPopulationRec17.md)**exclude**: false

> **characteristic****code**: Intervention**value**: [Group Intervention](Group-PICOInterventionRec17.md)**exclude**: false

> **characteristic****code**: Comparator**value**: [Group Comparator](Group-PICOComparatorRec17.md)**exclude**: false

> **characteristic****code**: Outcome**value**: [Group Outcome](Group-PICOOutcomeSensitivityRec17.md)**exclude**: false

> **characteristic****code**: Outcome**value**: [Group Outcome](Group-PICOOutcomeSpecificityRec17.md)**exclude**: false



## Resource Content

```json
{
  "resourceType" : "Group",
  "id" : "PICOQuestionRec17",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/pico-question"
    ]
  },
  "description" : "Schlüsselfrage: Sind Tests in nicht-spezialisierten Settings sinnvoll, um eine Demenz zu erkennen bei Personen, die kognitive Störungen berichten oder bei denen eine\nkognitive Störung beobachtet wird und die einer solchen Untersuchung zustimmen?",
  "membership" : "conceptual",
  "characteristic" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
            "code" : "population"
          }
        ]
      },
      "valueReference" : {
        "reference" : "Group/PICOPopulationRec17"
      },
      "exclude" : false
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
            "code" : "intervention"
          }
        ]
      },
      "valueReference" : {
        "reference" : "Group/PICOInterventionRec17"
      },
      "exclude" : false
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
            "code" : "comparator"
          }
        ]
      },
      "valueReference" : {
        "reference" : "Group/PICOComparatorRec17"
      },
      "exclude" : false
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
            "code" : "outcome"
          }
        ]
      },
      "valueReference" : {
        "reference" : "Group/PICOOutcomeSensitivityRec17"
      },
      "exclude" : false
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
            "code" : "outcome"
          }
        ]
      },
      "valueReference" : {
        "reference" : "Group/PICOOutcomeSpecificityRec17"
      },
      "exclude" : false
    }
  ]
}

```
