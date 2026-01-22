{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an evidence assessment using **ROBIS (Risk of Bias in Systematic Reviews)**.

#### Note

This file appears to be a duplicate or alternative naming. Please refer to [Evidence Assessment ROBIS](StructureDefinition-evidence-assessment-robis.html) for the main documentation.

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
