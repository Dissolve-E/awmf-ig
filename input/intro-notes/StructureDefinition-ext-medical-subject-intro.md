{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension specifies **medical subjects** (specific topic areas) related to an organization.

#### Overview

Medical subjects represent specific fields or topics within broader categories. For example, while a medical subject category might be "Surgical Disciplines", specific medical subjects could be "Cardiac Surgery" or "Orthopedic Surgery".

#### Context

This extension can be applied to `Organization` resources.

#### Value Type

The value is a `CodeableConcept` that can contain coded values or free text:

```fsh
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
```

#### Related Extension

- `medicalSubjectCategory` – Broader discipline categories

#### Example Usage

```fsh
// Using free text (when no standard code exists):
* extension[medicalSubject][+].valueCodeableConcept.text = "Anesthesiology and Intensive Care Medicine"

// Using coded value:
* extension[medicalSubject][+].valueCodeableConcept.coding
  * system = "http://example.org/medical-subjects"
  * code = #anesthesiology
  * display = "Anesthesiology"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
