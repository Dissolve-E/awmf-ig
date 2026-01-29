# Evidence Internal Assessment AMSTAR 2 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Internal Assessment AMSTAR 2**

## Resource Profile: Evidence Internal Assessment AMSTAR 2 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-amstar2 | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceInternalAsessmentAMSTAR2 |

 
A structured assessment of the certainty of evidence using AMSTAR 2. 

### Guidance

This profile represents an **Evidence Assessment using AMSTAR 2** – a structured assessment of the methodological quality of systematic reviews using the AMSTAR 2 (A MeaSurement Tool to Assess systematic Reviews) instrument.

#### Overview

AMSTAR 2 is a widely used tool for critically appraising systematic reviews. It assesses methodological quality across 16 domains, with 7 critical domains that can affect confidence in the review's results.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to AMSTAR 2:

```
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#AMSTAR2 "AMSTAR 2"

```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. The overall confidence rating (high, moderate, low, critically low) and individual domain assessments may be added in future versions.

#### Example Usage

```
Instance: AMSTAR2AssessmentExample
InstanceOf: evidence-assessment-amstar2
Usage: #example
* artifactReference = Reference(MySystematicReviewEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#AMSTAR2 "AMSTAR 2"

```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md).

This profile of a FHIR ArtifactAssessment is derived from the [evidence-internal-validity-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-internal-assessment-amstar2)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-internal-assessment-amstar2.csv), [Excel](StructureDefinition-evidence-internal-assessment-amstar2.xlsx), [Schematron](StructureDefinition-evidence-internal-assessment-amstar2.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-internal-assessment-amstar2",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-amstar2",
  "version" : "0.2.0",
  "name" : "EvidenceInternalAsessmentAMSTAR2",
  "title" : "Evidence Internal Assessment AMSTAR 2",
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
  "description" : "A structured assessment of the certainty of evidence using AMSTAR 2.",
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
              "code" : "AMSTAR2",
              "display" : "AMSTAR 2"
            }
          ]
        }
      }
    ]
  }
}

```
