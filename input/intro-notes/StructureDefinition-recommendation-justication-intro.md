{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance


## Requirements for evidence ratings from Dissolve-E: 

The recommendation justification is the boiler plate for linking evidence and evidence-to-decision information to a recommendation. In terms of Dissolve-E requirements, it shall allow to: 

* Link the underlying evidence to each recommendation 

* Describe evidence-to-decision data for how the recommendation was derived from the evidence, e.g. via GRADE

* Capture consensus information leading to the recommendation 

* Flag missing evidence for specific questions or topics

* Include conflict of interest information 




{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
