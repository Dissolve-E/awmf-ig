# Author Language - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Author Language**

## Extension: Author Language 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-author-language | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:AuthorLanguage |

This extension allows for the specification of the language(s) the author contributed to a section in a FHIR Composition.

**Context of Use**

### Guidance

This extension specifies the **language(s) contributed by an author** to content in a Composition section.

#### Overview

When authors contribute content in multiple languages or when clarification is needed about which language content was authored in, this extension provides that information.

#### Context

This extension can be applied to `Reference` elements (typically author references).

#### Value Type

The value is a language code following IETF BCP 47 standards:

```
* value[x] only code
* value[x] from CommonLanguages (preferred)

```

#### Example Usage

```
// In a Composition section author reference:
* author.extension[ext-author-language].valueCode = #de

// For multilingual contributions:
* author[0].extension[ext-author-language].valueCode = #de
* author[1].extension[ext-author-language].valueCode = #en

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-author-language)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-author-language.csv), [Excel](StructureDefinition-ext-author-language.xlsx), [Schematron](StructureDefinition-ext-author-language.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-author-language",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-author-language",
  "version" : "0.2.0",
  "name" : "AuthorLanguage",
  "title" : "Author Language",
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
  "description" : "This extension allows for the specification of the language(s) the author contributed to a section in a FHIR Composition.",
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
      "expression" : "Reference"
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
        "short" : "Language(s) used by the author",
        "definition" : "Indicates the language(s) contributed by the author for content in a Composition section.",
        "comment" : "Use when an author contributes content in multiple languages or to clarify which languages were authored.",
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
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-author-language"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "code"
          }
        ],
        "binding" : {
          "extension" : [
            {
              "url" : "http://hl7.org/fhir/tools/StructureDefinition/binding-definition",
              "valueMarkdown" : "A human language."
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet",
              "valueCanonical" : "http://hl7.org/fhir/ValueSet/all-languages"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName",
              "valueString" : "Language"
            },
            {
              "url" : "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding",
              "valueBoolean" : true
            }
          ],
          "strength" : "preferred",
          "description" : "IETF language tag",
          "valueSet" : "http://hl7.org/fhir/ValueSet/languages"
        }
      }
    ]
  }
}

```
