# Section Intended Audience - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Section Intended Audience**

## Extension: Section Intended Audience 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:SectionIntendedAudience |

This extension allows for the indication of the target audience for the section

The SectionIntendedAudience extension is used to indicate the intended audience for the section.

**Context of Use**

### Guidance

This extension indicates the **intended audience for a section** within a guideline or recommendation.

#### Overview

Different sections of a guideline may be targeted at different audiences (e.g., clinicians, patients, policymakers). This extension allows specifying who the content is aimed at.

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a `CodeableConcept` bound to the intended audience value set:

```
* value[x] only CodeableConcept
* valueCodeableConcept from vs-intended-audience (required)

```

#### Example Usage

```
// In a recommendation section:
* section[recommendationStatement]
  * extension[intendedAudience][+].valueCodeableConcept = #healthcare-professionals
  * extension[intendedAudience][+].valueCodeableConcept = #patients

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Recommendation](StructureDefinition-recommendation.md)
* Examples for this Extension: [Composition/RecommendationExample](Composition-RecommendationExample.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-section-intended-audience)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-section-intended-audience.csv), [Excel](StructureDefinition-ext-section-intended-audience.xlsx), [Schematron](StructureDefinition-ext-section-intended-audience.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-section-intended-audience",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience",
  "version" : "0.2.0",
  "name" : "SectionIntendedAudience",
  "title" : "Section Intended Audience",
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
  "description" : "This extension allows for the indication of the target audience for the section",
  "purpose" : "The SectionIntendedAudience extension is used to indicate the intended audience for the section.",
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
        "short" : "Intended Audience",
        "definition" : "Target audience for the section",
        "comment" : "Indicates who the content of the section is aimed at"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-intended-audience"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-intended-audience"
        }
      }
    ]
  }
}

```
