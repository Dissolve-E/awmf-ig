# First Publication Date - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **First Publication Date**

## Extension: First Publication Date 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:FirstPublicationDate |

This extension allows for the indication of the date when the guideline was first published.

The FirstPublicationDate extensions allows to indicate the date when the guideline was first published.

**Context of Use**

### Guidance

This extension indicates the **date when the guideline was first published** in its initial version.

#### Overview

The first publication date is distinct from subsequent publication dates of updated versions. It helps track the original release date of a guideline.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```
* value[x] only date

```

#### Related Extensions

* `publicationDate` – Date the current version was published
* `lastReviewDate` – Date of last content review

#### Example Usage

```
* extension[firstPublicationDate].valueDate = "2018-06-15"
* extension[publicationDate].valueDate = "2023-03-01"  // Current version publication

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline](StructureDefinition-awmf-guideline.md) and [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Extension: [Composition/NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-first-publication-date)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-first-publication-date.csv), [Excel](StructureDefinition-ext-first-publication-date.xlsx), [Schematron](StructureDefinition-ext-first-publication-date.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-first-publication-date",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date",
  "version" : "0.2.0",
  "name" : "FirstPublicationDate",
  "title" : "First Publication Date",
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
  "description" : "This extension allows for the indication of the date when the guideline was first published.",
  "purpose" : "The FirstPublicationDate extensions allows to indicate the date when the guideline was first published.",
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
        "short" : "First Publication Date",
        "definition" : "The date when the guideline was first published.",
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
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date"
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
