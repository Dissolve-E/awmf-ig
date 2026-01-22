{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **period during which the guideline is open for consultation**.

#### Overview

During guideline development, there is typically a consultation phase where external stakeholders can provide feedback. This extension captures the start and end dates of that period.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `Period` with start and end dates:

```fsh
* value[x] only Period
```

#### Usage Note

In the `GuidelineRegistryRecord` profile, this extension is **required when status = `#preliminary`** (indicating consultation phase).

#### Example Usage

```fsh
* extension[consultationPeriod].valuePeriod
  * start = "2025-01-15"
  * end = "2025-03-15"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
