# PICO Intervention of Recommendation 17 from Guideline 038-013 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **PICO Intervention of Recommendation 17 from Guideline 038-013**

## Example Group: PICO Intervention of Recommendation 17 from Guideline 038-013

Profile: [Conceptual Cohort Definition Intervention](StructureDefinition-conceptual-cohort-definition-intervention.md)

**description**: 

Verschiedene kognitive Kurztests

**membership**: Conceptual

**code**: Intervention

### Characteristics

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Code** | **Value[x]** | **Exclude** |
| * | Procedure (procedure) | Assessment of cognitive function (procedure) | false |



## Resource Content

```json
{
  "resourceType" : "Group",
  "id" : "PICOInterventionRec17",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-intervention"
    ]
  },
  "description" : "Verschiedene kognitive Kurztests",
  "membership" : "conceptual",
  "code" : {
    "coding" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
        "code" : "intervention"
      }
    ]
  },
  "characteristic" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://snomed.info/sct",
            "code" : "71388002",
            "display" : "Procedure (procedure)"
          }
        ]
      },
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://snomed.info/sct",
            "code" : "1100881000168104",
            "display" : "Assessment of cognitive function (procedure)"
          }
        ]
      },
      "exclude" : false
    }
  ]
}

```
