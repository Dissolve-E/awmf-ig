# Evidence Internal Assessment ROBIS - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Internal Assessment ROBIS**

## Resource Profile: Evidence Internal Assessment ROBIS 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-robis | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceInternalAssessmentROBIS |

 
Structured assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews). 

### Guidance

This profile represents an **Evidence Assessment using ROBIS** – a structured assessment of risk of bias using the ROBIS (Risk of Bias in Systematic Reviews) tool.

#### Overview

ROBIS is a tool specifically designed to assess the risk of bias in systematic reviews. It evaluates concerns across multiple domains related to the conduct of the review.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to ROBIS:

```
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#ROBIS "ROBIS"

```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Detailed domain-level ratings (study eligibility criteria, identification and selection of studies, data collection and study appraisal, synthesis and findings) may be added in future versions.

#### Example Usage

```
Instance: ROBISAssessmentExample
InstanceOf: evidence-assessment-robis
Usage: #example
* artifactReference = Reference(MySystematicReviewEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#ROBIS "ROBIS"

```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md).

This profile of a FHIR ArtifactAssessment is derived from the [evidence-internal-validity-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-internal-assessment-robis)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-internal-assessment-robis.csv), [Excel](StructureDefinition-evidence-internal-assessment-robis.xlsx), [Schematron](StructureDefinition-evidence-internal-assessment-robis.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-internal-assessment-robis",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-robis",
  "version" : "0.2.0",
  "name" : "EvidenceInternalAssessmentROBIS",
  "title" : "Evidence Internal Assessment ROBIS",
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
  "description" : "Structured assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews).",
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
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ArtifactAssessment",
        "path" : "ArtifactAssessment"
      },
      {
        "id" : "ArtifactAssessment.content:ratingSystem",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "ratingSystem"
      },
      {
        "id" : "ArtifactAssessment.content:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.classifier",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem",
              "code" : "ROBIS",
              "display" : "ROBIS"
            }
          ]
        }
      }
    ]
  }
}

```
