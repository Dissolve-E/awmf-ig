{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension specifies **medical subject categories** (broad discipline areas) related to an organization.

#### Overview

Medical subject categories represent broad groupings of medical disciplines. This extension is used to classify medical societies and organizations by their primary areas of focus.

#### Context

This extension can be applied to `Organization` resources.

#### Value Type

The value is a `CodeableConcept` bound to the medical subject categories value set:

```fsh
* value[x] only CodeableConcept
* valueCodeableConcept.coding from vs-medical-subject-categories (required)
```

#### Related Extension

- `medicalSubject` – More specific subject areas within a category

#### Example Usage

```fsh
// Assign multiple categories:
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#psychosocial "Psychosocial Disciplines"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
