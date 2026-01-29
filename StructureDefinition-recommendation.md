# Recommendation - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation**

## Resource Profile: Recommendation 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:Recommendation |

 
Clinical Practice Guideline Recommendation 

### Key Requirements taken into Account

The recommendation data model must be able to:

### Structural Aspects

* Capture different variants of content including long and short variants, patient information, qualtity indicators, evidence-to-decision data, videos, images, etc (list extensible).
* Include procedural linking between individual recommendations

#### Multi-Language Support for Guideline and Recommendation Sections

To support multi-language publishing of clinical guidelines, the section content in a guideline composition must be represented **per language**. This allows rendering engines and readers to easily select the appropriate version without relying on translation extensions that imply a primary language.

Each section in the `Composition.section` tree may contain a `language` slice, which holds one or more language-specific representations of the same content.

Each `section[language]`:

* Contains an extension `ext-section-language` to indicate the language (e.g., `#de`, `#en`, `#ar`),
* Contains a `text` block with the narrative in that language,
* May contain a `title` and additional structure,
* Can support right-to-left (RTL) layout if required (e.g., Arabic) by using a custom narrative renderer such as `narrative-rtl`.

This structure is preferred over translation extensions (e.g., `content.translation`) because it allows all languages to be treated as equal and avoids privileging a "main" language. This is especially useful in multilingual regions or when publishing international guidelines.

##### Example: Multi-Language Section

```
* section[introduction]
  * section[+]
    * code = cs-guideline-sections#overview
    * section[language][+]
      * extension[ext-section-language].valueCode = #de
      * title = "Übersicht der Empfehlungen und Statements"
      * insert narrative([[Übersicht der Empfehlungen und Statements]])
    * section[language][+]
      * extension[ext-section-language].valueCode = #en
      * title = "Overview of Recommendations and Statements"
      * insert narrative([[Overview of Recommendations and Statements]])
    * section[language][+]
      * extension[ext-section-language].valueCode = #ar
      * title = "نظرة عامة على التوصيات والبيانات"
      * insert narrative-rtl([[نظرة عامة على التوصيات والبيانات]])

```

##### Design Considerations

* **No Primary Language Assumption**: All language sections are treated equally. This avoids models where one language is considered the source and others as secondary translations.
* **Language-Dependent Text Content**: Narrative and free-text fields are included inside the `language` sections, as they are language-specific.
* **Language-Invariant Data (e.g., Codes)**: Structured codes and metadata (e.g., `CodeableConcept`) remain outside the language-specific sections, as they are not language-dependent.
* **Author Attribution**: In the future, a language-specific `section.author` extension may be introduced to represent language-specific contributions.

This approach ensures high flexibility and internationalization, while maintaining clean semantic structure and avoiding redundancy or conflicting language data.

### Indentifiers, References, Versions

* Allow identification of individual recommendations across guideline version
* Allow referencing of individual recommendations and their respective content elements
* Include version information in the form major.minor
* Allow deprecation

#### Represent provenance information regarding previous versions of the guideline, e.g., after changes in an identifer

To represent the relationship between recommendation versions, such as updates, replacements, or discontinued predecessors, the `relatesTo` element is used.

You can indicate that a recommendation **replaces** a previous version or **is replaced by** a newer one using specific types and references:

```
* relatesTo[+]
  * type = #replaces
  * targetReference = Reference(Recommendation/021-001-old)

* relatesTo[+]
  * type = #replaced-with
  * targetReference = Reference(Recommendation/021-001-new)

```

These relationships ensure a clear lineage across updates and enable traceability in systems that aggregate or display recommendation.

### Guideline Content

* Capture PICO criteria, both as text and via coded annotations, especially P and I
* Include multiple interventions, e.g. from network meta analysis
* Differentiate patient sub-populations and their respective interventions
* Allow terminological coding both on a keyword-type level and on a detailed, CDS-type level
* Use codes from a variety of terminologies such as SNOMED-CT, ICD-10/11, LOINC, OPS, ATC etc
* Include labels regarding intended target audience, recommendation type (diagnostic, therapeutic etc), topical relevance for each content variant
* Include labels describing the revision status of recommendations after a guideline update, i.e., **new**, **revised**, **confirmed after review**

This profile of a FHIR Composition is derived from the [recommendation](http://hl7.org/fhir/uv/ebm/StructureDefinition/recommendation) FHIR resource.

**Usages:**

* Refer to this Profile: [Recommendation Justification](StructureDefinition-recommendation-justification.md) and [Recommendation](StructureDefinition-recommendation.md)
* Examples for this Profile: [Composition/RecommendationCognitiveTestsWhenSuspectingDementia](Composition-RecommendationCognitiveTestsWhenSuspectingDementia.md), [Composition/RecommendationExample](Composition-RecommendationExample.md), [Composition/RecommendationHAPDiagnosis-A](Composition-RecommendationHAPDiagnosis-A.md), [Composition/RecommendationHAPDiagnosis-B](Composition-RecommendationHAPDiagnosis-B.md)... Show 2 more, [Composition/RecommendationHAPDiagnosis](Composition-RecommendationHAPDiagnosis.md) and [Composition/RecommendationMultiplexPCRDiagnostic](Composition-RecommendationMultiplexPCRDiagnostic.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/recommendation)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-recommendation.csv), [Excel](StructureDefinition-recommendation.xlsx), [Schematron](StructureDefinition-recommendation.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "recommendation",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation",
  "version" : "0.2.0",
  "name" : "Recommendation",
  "title" : "Recommendation",
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
  "description" : "Clinical Practice Guideline Recommendation",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
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
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "fhirdocumentreference",
      "uri" : "http://hl7.org/fhir/documentreference",
      "name" : "FHIR DocumentReference"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Composition",
  "baseDefinition" : "http://hl7.org/fhir/uv/ebm/StructureDefinition/recommendation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition",
        "path" : "Composition",
        "constraint" : [
          {
            "key" : "inv-require-official-identifier",
            "severity" : "error",
            "human" : "Every Guideline/Recommendation must have exactly one official identifier (with use = #official)",
            "expression" : "identifier.where(use='official').count() = 1",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation"
          }
        ]
      },
      {
        "id" : "Composition.meta.tag",
        "path" : "Composition.meta.tag",
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-recommendation-tags"
        }
      },
      {
        "id" : "Composition.extension:versionAlgorithm",
        "path" : "Composition.extension",
        "sliceName" : "versionAlgorithm"
      },
      {
        "id" : "Composition.extension:versionAlgorithm.value[x]:valueCoding",
        "path" : "Composition.extension.value[x]",
        "sliceName" : "valueCoding",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
          "code" : "year-month-versioning"
        }
      },
      {
        "id" : "Composition.extension:approvalDate",
        "path" : "Composition.extension",
        "sliceName" : "approvalDate",
        "short" : "Approval Date",
        "definition" : "The date on which the recommendation was approved in its current version."
      },
      {
        "id" : "Composition.extension:approvalDate.extension",
        "path" : "Composition.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.extension:lastReviewDate",
        "path" : "Composition.extension",
        "sliceName" : "lastReviewDate",
        "short" : "Last Literature Review Date",
        "definition" : "The date of the last literature review for the recommendation."
      },
      {
        "id" : "Composition.extension:lastReviewDate.extension",
        "path" : "Composition.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.extension:reviewStatus",
        "path" : "Composition.extension",
        "sliceName" : "reviewStatus",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-recommendation-review-status"
            ]
          }
        ]
      },
      {
        "id" : "Composition.version",
        "path" : "Composition.version",
        "min" : 1
      },
      {
        "id" : "Composition.category",
        "path" : "Composition.category",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "coding"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.category:synthesisType",
        "path" : "Composition.category",
        "sliceName" : "synthesisType",
        "short" : "Assessment type for making this recommendation: evidence, consensus only, statement.",
        "definition" : "Specifies whether it is an evidence-based or consensus-bases recommendation, or a statement.",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.category:synthesisType.coding",
        "path" : "Composition.category.coding",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-recommendation-synthesis-type"
        }
      },
      {
        "id" : "Composition.category:synthesisType.coding.system",
        "path" : "Composition.category.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.category:synthesisType.coding.code",
        "path" : "Composition.category.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.category:clinicalApplicationType",
        "path" : "Composition.category",
        "sliceName" : "clinicalApplicationType",
        "short" : "Clinical application the recommendation is intended for: diagnostic, prognostic, therapeutic etc.",
        "definition" : "Specifies whether it is a diagnostic, prognostic, therapeutic, monitoring, screening, preventative recommendation.",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.category:clinicalApplicationType.coding",
        "path" : "Composition.category.coding",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-clinical-application-type"
        }
      },
      {
        "id" : "Composition.category:clinicalApplicationType.coding.system",
        "path" : "Composition.category.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.category:clinicalApplicationType.coding.code",
        "path" : "Composition.category.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.relatesTo",
        "path" : "Composition.relatesTo",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "type"
            },
            {
              "type" : "value",
              "path" : "extension('http://hl7.org/fhir/StructureDefinition/relatesto-classifier').value.ofType(CodeableConcept)"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:partOf",
        "path" : "Composition.relatesTo",
        "sliceName" : "partOf",
        "short" : "A reference to at least one guideline that this recommendation is part of.",
        "definition" : "A reference to at least one guideline that this recommendation is part of.",
        "comment" : "Each recommendation must be part of at least one guideline.",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion",
        "path" : "Composition.relatesTo",
        "sliceName" : "derivedFrom/picoQuestion",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.extension",
        "path" : "Composition.relatesTo.extension",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.extension:classifier.extension",
        "path" : "Composition.relatesTo.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.extension:classifier.value[x]",
        "path" : "Composition.relatesTo.extension.value[x]",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
              "code" : "pico-question"
            }
          ]
        }
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "derived-from"
      },
      {
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.target[x]",
        "path" : "Composition.relatesTo.target[x]",
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
        "id" : "Composition.relatesTo:derivedFrom/picoQuestion.target[x]:targetReference",
        "path" : "Composition.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/pico-question"
            ]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:specificationOfPreceedingRecommendation",
        "path" : "Composition.relatesTo",
        "sliceName" : "specificationOfPreceedingRecommendation",
        "short" : "A reference to another Recommendation which preceeds this Recommendation in a (hypothetical) clinical workflow.",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:specificationOfPreceedingRecommendation.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier"
      },
      {
        "id" : "Composition.relatesTo:specificationOfPreceedingRecommendation.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "predecessor"
      },
      {
        "id" : "Composition.relatesTo:specificationOfPreceedingRecommendation.target[x]",
        "path" : "Composition.relatesTo.target[x]",
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
        "id" : "Composition.relatesTo:specificationOfPreceedingRecommendation.target[x]:targetReference",
        "path" : "Composition.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
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
        "id" : "Composition.relatesTo:specificationOfSucceedingRecommendation",
        "path" : "Composition.relatesTo",
        "sliceName" : "specificationOfSucceedingRecommendation",
        "short" : "A reference to another Recommendation which succeeds this Recommendation in a (hypothetical) clinical workflow.",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:specificationOfSucceedingRecommendation.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier"
      },
      {
        "id" : "Composition.relatesTo:specificationOfSucceedingRecommendation.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "successor"
      },
      {
        "id" : "Composition.relatesTo:specificationOfSucceedingRecommendation.target[x]",
        "path" : "Composition.relatesTo.target[x]",
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
        "id" : "Composition.relatesTo:specificationOfSucceedingRecommendation.target[x]:targetReference",
        "path" : "Composition.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
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
        "id" : "Composition.relatesTo:replacesRecommendation",
        "path" : "Composition.relatesTo",
        "sliceName" : "replacesRecommendation",
        "short" : "A reference to an (older, outdated or obsolete) Recommendation which has been replaced by this Recommendation.",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:replacesRecommendation.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier"
      },
      {
        "id" : "Composition.relatesTo:replacesRecommendation.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "replaces"
      },
      {
        "id" : "Composition.relatesTo:replacesRecommendation.target[x]",
        "path" : "Composition.relatesTo.target[x]",
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
        "id" : "Composition.relatesTo:replacesRecommendation.target[x]:targetReference",
        "path" : "Composition.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
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
        "id" : "Composition.section",
        "path" : "Composition.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code.coding"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section.extension",
        "path" : "Composition.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section.extension:intendedAudience",
        "path" : "Composition.section.extension",
        "sliceName" : "intendedAudience",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section.code",
        "path" : "Composition.section.code",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-sections"
        }
      },
      {
        "id" : "Composition.section:summary",
        "path" : "Composition.section",
        "sliceName" : "summary"
      },
      {
        "id" : "Composition.section:summary.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "summary",
              "display" : "Summary"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction",
        "path" : "Composition.section",
        "sliceName" : "introduction"
      },
      {
        "id" : "Composition.section:introduction.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "introduction",
              "display" : "Introduction"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion",
        "path" : "Composition.section",
        "sliceName" : "discussion"
      },
      {
        "id" : "Composition.section:discussion.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "discussion",
              "display" : "Discussion"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods",
        "path" : "Composition.section",
        "sliceName" : "methods"
      },
      {
        "id" : "Composition.section:methods.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "methods",
              "display" : "Methods"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references",
        "path" : "Composition.section",
        "sliceName" : "references"
      },
      {
        "id" : "Composition.section:references.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "references",
              "display" : "References"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests",
        "path" : "Composition.section",
        "sliceName" : "competingInterests"
      },
      {
        "id" : "Composition.section:competingInterests.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "competing-interests",
              "display" : "Competing Interests"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements",
        "path" : "Composition.section",
        "sliceName" : "acknowledgements"
      },
      {
        "id" : "Composition.section:acknowledgements.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "acknowledgements",
              "display" : "Acknowledgements"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices",
        "path" : "Composition.section",
        "sliceName" : "appendices"
      },
      {
        "id" : "Composition.section:appendices.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "appendices",
              "display" : "Appendices"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:recommendationStatement",
        "path" : "Composition.section",
        "sliceName" : "recommendationStatement"
      },
      {
        "id" : "Composition.section:recommendationStatement.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "recommendation-statement",
              "display" : "Recommendation Statement"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:recommendationStatement.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:recommendationStatement.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:recommendationStatement.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:recommendationStatement.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:recommendationStatement.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:recommendationStatement.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:recommendationStatement.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:recommendationStatement.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:recommendationStatement.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:recommendationStatement.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:ratings",
        "path" : "Composition.section",
        "sliceName" : "ratings",
        "short" : "The reference to the structured assessment of grade of recommendations, strength of consensus, level of evidence for this recommendation and respective evidence assessment tools."
      },
      {
        "id" : "Composition.section:ratings.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "ratings",
              "display" : "Ratings"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:ratings.entry",
        "path" : "Composition.section.entry",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:population",
        "path" : "Composition.section",
        "sliceName" : "population"
      },
      {
        "id" : "Composition.section:population.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "population",
              "display" : "Population"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:population.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:population.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:population.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:population.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:population.section:language.extension:keyword",
        "path" : "Composition.section.section.extension",
        "sliceName" : "keyword",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:population.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:population.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:population.section:language.entry",
        "path" : "Composition.section.section.entry",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/EvidenceVariable",
              "http://hl7.org/fhir/StructureDefinition/Group"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:population.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:population.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:population.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:population.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:action",
        "path" : "Composition.section",
        "sliceName" : "action"
      },
      {
        "id" : "Composition.section:action.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "action",
              "display" : "Action"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:action.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:action.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:action.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:action.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:action.section:language.extension:keyword",
        "path" : "Composition.section.section.extension",
        "sliceName" : "keyword",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:action.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:action.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:action.section:language.entry",
        "path" : "Composition.section.section.entry",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PlanDefinition"]
          }
        ]
      },
      {
        "id" : "Composition.section:action.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:action.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:action.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:action.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:oppositeAction",
        "path" : "Composition.section",
        "sliceName" : "oppositeAction"
      },
      {
        "id" : "Composition.section:oppositeAction.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "opposite-action",
              "display" : "Opposite Action"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:oppositeAction.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:oppositeAction.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.extension:keyword",
        "path" : "Composition.section.section.extension",
        "sliceName" : "keyword",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.entry",
        "path" : "Composition.section.section.entry",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/PlanDefinition"]
          }
        ]
      },
      {
        "id" : "Composition.section:oppositeAction.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:oppositeAction.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:oppositeAction.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:oppositeAction.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:evidence",
        "path" : "Composition.section",
        "sliceName" : "evidence"
      },
      {
        "id" : "Composition.section:evidence.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "evidence",
              "display" : "Evidence"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:justification",
        "path" : "Composition.section",
        "sliceName" : "justification"
      },
      {
        "id" : "Composition.section:justification.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "justification",
              "display" : "Justification"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:considerations",
        "path" : "Composition.section",
        "sliceName" : "considerations"
      },
      {
        "id" : "Composition.section:considerations.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "considerations",
              "display" : "Considerations"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text",
        "path" : "Composition.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "mustSupport" : true
      },
      {
        "id" : "Composition.section:text.extension:intendedAudience",
        "path" : "Composition.section.extension",
        "sliceName" : "intendedAudience",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol",
        "path" : "Composition.section",
        "sliceName" : "consensusProtocol",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:consensusProtocol.extension:intendedAudience",
        "path" : "Composition.section.extension",
        "sliceName" : "intendedAudience",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "consensus-protocol",
              "display" : "Consensus Protocol"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "consensus-protocol",
          "display" : "Consensus Protocol"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:patientVersion",
        "path" : "Composition.section",
        "sliceName" : "patientVersion",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:patientVersion.extension:intendedAudience",
        "path" : "Composition.section.extension",
        "sliceName" : "intendedAudience",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:patientVersion.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "patient-version",
              "display" : "Patient Version"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:patientVersion.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "patient-version",
          "display" : "Patient Version"
        }
      },
      {
        "id" : "Composition.section:otherContent",
        "path" : "Composition.section",
        "sliceName" : "otherContent",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:otherContent.extension:intendedAudience",
        "path" : "Composition.section.extension",
        "sliceName" : "intendedAudience",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-content-types"
        }
      },
      {
        "id" : "Composition.section:otherContent.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-content-types"
        }
      },
      {
        "id" : "Composition.section:otherContent.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:otherContent.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:outcome",
        "path" : "Composition.section",
        "sliceName" : "outcome",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Composition.section:outcome.extension:intendedAudience",
        "path" : "Composition.section.extension",
        "sliceName" : "intendedAudience",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:outcome.code",
        "path" : "Composition.section.code",
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
        "id" : "Composition.section:outcome.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-pico",
          "code" : "outcome",
          "display" : "Outcome"
        }
      },
      {
        "id" : "Composition.section:outcome.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:outcome.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:outcome.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:outcome.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:outcome.section:language.extension:keyword",
        "path" : "Composition.section.section.extension",
        "sliceName" : "keyword",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:outcome.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:outcome.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:outcome.section:language.entry",
        "path" : "Composition.section.section.entry",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.org/fhir/StructureDefinition/EvidenceVariable",
              "http://hl7.org/fhir/StructureDefinition/Group"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:outcome.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:outcome.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:outcome.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:outcome.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      }
    ]
  }
}

```
