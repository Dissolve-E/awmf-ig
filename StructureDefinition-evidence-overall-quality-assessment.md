# Evidence Overall Quality Assessment - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Overall Quality Assessment**

## Resource Profile: Evidence Overall Quality Assessment 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-quality-assessment | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceOverallQualityAssessment |

 
A structured assessment of the overall evidence for a specific outcome. 

### Guidance

This profile of a FHIR ArtifactAssessment is derived from the [evidence-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-assessment) FHIR resource.

**Usages:**

* Derived from this Profile: [Evidence Overall Assessment GRADE](StructureDefinition-evidence-overall-assessment-grade.md) and [Evidence Overall Assessment Oxford 2011](StructureDefinition-evidence-overall-assessment-oxford2011.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-overall-quality-assessment)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-overall-quality-assessment.csv), [Excel](StructureDefinition-evidence-overall-quality-assessment.xlsx), [Schematron](StructureDefinition-evidence-overall-quality-assessment.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-overall-quality-assessment",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-quality-assessment",
  "version" : "0.2.0",
  "name" : "EvidenceOverallQualityAssessment",
  "title" : "Evidence Overall Quality Assessment",
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
  "description" : "A structured assessment of the overall evidence for a specific outcome.",
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
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ArtifactAssessment",
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-assessment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ArtifactAssessment",
        "path" : "ArtifactAssessment"
      },
      {
        "id" : "ArtifactAssessment.content:outcome",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "outcome",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:outcome.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:outcome.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "outcome",
              "display" : "Outcome"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:outcome.relatesTo",
        "path" : "ArtifactAssessment.content.relatesTo",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:outcome.relatesTo.type",
        "path" : "ArtifactAssessment.content.relatesTo.type",
        "patternCode" : "depends-on"
      },
      {
        "id" : "ArtifactAssessment.content:outcome.relatesTo.target[x]",
        "path" : "ArtifactAssessment.content.relatesTo.target[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "ArtifactAssessment.content:outcome.relatesTo.target[x]:targetReference",
        "path" : "ArtifactAssessment.content.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/conceptual-cohort-definition-outcome",
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/outcome-evidence"
            ]
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:outcome.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      }
    ]
  }
}

```
