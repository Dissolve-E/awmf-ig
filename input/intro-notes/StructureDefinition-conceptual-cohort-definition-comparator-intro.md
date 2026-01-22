{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Conceptual Cohort Definition for Comparator** – a structured definition of the comparator (the "C" in PICO) as defined for a clinical question.

#### Overview

The comparator definition describes the alternative treatment, placebo, or standard of care against which the intervention is being compared.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as a comparator definition:

```fsh
* code = $cs-pico#comparator
```

#### Usage in PICO Questions

This profile is referenced from the [PICO Question](StructureDefinition-pico-question.html) profile:

```fsh
// In PICOQuestion:
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(MyComparatorDefinition)
```

#### Example Usage

```fsh
Instance: PlaceboComparator
InstanceOf: conceptual-cohort-definition-comparator
Usage: #example
* code = $cs-pico#comparator
* characteristic[+]
  * code.text = "Placebo"
  * valueBoolean = true
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
