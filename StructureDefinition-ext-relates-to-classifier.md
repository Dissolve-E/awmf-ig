# RelatesTo Classifier - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **RelatesTo Classifier**

## Extension: RelatesTo Classifier 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-classifier | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RelatesToClassifier |

This extension defines a classification for the 'relatesTo' relationship using a CodeableConcept.

**Context of Use**

### Guidance

This extension defines a **classification for the `relatesTo` relationship** using a `CodeableConcept`.

#### Overview

When linking related artifacts (guidelines, documents, websites), the `relatesTo.type` provides the basic relationship type (e.g., `similar-to`, `documentation`). This extension provides an additional layer of classification to specify the nature of the related item more precisely.

#### Context

This extension can be applied to `Composition.relatesTo` elements.

#### Value Type

The value is a `CodeableConcept`:

```
* value[x] only CodeableConcept
* valueCodeableConcept 1..1

```

#### Example Usage

```
// Classify a related guideline:
* relatesTo[relatedGuideline]
  * type = #similar-to
  * extension[classifier].valueCodeableConcept = cs-related-artifact-types#related-guideline

// Classify a dissemination website:
* relatesTo[disseminationWebsite]
  * type = #documentation
  * extension[classifier].valueCodeableConcept from vs-dissemination-website (required)

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-relates-to-classifier)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-relates-to-classifier.csv), [Excel](StructureDefinition-ext-relates-to-classifier.xlsx), [Schematron](StructureDefinition-ext-relates-to-classifier.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-relates-to-classifier",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-classifier",
  "version" : "0.2.0",
  "name" : "RelatesToClassifier",
  "title" : "RelatesTo Classifier",
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
  "description" : "This extension defines a classification for the 'relatesTo' relationship using a CodeableConcept.",
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
      "expression" : "Composition.relatesTo"
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
        "short" : "RelatesTo Classifier",
        "definition" : "This extension defines a classification for the 'relatesTo' relationship using a CodeableConcept."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-classifier"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ]
      }
    ]
  }
}

```
