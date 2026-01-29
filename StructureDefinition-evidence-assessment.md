# Evidence Assessment - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Assessment**

## Resource Profile: Evidence Assessment 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-assessment | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceAssessment |

 
A structured assessment of the certainty of evidence for a specific outcome. 

### Guidance

This profile of a FHIR ArtifactAssessment is derived from the [evidence-assessment](http://hl7.org/fhir/uv/ebm/StructureDefinition/evidence-assessment) FHIR resource.

**Usages:**

* Derived from this Profile: [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md) and [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md)
* Refer to this Profile: [Recommendation Justification](StructureDefinition-recommendation-justification.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-assessment)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-assessment.csv), [Excel](StructureDefinition-evidence-assessment.xlsx), [Schematron](StructureDefinition-evidence-assessment.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-assessment",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-assessment",
  "version" : "0.2.0",
  "name" : "EvidenceAssessment",
  "title" : "Evidence Assessment",
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
  "description" : "A structured assessment of the certainty of evidence for a specific outcome.",
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
  "baseDefinition" : "http://hl7.org/fhir/uv/ebm/StructureDefinition/evidence-assessment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ArtifactAssessment",
        "path" : "ArtifactAssessment"
      },
      {
        "id" : "ArtifactAssessment.artifact[x]",
        "path" : "ArtifactAssessment.artifact[x]",
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
        "id" : "ArtifactAssessment.artifact[x]:artifactReference",
        "path" : "ArtifactAssessment.artifact[x]",
        "sliceName" : "artifactReference",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/Citation",
              "http://hl7.org/fhir/StructureDefinition/Evidence",
              "http://hl7.org/fhir/uv/ebm/StructureDefinition/summary-of-findings",
              "http://hl7.org/fhir/uv/ebm/StructureDefinition/evidence-list",
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/citation-list"
            ]
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:ratingSystem",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "ratingSystem"
      },
      {
        "id" : "ArtifactAssessment.content:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.classifier",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:levelOfEvidence",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "levelOfEvidence",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:levelOfEvidence.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:levelOfEvidence.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "Overall",
              "display" : "Overall certainty"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:levelOfEvidence.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.workflowStatus",
        "path" : "ArtifactAssessment.workflowStatus",
        "min" : 1,
        "patternCode" : "applied"
      }
    ]
  }
}

```
