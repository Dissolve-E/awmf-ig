{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an evidence assessment using the **Oxford 2011 (OCEBM) Levels of Evidence**.

#### Note

This file appears to be a duplicate or alternative naming. Please refer to [Evidence Assessment Oxford 2011](StructureDefinition-evidence-assessment-oxford2011.html) for the main documentation.

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
