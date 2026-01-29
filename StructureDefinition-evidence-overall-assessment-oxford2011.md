# Evidence Overall Assessment Oxford 2011 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Overall Assessment Oxford 2011**

## Resource Profile: Evidence Overall Assessment Oxford 2011 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-oxford2011 | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceOverallAssessmentOXFORD2011 |

 
A structured assessment of the certainty of evidence for a specific outcome, including Oxford 2011 rating. 

### Guidance

This profile represents an **Evidence Assessment using Oxford 2011 (OCEBM)** – a structured assessment of the certainty of evidence for a specific outcome using the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence.

#### Overview

The Oxford 2011 system (OCEBM 2011) provides a framework for grading evidence based on study design and question type. It is commonly used in clinical practice guidelines, particularly in German-speaking countries.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to Oxford 2011:

```
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#OCEBM2011 "Oxford 2011 (OCEBM)"

```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Detailed domain-level ratings and the overall Oxford score may be added in future versions.

#### Example Usage

```
Instance: Oxford2011EvidenceExample
InstanceOf: evidence-assessment-oxford2011
Usage: #example
* artifactReference = Reference(MyOutcomeEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#OCEBM2011 "Oxford 2011 (OCEBM)"

```

For the base profile structure, see [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md).

This profile of a FHIR ArtifactAssessment is derived from the [evidence-overall-quality-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-quality-assessment) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-overall-assessment-oxford2011)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-overall-assessment-oxford2011.csv), [Excel](StructureDefinition-evidence-overall-assessment-oxford2011.xlsx), [Schematron](StructureDefinition-evidence-overall-assessment-oxford2011.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-overall-assessment-oxford2011",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-oxford2011",
  "version" : "0.2.0",
  "name" : "EvidenceOverallAssessmentOXFORD2011",
  "title" : "Evidence Overall Assessment Oxford 2011",
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
  "description" : "A structured assessment of the certainty of evidence for a specific outcome, including Oxford 2011 rating.",
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
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-quality-assessment",
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
              "code" : "OCEBM2011",
              "display" : "Oxford 2011 (OCEBM)"
            }
          ]
        }
      }
    ]
  }
}

```
