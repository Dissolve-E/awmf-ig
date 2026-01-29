# Evidence Overall Assessment GRADE - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence Overall Assessment GRADE**

## Resource Profile: Evidence Overall Assessment GRADE 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-grade | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:EvidenceOverallAssessmentGRADE |

 
A structured assessment of the certainty of evidence for a specific outcome, including GRADE rating. 

### Guidance

This profile represents an **Evidence Assessment using GRADE** – a structured assessment of the certainty of evidence for a specific outcome using the GRADE methodology.

#### Overview

GRADE (Grading of Recommendations Assessment, Development and Evaluation) is a systematic approach to rating the certainty of evidence. This profile captures all GRADE domains that may affect the certainty rating.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to GRADE:

```
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#GRADE

```

##### Level of Evidence

Overall certainty rating (high, moderate, low, very low):

```
* content[levelOfEvidence]
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier from vs-rating-certainty-of-evidence (required)

```

##### GRADE Certainty Domains

The profile supports all standard GRADE domains for downgrading or upgrading:

**Downgrading factors:**

* `inconsistency` – Heterogeneity across studies
* `indirectness` – Indirect evidence (population, intervention, comparator, outcome)
* `imprecision` – Wide confidence intervals
* `publicationBias` – Selective publication

**Upgrading factors (observational studies):**

* `doseResponseGradient` – Dose-response relationship
* `plausibleConfounding` – Confounding would reduce effect
* `largeEffect` – Large magnitude of effect

Example:

```
* content[inconsistency]
  * type = $cs-certainty-type#Inconsistency "Inconsistency"
* content[indirectness]
  * type = $cs-certainty-type#Indirectness "Indirectness"
* content[imprecision]
  * type = $cs-certainty-type#Imprecision "Imprecision"

```

#### Example Usage

```
Instance: GRADEEvidenceExample
InstanceOf: evidence-assessment-grade
Usage: #example
* artifactReference = Reference(MortalityOutcomeEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#GRADE
* content[levelOfEvidence].classifier = #moderate
* content[imprecision].type = $cs-certainty-type#Imprecision

```

For the base profile structure, see [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md).

This profile of a FHIR ArtifactAssessment is derived from the [evidence-overall-quality-assessment](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-quality-assessment) FHIR resource.

**Usages:**

* Examples for this Profile: [ArtifactAssessment/EvA-MultiplexPCRDiagnostic-AntibioticDays](ArtifactAssessment-EvA-MultiplexPCRDiagnostic-AntibioticDays.md), [ArtifactAssessment/EvA-MultiplexPCRDiagnostic-Mortality](ArtifactAssessment-EvA-MultiplexPCRDiagnostic-Mortality.md) and [ArtifactAssessment/EvA-MultiplexPCRDiagnostic-TimeToDeescalation](ArtifactAssessment-EvA-MultiplexPCRDiagnostic-TimeToDeescalation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/evidence-overall-assessment-grade)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-evidence-overall-assessment-grade.csv), [Excel](StructureDefinition-evidence-overall-assessment-grade.xlsx), [Schematron](StructureDefinition-evidence-overall-assessment-grade.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "evidence-overall-assessment-grade",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-overall-assessment-grade",
  "version" : "0.2.0",
  "name" : "EvidenceOverallAssessmentGRADE",
  "title" : "Evidence Overall Assessment GRADE",
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
  "description" : "A structured assessment of the certainty of evidence for a specific outcome, including GRADE rating.",
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
        "id" : "ArtifactAssessment.content",
        "path" : "ArtifactAssessment.content",
        "min" : 1
      },
      {
        "id" : "ArtifactAssessment.content:ratingSystem",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "ratingSystem",
        "min" : 1
      },
      {
        "id" : "ArtifactAssessment.content:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.classifier",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/uv/ebm/CodeSystem/evidence-rating-system-classifier-codesystem",
              "code" : "GRADE"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:levelOfEvidence",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "levelOfEvidence"
      },
      {
        "id" : "ArtifactAssessment.content:levelOfEvidence.classifier",
        "path" : "ArtifactAssessment.content.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-rating-certainty-of-evidence"
        }
      },
      {
        "id" : "ArtifactAssessment.content:inconsistency",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "inconsistency",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:inconsistency.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:inconsistency.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "Inconsistency",
              "display" : "Inconsistency"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:inconsistency.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:indirectness",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "indirectness",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:indirectness.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:indirectness.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "Indirectness",
              "display" : "Indirectness"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:indirectness.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:imprecision",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "imprecision",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:imprecision.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:imprecision.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "Imprecision",
              "display" : "Imprecision"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:imprecision.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:publicationBias",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "publicationBias",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:publicationBias.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:publicationBias.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "PublicationBias",
              "display" : "Publication bias"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:publicationBias.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:doseResponseGradient",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "doseResponseGradient",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:doseResponseGradient.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:doseResponseGradient.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "DoseResponseGradient",
              "display" : "Dose response gradient"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:doseResponseGradient.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:plausibleConfounding",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "plausibleConfounding",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:plausibleConfounding.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:plausibleConfounding.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "PlausibleConfounding",
              "display" : "Plausible confounding"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:plausibleConfounding.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:largeEffect",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "largeEffect",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:largeEffect.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.extension",
        "sliceName" : "RelatesToWithQuotation"
      },
      {
        "id" : "ArtifactAssessment.content:largeEffect.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/certainty-type",
              "code" : "LargeEffect",
              "display" : "Large effect"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:largeEffect.component.extension:RelatesToWithQuotation",
        "path" : "ArtifactAssessment.content.component.extension",
        "sliceName" : "RelatesToWithQuotation"
      }
    ]
  }
}

```
