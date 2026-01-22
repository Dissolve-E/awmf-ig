{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **intended audience for a section** within a guideline or recommendation.

#### Overview

Different sections of a guideline may be targeted at different audiences (e.g., clinicians, patients, policymakers). This extension allows specifying who the content is aimed at.

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a `CodeableConcept` bound to the intended audience value set:

```fsh
* value[x] only CodeableConcept
* valueCodeableConcept from vs-intended-audience (required)
```

#### Example Usage

```fsh
// In a recommendation section:
* section[recommendationStatement]
  * extension[intendedAudience][+].valueCodeableConcept = #healthcare-professionals
  * extension[intendedAudience][+].valueCodeableConcept = #patients
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
