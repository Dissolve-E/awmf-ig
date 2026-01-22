{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Patient Organization** – an organization that represents patients and patient interests in the guideline development process.

#### Overview

Patient organizations play an important role in ensuring that guidelines reflect patient perspectives and priorities. This profile provides a standardized way to identify and reference such organizations.

#### Key Elements

##### Organization Type

The `type` element is required and fixed to identify the organization as a patient organization:

```fsh
* type = cs-awmf#patient-organization
```

#### Example Usage

```fsh
Instance: PatientOrgExample
InstanceOf: patient-organization
Usage: #example
* name = "German Patient Alliance for [Condition]"
* type = cs-awmf#patient-organization
* contact.telecom
  * system = #url
  * value = "https://www.patient-alliance-example.org"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
