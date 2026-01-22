{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **date when the guideline is planned to be completed**.

#### Overview

During the registration phase, guideline developers specify an expected completion date. This helps with planning and tracking guideline development progress.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```fsh
* value[x] only date
```

#### Usage Note

In the `GuidelineRegistryRecord` profile, this extension is **required when status = `#registered`**.

#### Example Usage

```fsh
* extension[plannedCompletionDate].valueDate = "2026-06-30"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
