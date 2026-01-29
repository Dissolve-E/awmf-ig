# Section Language - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Section Language**

## Extension: Section Language 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:SectionLanguageExt |

This extension allows for the indication of the Language of the Section.

**Context of Use**

### Guidance

This extension indicates the **language of a section's content**.

#### Overview

When guidelines contain content in multiple languages, this extension allows specifying the language of each section or subsection independently.

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a language code following IETF BCP 47 standards:

```
* value[x] only code
* value[x] from CommonLanguages (preferred)

```

#### Multi-Language Support

This implementation guide supports multi-language content through a language subsection pattern. Many sections have nested `section[language]` slices that allow the same content in different languages:

```
* section[intention]
  * section[language][+]
    * extension[ext-section-language].valueCode = #de
    * text.div = "<div>German intention text...</div>"
  * section[language][+]
    * extension[ext-section-language].valueCode = #en
    * text.div = "<div>English intention text...</div>"

```

#### Example Usage

```
* section.extension[ext-section-language].valueCode = #de

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline](StructureDefinition-awmf-guideline.md), [Guideline Registry Record](StructureDefinition-guideline-registry-record.md) and [Recommendation](StructureDefinition-recommendation.md)
* Examples for this Extension: [Composition/NosokomialePneumonie](Composition-NosokomialePneumonie.md), [Composition/NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.md), [Composition/RecommendationCognitiveTestsWhenSuspectingDementia](Composition-RecommendationCognitiveTestsWhenSuspectingDementia.md), [Composition/RecommendationExample](Composition-RecommendationExample.md)... Show 4 more, [Composition/RecommendationHAPDiagnosis-A](Composition-RecommendationHAPDiagnosis-A.md), [Composition/RecommendationHAPDiagnosis-B](Composition-RecommendationHAPDiagnosis-B.md), [Composition/RecommendationHAPDiagnosis](Composition-RecommendationHAPDiagnosis.md) and [Composition/RecommendationMultiplexPCRDiagnostic](Composition-RecommendationMultiplexPCRDiagnostic.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-section-language)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-section-language.csv), [Excel](StructureDefinition-ext-section-language.xlsx), [Schematron](StructureDefinition-ext-section-language.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-section-language",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
  "version" : "0.2.0",
  "name" : "SectionLanguageExt",
  "title" : "Section Language",
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
  "description" : "This extension allows for the indication of the Language of the Section.",
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
      "expression" : "Element"
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
        "short" : "Language for the Section",
        "definition" : "The Language of the Section.",
        "comment" : "This is used where an item may repeat to indicate the language of each repeat.",
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
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
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
