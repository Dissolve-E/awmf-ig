# Evidence Internal Validity Assessment - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Internal Validity Assessment**

## Resource Profile: Evidence Internal Validity Assessment 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceInternalValidityAssessment |

 
A structured assessment of the internal validity of evidence. 

### Guidance

This profile represents an **Evidence Internal Validity Assessment** – a structured assessment of the internal validity (risk of bias) of individual studies or systematic reviews.

#### Overview

This profile serves as the base for internal validity assessments using various risk of bias tools. It is used for assessing individual studies or systematic reviews, as opposed to overall evidence assessments which aggregate evidence.

#### Relationship to Other Profiles

* **Parent profile:** [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md) – Base profile for internal validity assessments
* **Child profiles:** 
* [Evidence Internal Assessment ROBIS](StructureDefinition-evidence-internal-assessment-robis.md) – For systematic reviews
* [Evidence Internal Assessment Cochrane Risk of Bias](StructureDefinition-evidence-internal-assessment-cochrane-rob.md) – For RCTs
* [Evidence Internal Assessment AMSTAR 2](StructureDefinition-evidence-internal-assessment-amstar2.md) – For systematic reviews
* [Evidence Internal Assessment AGREE II](StructureDefinition-evidence-internal-assessment-agreeii.md) – For guidelines
 

#### Use Cases

1. **Single study assessment**– Assessing risk of bias for an individual RCT or observational study
1. **Systematic review quality**– Assessing methodological quality of a systematic review used as evidence
1. **Source guideline quality**– Assessing quality of an existing guideline used for adaptation

#### Example Usage

```
Instance: InternalValidityExample
InstanceOf: evidence-internal-validity-assessment
Usage: #example
* artifactReference = Reference(MyStudyEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#CochraneRoB

```

This profile of a FHIR ArtifactAssessment is derived from the [evidence-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-assessment) FHIR resource.

**Usages:**

* Derived from this Profile: [Evidence Internal Assessment AGREE II](StructureDefinition-evidence-internal-assessment-agreeii.md), [Evidence Internal Assessment AMSTAR 2](StructureDefinition-evidence-internal-assessment-amstar2.md), [Evidence Internal Assessment Cochrane Risk of Bias](StructureDefinition-evidence-internal-assessment-cochrane-rob.md) and [Evidence Internal Assessment ROBIS](StructureDefinition-evidence-internal-assessment-robis.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-internal-validity-assessment)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-internal-validity-assessment.csv), [Excel](StructureDefinition-evidence-internal-validity-assessment.xlsx), [Schematron](StructureDefinition-evidence-internal-validity-assessment.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-internal-validity-assessment",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-internal-validity-assessment",
  "version" : "0.2.0",
  "name" : "EvidenceInternalValidityAssessment",
  "title" : "Evidence Internal Validity Assessment",
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
  "description" : "A structured assessment of the internal validity of evidence.",
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
      }
    ]
  }
}

```
