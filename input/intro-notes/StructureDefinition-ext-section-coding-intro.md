{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension allows **assigning a specific code to a section** within a Composition resource.

#### Overview

Section coding provides a standardized way to categorize or identify the content of sections, enabling better organization, searchability, and interoperability. It is particularly useful for sections that need coded values (e.g., care setting, care stage).

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a `CodeableConcept`:

```fsh
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
```

#### Use Cases

- **Care Setting**: Classify whether ambulatory, inpatient, or mixed
- **Care Stage**: Classify as prevention, diagnosis, therapy, etc.
- **Care Level**: Classify as primary care, specialist care, etc.

#### Example Usage

```fsh
// In a care setting section:
* section[careSetting]
  * section[careSetting]
    * extension[value].valueCodeableConcept from vs-encounter-type (extensible)
  * section[careStage]
    * extension[value].valueCodeableConcept from vs-care-stage (extensible)
  * section[careLevel]
    * extension[value].valueCodeableConcept from vs-care-level (extensible)
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
