{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

## Requirements for evidence ratings from Dissolve-E: 

* Capture information from difference rating and grading systems for guidelines, systematic reviews, and primary literature for the used evidence references, e.g.,  Cochrane RoB-Tool, AMSTAR 2, ROBIS, AGREE 2, Oxford2011




{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
