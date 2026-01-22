{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension allows adding **keywords** to sections for improved searchability and categorization.

#### Overview

Keywords help identify the clinical concepts covered in a section. They can be coded using standard terminologies or provided as free text.

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a `CodeableConcept` with support for multiple coding systems:

```fsh
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

| Slice | Code System | Description |
|-------|-------------|-------------|
| `icd10-gm` | ICD-10-GM | German modification of ICD-10 |
| `sct` | SNOMED CT | Systematized Nomenclature of Medicine |
| `loinc` | LOINC | Laboratory tests, clinical observations |
| `ops` | OPS | German procedure classification |
| `atc` | ATC | WHO Anatomical Therapeutic Chemical |
| `atcde` | ATC-DE | German ATC extension |

#### Example Usage

```fsh
// In a population section:
* section[population]
  * section[language]
    * extension[keyword][+].valueCodeableConcept
      * coding[sct] = $sct#73211009 "Diabetes mellitus"
    * extension[keyword][+].valueCodeableConcept
      * coding[icd10-gm] = $icd10-gm#E11 "Type 2 diabetes mellitus"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
