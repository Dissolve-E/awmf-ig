{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension specifies the **language(s) contributed by an author** to content in a Composition section.

#### Overview

When authors contribute content in multiple languages or when clarification is needed about which language content was authored in, this extension provides that information.

#### Context

This extension can be applied to `Reference` elements (typically author references).

#### Value Type

The value is a language code following IETF BCP 47 standards:

```fsh
* value[x] only code
* value[x] from CommonLanguages (preferred)
```

#### Example Usage

```fsh
// In a Composition section author reference:
* author.extension[ext-author-language].valueCode = #de

// For multilingual contributions:
* author[0].extension[ext-author-language].valueCode = #de
* author[1].extension[ext-author-language].valueCode = #en
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
