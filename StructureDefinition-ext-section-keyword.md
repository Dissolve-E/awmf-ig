# Section Keyword - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Section Keyword**

## Extension: Section Keyword 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:SectionKeyword |

This extension allows for the indication of keywords associated with the section

The SectionKeyword extension is used to capture keywords associated with the section.

**Context of Use**

### Guidance

This extension allows adding **keywords** to sections for improved searchability and categorization.

#### Overview

Keywords help identify the clinical concepts covered in a section. They can be coded using standard terminologies or provided as free text.

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a `CodeableConcept` with support for multiple coding systems:

```
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
  * coding contains
    icd10-gm 0..1 MS and
    sct 0..1 MS and
    loinc 0..1 MS and
    ops 0..1 MS and
    atc 0..1 MS and
    atcde 0..1 MS

```

#### Supported Code Systems

| | | |
| :--- | :--- | :--- |
| `icd10-gm` | ICD-10-GM | German modification of ICD-10 |
| `sct` | SNOMED CT | Systematized Nomenclature of Medicine |
| `loinc` | LOINC | Laboratory tests, clinical observations |
| `ops` | OPS | German procedure classification |
| `atc` | ATC | WHO Anatomical Therapeutic Chemical |
| `atcde` | ATC-DE | German ATC extension |

#### Example Usage

```
// In a population section:
* section[population]
  * section[language]
    * extension[keyword][+].valueCodeableConcept
      * coding[sct] = $sct#73211009 "Diabetes mellitus"
    * extension[keyword][+].valueCodeableConcept
      * coding[icd10-gm] = $icd10-gm#E11 "Type 2 diabetes mellitus"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md) and [Recommendation](StructureDefinition-recommendation.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-section-keyword)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-section-keyword.csv), [Excel](StructureDefinition-ext-section-keyword.xlsx), [Schematron](StructureDefinition-ext-section-keyword.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-section-keyword",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword",
  "version" : "0.2.0",
  "name" : "SectionKeyword",
  "title" : "Section Keyword",
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
  "description" : "This extension allows for the indication of keywords associated with the section",
  "purpose" : "The SectionKeyword extension is used to capture keywords associated with the section.",
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
        "short" : "Keyword",
        "definition" : "Keywords associated with the section",
        "comment" : "Keywords associated with the section"
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword"
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
      },
      {
        "id" : "Extension.value[x].coding",
        "path" : "Extension.value[x].coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:icd10-gm",
        "path" : "Extension.value[x].coding",
        "sliceName" : "icd10-gm",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:icd10-gm.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "patternUri" : "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
      },
      {
        "id" : "Extension.value[x].coding:sct",
        "path" : "Extension.value[x].coding",
        "sliceName" : "sct",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:sct.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "patternUri" : "http://snomed.info/sct"
      },
      {
        "id" : "Extension.value[x].coding:loinc",
        "path" : "Extension.value[x].coding",
        "sliceName" : "loinc",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:loinc.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "patternUri" : "http://loinc.org"
      },
      {
        "id" : "Extension.value[x].coding:ops",
        "path" : "Extension.value[x].coding",
        "sliceName" : "ops",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:ops.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "patternUri" : "http://fhir.de/CodeSystem/bfarm/ops"
      },
      {
        "id" : "Extension.value[x].coding:atc",
        "path" : "Extension.value[x].coding",
        "sliceName" : "atc",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:atc.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "patternUri" : "http://www.whocc.no/atc"
      },
      {
        "id" : "Extension.value[x].coding:atcde",
        "path" : "Extension.value[x].coding",
        "sliceName" : "atcde",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.value[x].coding:atcde.system",
        "path" : "Extension.value[x].coding.system",
        "min" : 1,
        "patternUri" : "http://fhir.de/CodeSystem/bfarm/atc"
      }
    ]
  }
}

```
