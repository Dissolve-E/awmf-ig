# Evidence Internal Assessment AGREE II - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Internal Assessment AGREE II**

## Resource Profile: Evidence Internal Assessment AGREE II 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-agreeii | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceInternalAssessmentAGREEII |

 
A structured assessment of the quality of guidelines using the AGREE II instrument. 

### Guidance

This profile represents an **Evidence Assessment using AGREE II** – a structured assessment of the quality of clinical practice guidelines using the AGREE II (Appraisal of Guidelines for Research and Evaluation) instrument.

#### Overview

AGREE II is the international standard for assessing the methodological quality of clinical practice guidelines. It evaluates guidelines across 6 domains with 23 items.

#### AGREE II Domains

1. **Scope and Purpose**– Overall aim, clinical questions, target population
1. **Stakeholder Involvement**– Relevant professional groups and patient views
1. **Rigour of Development**– Systematic evidence search and recommendation formulation
1. **Clarity of Presentation**– Specific and unambiguous recommendations
1. **Applicability**– Barriers, facilitators, and resource implications
1. **Editorial Independence**– Funding and competing interests

#### Key Elements

##### Rating System (Required)

The rating system is fixed to AGREE II:

```
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#AGREEII "AGREE II"

```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Domain-level scores and overall assessment may be added in future versions.

#### Example Usage

```
Instance: AGREEIIAssessmentExample
InstanceOf: evidence-assessment-agreeii
Usage: #example
* artifactReference = Reference(SourceGuideline)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#AGREEII "AGREE II"

```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md).

This profile of a FHIR ArtifactAssessment is derived from the [evidence-internal-validity-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-internal-assessment-agreeii)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-internal-assessment-agreeii.csv), [Excel](StructureDefinition-evidence-internal-assessment-agreeii.xlsx), [Schematron](StructureDefinition-evidence-internal-assessment-agreeii.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-internal-assessment-agreeii",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-agreeii",
  "version" : "0.2.0",
  "name" : "EvidenceInternalAssessmentAGREEII",
  "title" : "Evidence Internal Assessment AGREE II",
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
  "description" : "A structured assessment of the quality of guidelines using the AGREE II instrument.",
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
              "code" : "AGREEII",
              "display" : "AGREE II"
            }
          ]
        }
      }
    ]
  }
}

```
