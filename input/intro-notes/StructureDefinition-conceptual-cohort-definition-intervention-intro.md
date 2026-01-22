{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Conceptual Cohort Definition for Intervention** – a structured definition of the intervention (the "I" in PICO) as defined for a clinical question.

#### Overview

The intervention definition describes what treatment, procedure, or exposure is being evaluated in the clinical question.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as an intervention definition:

```fsh
* code = $cs-pico#intervention
```

#### Usage in PICO Questions

This profile is referenced from the [PICO Question](StructureDefinition-pico-question.html) profile:

```fsh
// In PICOQuestion:
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(MyInterventionDefinition)
```

#### Example Usage

```fsh
Instance: MetforminIntervention
InstanceOf: conceptual-cohort-definition-intervention
Usage: #example
* code = $cs-pico#intervention
* characteristic[+]
  * code.text = "Metformin therapy"
  * valueBoolean = true
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
