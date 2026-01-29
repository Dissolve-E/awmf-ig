# Recommendation Justification - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Justification**

## Resource Profile: Recommendation Justification 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RecommendationJustification |

 
A structured assessment of the evidence and consensus that underpins a recommendation. 

### Guidance

The recommendation justification is the boiler plate for linking evidence and evidence-to-decision information to a recommendation. In terms of Dissolve-E requirements, it shall allow to:

* Flag missing evidence for specific questions or topics

#### Linking Evidence and Justification to Recommendations

To ensure transparency and traceability, each recommendation can be supported by structured justification. This includes:

* Linking **evidence** used to derive the recommendation, outcome by outcome,
* Providing a structured summary of **evidence-to-decision** considerations (e.g., GRADE domains, consensus strength),
* Referencing individual studies when applicable.

This is achieved by combining two linked `ArtifactAssessment` profiles:

1. `RecommendationJustification`: summarizes how a recommendation was derived, including consensus strength and outcome-specific evidence summaries.
1. `EvidenceAssessment`: evaluates the certainty of the evidence for a specific outcome, and optionally for individual studies.

Each outcome that contributed to the recommendation is documented as a separate `content[evidence]` entry in the `RecommendationJustification`. This entry then references a corresponding `EvidenceAssessment` resource.

##### Example: Linking Evidence to a Recommendation

The following example shows how a justification can link multiple outcome-specific evidence ratings to one recommendation:

```
Instance: JustificationExample
InstanceOf: recommendation-justification
* artifactReference = Reference(GuidelineRecommendation/rec-001)
* workflowStatus = #applied

* content[recommendationRating]
  * component[strengthOfRecommendation].classifier = $cs-ebm-ig#strong
  * component[directionOfRecommendation].classifier = $vs-direction-of-recommendation#for
  * component[levelOfConsensus].classifier = vs-level-of-consensus#broad

* content[evidence][+]
  * type = $cs-ebm-ig#evidence
  * relatesTo
    * type = $cs-related-artifact-type#justification
    * targetReference = Reference(EvidenceAssessment/mortality)

* content[evidence][+]
  * type = $cs-ebm-ig#evidence
  * relatesTo
    * type = $cs-related-artifact-type#justification
    * targetReference = Reference(EvidenceAssessment/hospitalStay)

```

This structure supports separate evaluation of the certainty of evidence for each relevant outcome (e.g., mortality, hospital stay).

##### Example: Certainty of Evidence for an Outcome

Each `EvidenceAssessment` references the structured outcome evidence and provides a rating of the certainty of evidence (e.g., GRADE).

```
Instance: CertaintyMortality
InstanceOf: certainty-of-evidence-rating
* artifactReference = Reference(OutcomeEvidence/mortality-effect)
* workflowStatus = #applied

* content[ratingSystem]
  * classifier = $cs-evidence-rating-system#GRADE

* content[levelOfEvidence]
  * type = $cs-certainty-type#Overall
  * classifier = cs-rating-certainty-of-evidence#moderate

```

This pattern supports consistent documentation of certainty across outcomes and recommendations.

##### Optional: Referencing Individual Studies

If individual studies were assessed separately, each can be linked as a `component` within the corresponding `content[evidence]` in the `RecommendationJustification`:

```
* content[evidence][+]
  * type = $cs-ebm-ig#evidence
  * relatesTo.targetReference = Reference(EvidenceAssessment/summary-mortality)
  * component[+]
    * type = $cs-ebm-ig#evidence
    * relatesTo.targetReference = Reference(EvidenceAssessment/study123)

```

This structure enables separation of outcome-level summaries from individual study-level ratings, while still maintaining linkages between them.

##### Why this Structure?

Although the linkages span multiple resources (`RecommendationJustification → EvidenceAssessment → OutcomeEvidence → EvidenceVariable`), this model supports:

* Precise referencing of both outcome-level and study-level evidence,
* Extensibility for structured meta-analysis,
* Compatibility with structured reporting of p-values, effect sizes, and certainty domains,
* Clean separation of evidence evaluation (`EvidenceAssessment`) and recommendation reasoning (`RecommendationJustification`).

This design aligns with the Dissolve-E goal of structured, traceable, and standards-based documentation of how recommendations are derived from evidence.

#### Capturing Consensus Procedures for Recommendations

To promote transparency in how recommendations were developed, guidelines must include information on the **consensus process** used by the working group. This includes:

* The consensus method (e.g., Nominal Group Process, Delphi technique, Structured Consensus Conference),
* When consensus meetings took place,
* How consensus was achieved or revised across meetings.

This information is recorded in a dedicated **Consensus Protocol** section of the guideline composition, using the `consensusProtocol` slice. The content is unstructured and can be recorded as plain text, tables, or embedded HTML for maximum flexibility. Further slicing may be added in the future if structured encoding is needed.

##### Example in FSH

```
* section[+]
  * code = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p>The guideline was developed using a Delphi process conducted in three rounds between January and March 2024. Final consensus was reached during a structured consensus conference on March 28, 2024.</p></div>"

```

This section helps users and reviewers understand the development methodology and fosters trust in the guideline’s legitimacy.

#### Including Conflict of Interest Declarations

To ensure transparency and mitigate potential bias, all guidelines must disclose **conflicts of interest (COI)** of contributors. This includes:

* Types of interests (e.g., paid consultancy, speaker fees, advisory board membership, intellectual property ownership),
* Relevance to the guideline topic,
* Declared consequences (e.g., restriction from voting or drafting).

Conflict of interest declarations are recorded in the `competingInterests` section of the guideline composition or specific recommendation. The content may be provided as structured tables or unstructured text (e.g., using HTML tables within `text.div`). This allows for clear presentation of COI data without enforcing a rigid schema.

##### Example in FSH

```
* section[+]
  * code = cs-guideline-sections#competing-interests "Competing Interests"
  * text.div = """
    <div xmlns="http://www.w3.org/1999/xhtml">
      <table>
        <thead><tr><th>Name</th><th>Interest</th><th>Relevance</th><th>Consequence</th></tr></thead>
        <tbody>
          <tr><td>Dr. Example</td><td>Consulting for PharmaCorp</td><td>High</td><td>Excluded from voting</td></tr>
        </tbody>
      </table>
    </div>
    """

```

Further extensions or slices may be introduced in the future to structure these items more granularly (e.g., per contributor or per category), but for now, the section allows flexible textual or tabular encoding of COI information as appropriate.

This approach supports compliance with AWMF and oncology guideline standards, enabling clear communication of potential bias while allowing guideline developers freedom in how they collect and present COI declarations.

This profile of a FHIR ArtifactAssessment is derived from the [ArtifactAssessment](http://hl7.org/fhir/StructureDefinition/ArtifactAssessment) FHIR resource.

**Usages:**

* Derived from this Profile: [Recommendation Justification AWMF](StructureDefinition-recommendation-justification-awmf.md), [Recommendation Justification Expert Consensus](StructureDefinition-recommendation-justification-expert-consensus.md), [Recommendation Justification GRADE](StructureDefinition-recommendation-justification-grade.md), [Recommendation Justification OXFORD 2009](StructureDefinition-recommendation-justification-oxford-2009.md)... Show 2 more, [Recommendation Justification OXFORD 2011](StructureDefinition-recommendation-justification-oxford-2011.md) and [Recommendation Justification SIGN](StructureDefinition-recommendation-justification-sign.md)
* Refer to this Profile: [Recommendation](StructureDefinition-recommendation.md)
* Examples for this Profile: [ArtifactAssessment/RecommendationHAPDiagnosis-A-Justification](ArtifactAssessment-RecommendationHAPDiagnosis-A-Justification.md), [ArtifactAssessment/RecommendationHAPDiagnosis-B-Justification](ArtifactAssessment-RecommendationHAPDiagnosis-B-Justification.md) and [ArtifactAssessment/RecommendationMultiplexPCRDiagnostic-Justification](ArtifactAssessment-RecommendationMultiplexPCRDiagnostic-Justification.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/recommendation-justification)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-recommendation-justification.csv), [Excel](StructureDefinition-recommendation-justification.xlsx), [Schematron](StructureDefinition-recommendation-justification.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "recommendation-justification",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification",
  "version" : "0.2.0",
  "name" : "RecommendationJustification",
  "title" : "Recommendation Justification",
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
  "description" : "A structured assessment of the evidence and consensus that underpins a recommendation.",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/ArtifactAssessment",
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
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"
            ]
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content",
        "path" : "ArtifactAssessment.content",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "type"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "recommendationRating",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "recommendation-rating",
              "display" : "Recommendation Rating"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component",
        "path" : "ArtifactAssessment.content.component",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "type"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:ratingSystem",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "ratingSystem",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:ratingSystem.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "rating-system",
              "display" : "Rating System"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://hl7.org/fhir/uv/ebm/ValueSet/evidence-rating-system-classifier"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:strengthOfRecommendation",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "strengthOfRecommendation",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:strengthOfRecommendation.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "strength-of-recommendation",
              "display" : "Strength of Recommendation"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:directionOfRecommendation",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "directionOfRecommendation",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:directionOfRecommendation.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "direction-of-recommendation",
              "display" : "Direction of Recommendation"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:directionOfRecommendation.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-recommendation-direction"
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:levelOfConsensus",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "levelOfConsensus",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:levelOfConsensus.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "level-of-consensus"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:recommendationRating.component:levelOfConsensus.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-level-of-consensus"
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "evidenceRating",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "evidence-rating",
              "display" : "Evidence Rating"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component",
        "path" : "ArtifactAssessment.content.component",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "type"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:ratingSystem",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "ratingSystem",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:ratingSystem.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "rating-system",
              "display" : "Rating System"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:ratingSystem.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://hl7.org/fhir/uv/ebm/ValueSet/evidence-rating-system-classifier"
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:levelOfEvidence",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "levelOfEvidence",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:levelOfEvidence.type",
        "path" : "ArtifactAssessment.content.component.type",
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
        "id" : "ArtifactAssessment.content:evidenceRating.component:levelOfEvidence.classifier",
        "path" : "ArtifactAssessment.content.component.classifier",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:outcome",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "outcome",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:outcome.type",
        "path" : "ArtifactAssessment.content.component.type",
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
        "id" : "ArtifactAssessment.content:evidenceRating.component:outcome.relatesTo",
        "path" : "ArtifactAssessment.content.component.relatesTo",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:outcome.relatesTo.type",
        "path" : "ArtifactAssessment.content.component.relatesTo.type",
        "patternCode" : "depends-on"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:outcome.relatesTo.target[x]",
        "path" : "ArtifactAssessment.content.component.relatesTo.target[x]",
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
        "id" : "ArtifactAssessment.content:evidenceRating.component:outcome.relatesTo.target[x]:targetReference",
        "path" : "ArtifactAssessment.content.component.relatesTo.target[x]",
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
        "id" : "ArtifactAssessment.content:evidenceRating.component:overallQualityOfEvidence",
        "path" : "ArtifactAssessment.content.component",
        "sliceName" : "overallQualityOfEvidence",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:overallQualityOfEvidence.type",
        "path" : "ArtifactAssessment.content.component.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "overall-quality-of-evidence",
              "display" : "Overall Quality of Evidence"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:overallQualityOfEvidence.relatesTo",
        "path" : "ArtifactAssessment.content.component.relatesTo",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:overallQualityOfEvidence.relatesTo.type",
        "path" : "ArtifactAssessment.content.component.relatesTo.type",
        "patternCode" : "justification"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating.component:overallQualityOfEvidence.relatesTo.target[x]",
        "path" : "ArtifactAssessment.content.component.relatesTo.target[x]",
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
        "id" : "ArtifactAssessment.content:evidenceRating.component:overallQualityOfEvidence.relatesTo.target[x]:targetReference",
        "path" : "ArtifactAssessment.content.component.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-assessment"
            ]
          }
        ]
      },
      {
        "id" : "ArtifactAssessment.content:searchStrategy",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "searchStrategy",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "ArtifactAssessment.content:searchStrategy.type",
        "path" : "ArtifactAssessment.content.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "SearchStrategy",
              "display" : "SearchStrategy"
            }
          ]
        }
      },
      {
        "id" : "ArtifactAssessment.content:searchStrategy.relatesTo",
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
        "id" : "ArtifactAssessment.content:searchStrategy.relatesTo.target[x]",
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
        "id" : "ArtifactAssessment.content:searchStrategy.relatesTo.target[x]:targetReference",
        "path" : "ArtifactAssessment.content.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/uv/ebm/StructureDefinition/systematic-review"
            ]
          }
        ]
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
