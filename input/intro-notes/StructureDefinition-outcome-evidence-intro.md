{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents **Outcome Evidence** – evidence supporting a specific outcome within a body of clinical or scientific evidence.

#### Overview

Outcome evidence resources capture the quantitative or qualitative findings for specific clinical outcomes (e.g., mortality, quality of life, adverse events) from studies or systematic reviews.

#### Key Elements

##### Variable Definition (Required)

The `variableDefinition` element must include at least one outcome definition:

```fsh
* variableDefinition[outcome]
  * variableRole = #outcome
  * observed = Reference(OutcomeDefinition)
```

#### Relationship to Other Profiles

Outcome Evidence resources are:
- Assessed by [Evidence Overall Quality Assessment][SD:Evidence Overall Quality Assessment] profiles
- Referenced from [Recommendation Justification][SD:Recommendation Justification] to link evidence to recommendations
- Derived from PICO questions via the [Conceptual Cohort Definition Outcome][SD:Conceptual Cohort Definition Outcome] profile.

#### Example Usage

```fsh
Instance: MortalityEvidenceExample
InstanceOf: outcome-evidence
Usage: #example
* variableDefinition[outcome]
  * variableRole = #outcome
  * observed = Reference(MortalityOutcomeDefinition)
* statistic[+]
  * statisticType = #relative-risk
  * quantity.value = 0.85
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
