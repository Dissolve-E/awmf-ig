{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **date when the guideline was submitted** for publication or review.

#### Overview

The submission date records when a specific version of the guideline was submitted to the system or registry for processing and publication.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```fsh
* value[x] only date
```

#### Example Usage

```fsh
* extension[submissionDate].valueDate = "2025-02-15"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
