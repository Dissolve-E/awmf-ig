{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Conceptual Cohort Definition for Population** – a structured definition of the population (the "P" in PICO) as defined for a clinical question.

#### Overview

The population definition describes who the recommendation applies to, including inclusion and exclusion criteria, demographic characteristics, and clinical conditions.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as a population definition:

```fsh
* code = $cs-pico#population
```

#### Usage in PICO Questions

This profile is referenced from the [PICO Question](StructureDefinition-pico-question.html) profile:

```fsh
// In PICOQuestion:
* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(MyPopulationDefinition)
```

#### Example Usage

```fsh
Instance: AdultDiabetesPopulation
InstanceOf: conceptual-cohort-definition-population
Usage: #example
* code = $cs-pico#population
* characteristic[+]
  * code.text = "Adults with Type 2 Diabetes"
  * valueBoolean = true
* characteristic[+]
  * code.text = "Age"
  * valueRange.low.value = 18
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
