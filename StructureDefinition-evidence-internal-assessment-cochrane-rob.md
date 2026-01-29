# Evidence Internal Assessment Cochrane Risk of Bias - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Internal Assessment Cochrane Risk of Bias**

## Resource Profile: Evidence Internal Assessment Cochrane Risk of Bias 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-cochrane-rob | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceInternalAssessmentCochraneRoB |

 
Structured assessment of risk of bias using Cochrane RoB tool. 

### Guidance

This profile represents an **Evidence Assessment using the Cochrane Risk of Bias Tool** – a structured assessment of risk of bias for individual studies using the Cochrane RoB tool.

#### Overview

The Cochrane Risk of Bias tool is the standard approach for assessing internal validity of randomized controlled trials included in systematic reviews. It evaluates bias across multiple domains.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to Cochrane RoB:

```
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#CochraneRoB "Cochrane RoB"

```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Detailed domain-level ratings (randomization process, deviations from intervention, missing outcome data, measurement of outcome, selection of reported result) may be added in future versions.

#### Example Usage

```
Instance: CochraneRoBExample
InstanceOf: evidence-assessment-cochrane-rob
Usage: #example
* artifactReference = Reference(MyRCTEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#CochraneRoB "Cochrane RoB"

```

For the base profile structure, see [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md).

This profile of a FHIR ArtifactAssessment is derived from the [evidence-internal-validity-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment) FHIR resource.

**Usages:**

* Examples for this Profile: [ArtifactAssessment/RoB-CognitiveTestsWhenSuspectingDementia-Sensitivity](ArtifactAssessment-RoB-CognitiveTestsWhenSuspectingDementia-Sensitivity.md) and [ArtifactAssessment/RoB-CognitiveTestsWhenSuspectingDementia-Specificity](ArtifactAssessment-RoB-CognitiveTestsWhenSuspectingDementia-Specificity.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-internal-assessment-cochrane-rob)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-internal-assessment-cochrane-rob.csv), [Excel](StructureDefinition-evidence-internal-assessment-cochrane-rob.xlsx), [Schematron](StructureDefinition-evidence-internal-assessment-cochrane-rob.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-internal-assessment-cochrane-rob",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-assessment-cochrane-rob",
  "version" : "0.2.0",
  "name" : "EvidenceInternalAssessmentCochraneRoB",
  "title" : "Evidence Internal Assessment Cochrane Risk of Bias",
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
  "description" : "Structured assessment of risk of bias using Cochrane RoB tool.",
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
              "code" : "CochraneRoB",
              "display" : "Cochrane RoB"
            }
          ]
        }
      }
    ]
  }
}

```
