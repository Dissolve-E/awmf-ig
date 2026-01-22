{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **PICO Question** – a structured definition of the clinical question in the context of guidelines and recommendations using the Population, Intervention, Comparator, and Outcome (PICO) framework.

#### Overview

PICO questions are fundamental to evidence-based medicine and guideline development. They structure clinical questions in a way that facilitates systematic literature searches and evidence evaluation.

#### Key Elements

##### Question Code

The `code` element identifies this as a PICO question:

```fsh
* code = $cs-pico#pico-question
```

##### Combination Method

All characteristics must be present together (logical AND):

```fsh
* combinationMethod = $cs-group-characteristic-combination#all-of
```

##### PICO Characteristics

The profile provides slices for each PICO component:

**Population (P)** – Who is affected?
```fsh
* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(PopulationDefinition)
```

**Intervention (I)** – What is being evaluated?
```fsh
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(InterventionDefinition)
```

**Comparator (C)** – What is the alternative?
```fsh
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(ComparatorDefinition)
```

**Outcome (O)** – What are the relevant outcomes? (can have multiple)
```fsh
* characteristic[outcome]
  * code = $cs-pico#outcome
  * valueReference = Reference(OutcomeDefinition)
```

##### Value Types

Each characteristic supports multiple value types:
- `CodeableConcept` – Coded values
- `Reference` – References to detailed definitions
- `Expression` – Formal expressions

#### Linking to Recommendations

PICO questions can be linked to recommendations using the `relatesTo[picoQuestion]` slice in the Recommendation profile:

```fsh
// In the Recommendation instance:
* relatesTo[picoQuestion]
  * type = #derived-from
  * targetReference = Reference(MyPICOQuestion)
```

#### Example Usage

```fsh
Instance: PICOQuestionExample
InstanceOf: pico-question
Usage: #example
* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(AdultPatientPopulation)
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(DrugAIntervention)
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(PlaceboComparator)
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(MortalityOutcome)
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(QualityOfLifeOutcome)
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
