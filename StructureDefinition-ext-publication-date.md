# Publication Date - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Publication Date**

## Extension: Publication Date 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-publication-date | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:PublicationDate |

This extensions allows for the indication of the date when the guideline was published.

The PublicationDate extension allows to indicate the date when the guideline was published.

**Context of Use**

### Guidance

This extension indicates the **date when the current version of the guideline was published**.

#### Overview

The publication date refers to when the current version of the guideline was released. This is distinct from the first publication date (initial release) and the modification date (technical changes).

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```
* value[x] only date

```

#### Related Extensions

* `firstPublicationDate` – Date of initial publication (first version)
* `lastReviewDate` – Date of last content review
* `approvalDate` – Date of formal approval

#### Example Usage

```
* extension[publicationDate].valueDate = "2025-03-01"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-publication-date)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-publication-date.csv), [Excel](StructureDefinition-ext-publication-date.xlsx), [Schematron](StructureDefinition-ext-publication-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-publication-date",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-publication-date",
  "version" : "0.2.0",
  "name" : "PublicationDate",
  "title" : "Publication Date",
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
  "description" : "This extensions allows for the indication of the date when the guideline was published.",
  "purpose" : "The PublicationDate extension allows to indicate the date when the guideline was published.",
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
        "short" : "Publication Date",
        "definition" : "The date when the guideline was published.",
        "max" : "1"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-publication-date"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "date"
          }
        ]
      }
    ]
  }
}

```
