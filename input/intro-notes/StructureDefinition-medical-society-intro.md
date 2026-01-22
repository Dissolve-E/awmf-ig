{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Medical Society** – an organization involved in the development or endorsement of clinical practice guidelines.

#### Overview

Medical societies are professional organizations that bring together healthcare professionals in specific medical disciplines. This profile extends the base `Organization` resource to capture additional information relevant for guideline authorship.

#### Key Elements

##### Organization Type

The `type` element is fixed to identify the organization as a medical society:

```fsh
* type = cs-awmf#medical-society
```

##### Medical Subject Category

Use the `medicalSubjectCategory` extension to specify the discipline(s) the society represents:

```fsh
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#psychosocial "Psychosocial Disciplines"
```

##### Medical Subject

Use the `medicalSubject` extension for more specific subject areas:

```fsh
* extension[medicalSubject][+].valueCodeableConcept.text = "Anesthesiology and Intensive Care Medicine"
```

##### Organization Branding

The `brand` extension allows for logo and visual identity information:

```fsh
* extension[brand].extension[brandLogo].valueUrl = "https://www.example.org/logo.png"
```

##### Organization Period

Document the active period of the organization:

```fsh
* extension[organizationPeriod].valuePeriod.start = "2000-01-01"
* extension[organizationPeriod].valuePeriod.end = "2050-12-31"
```

#### Example Usage

```fsh
Instance: MySociety
InstanceOf: medical-society
Usage: #example
* name = "German Society for Example Medicine"
* contact.telecom
  * system = #url
  * value = "https://www.example-society.org"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubject][+].valueCodeableConcept.text = "Example Surgery"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
