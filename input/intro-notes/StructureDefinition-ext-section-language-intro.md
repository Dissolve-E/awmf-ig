{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **language of a section's content**.

#### Overview

When guidelines contain content in multiple languages, this extension allows specifying the language of each section or subsection independently.

#### Context

This extension can be applied to any `Element` (typically Composition sections).

#### Value Type

The value is a language code following IETF BCP 47 standards:

```fsh
* value[x] only code
* value[x] from CommonLanguages (preferred)
```

#### Multi-Language Support

This implementation guide supports multi-language content through a language subsection pattern. Many sections have nested `section[language]` slices that allow the same content in different languages:

```fsh
* section[intention]
  * section[language][+]
    * extension[ext-section-language].valueCode = #de
    * text.div = "<div>German intention text...</div>"
  * section[language][+]
    * extension[ext-section-language].valueCode = #en
    * text.div = "<div>English intention text...</div>"
```

#### Example Usage

```fsh
* section.extension[ext-section-language].valueCode = #de
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
