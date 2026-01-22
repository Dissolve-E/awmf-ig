{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Conceptual Cohort Definition for Outcome** – a structured definition of the outcome (the "O" in PICO) as defined for a clinical question.

#### Overview

The outcome definition describes what clinical endpoints or results are being measured, such as mortality, morbidity, quality of life, adverse events, or other patient-relevant outcomes.

#### Key Elements

##### Code (Fixed)

The `code` element identifies this as an outcome definition:

```fsh
* code = $cs-pico#outcome
```

#### Usage in PICO Questions

Multiple outcomes can be defined for a single PICO question. This profile is referenced from the [PICO Question](StructureDefinition-pico-question.html) profile:

```fsh
// In PICOQuestion:
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(MortalityOutcome)
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(QualityOfLifeOutcome)
```

#### Relationship to Evidence Assessment

Outcome definitions are also referenced by [Certainty of Evidence Rating](StructureDefinition-certainty-of-evidence-rating.html) profiles when assessing the evidence for specific outcomes.

#### Example Usage

```fsh
Instance: AllCauseMortalityOutcome
InstanceOf: conceptual-cohort-definition-outcome
Usage: #example
* code = $cs-pico#outcome
* characteristic[+]
  * code.text = "All-cause mortality"
  * valueBoolean = true
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
