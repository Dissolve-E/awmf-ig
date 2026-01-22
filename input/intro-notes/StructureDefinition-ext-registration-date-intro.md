{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **date when the guideline project was registered**.

#### Overview

The registration date marks when the guideline development project was formally registered with the AWMF or another guideline registry.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```fsh
* value[x] only date
```

#### Example Usage

```fsh
* extension[registrationDate].valueDate = "2023-01-15"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
