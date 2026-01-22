{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension defines a **human-readable label for the `relatesTo` relationship**.

#### Overview

When linking to related artifacts, this extension allows adding a descriptive label that can be displayed to users, making the relationship clearer and more informative.

#### Context

This extension can be applied to `Composition.relatesTo` elements.

#### Value Type

The value is a `string`:

```fsh
* value[x] only string
* valueString 1..1
```

#### Example Usage

```fsh
* relatesTo[similarTo]
  * type = #similar-to
  * extension[label].valueString = "English version of this guideline"
  * targetReference = Reference(EnglishGuideline)
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
