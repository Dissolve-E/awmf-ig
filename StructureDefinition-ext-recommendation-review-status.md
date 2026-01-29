# Recommendation Review Status - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Review Status**

## Extension: Recommendation Review Status 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-recommendation-review-status | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RecommendationReviewStatus |

This extension allows for the indication of the status of a recommendation in the context of an updated guideline version along with an optional explanatory text

The RecommendationReviewStatus extension is used to indicate whether a recommendation has been added, updated, reviewed, or reaffirmed in the new guideline version, as well as to add an explanation text related to the status.

**Context of Use**

### Guidance

This extension indicates the **status of a recommendation in the context of an updated guideline version**, along with an optional explanatory text.

#### Overview

When guidelines are updated, recommendations may be added, modified, reviewed without changes, or reaffirmed. This extension tracks how each recommendation evolved between versions.

#### Context

This extension can be applied to any `Element` (typically recommendations).

#### Structure

The extension contains two sub-extensions:

| | | | |
| :--- | :--- | :--- | :--- |
| `review-status` | 1..1 | CodeableConcept | Status code from the review status value set |
| `review-status-text` | 0..1 | string | Optional explanation of the status |

#### Available Status Codes

Typical values include:

* `new` – New recommendation in this version
* `updated` – Recommendation has been modified
* `reviewed` – Recommendation was reviewed but not changed
* `reaffirmed` – Recommendation explicitly confirmed without changes

#### Example Usage

```
* extension[reviewStatus]
  * extension[review-status].valueCodeableConcept from vs-recommendation-review-status (required)
  * extension[review-status].valueCodeableConcept = #updated
  * extension[review-status-text].valueString = "Updated based on new RCT evidence published in 2024"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Recommendation](StructureDefinition-recommendation.md)
* Examples for this Extension: [Composition/RecommendationCognitiveTestsWhenSuspectingDementia](Composition-RecommendationCognitiveTestsWhenSuspectingDementia.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-recommendation-review-status)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-recommendation-review-status.csv), [Excel](StructureDefinition-ext-recommendation-review-status.xlsx), [Schematron](StructureDefinition-ext-recommendation-review-status.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-recommendation-review-status",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-recommendation-review-status",
  "version" : "0.2.0",
  "name" : "RecommendationReviewStatus",
  "title" : "Recommendation Review Status",
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
  "description" : "This extension allows for the indication of the status of a recommendation in the context of an updated guideline version along with an optional explanatory text",
  "purpose" : "The RecommendationReviewStatus extension is used to indicate whether a recommendation has been added, updated, reviewed, or reaffirmed in the new guideline version, as well as to add an explanation text related to the status.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Composition"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Version status of recommendation, i.e., confirmed, updated or new",
        "definition" : "Indicates the status of a recommendation in the context of a newer version of the guideline.",
        "comment" : "Supports tracking how a recommendation evolved in the new version of the guideline. That is, whether it was reviewed in the light of current evidence and confirmed or update, or is new entirely.",
        "max" : "1"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "min" : 1
      },
      {
        "id" : "Extension.extension:review-status",
        "path" : "Extension.extension",
        "sliceName" : "review-status",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:review-status.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:review-status.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "review-status"
      },
      {
        "id" : "Extension.extension:review-status.value[x]",
        "path" : "Extension.extension.value[x]",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-recommendation-review-status"
        }
      },
      {
        "id" : "Extension.extension:review-status-text",
        "path" : "Extension.extension",
        "sliceName" : "review-status-text",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Extension.extension:review-status-text.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:review-status-text.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "review-status-text"
      },
      {
        "id" : "Extension.extension:review-status-text.value[x]",
        "path" : "Extension.extension.value[x]",
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-recommendation-review-status"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "max" : "0"
      }
    ]
  }
}

```
