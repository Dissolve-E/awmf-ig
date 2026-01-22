{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension defines a **classification for the `relatesTo` relationship** using a `CodeableConcept`.

#### Overview

When linking related artifacts (guidelines, documents, websites), the `relatesTo.type` provides the basic relationship type (e.g., `similar-to`, `documentation`). This extension provides an additional layer of classification to specify the nature of the related item more precisely.

#### Context

This extension can be applied to `Composition.relatesTo` elements.

#### Value Type

The value is a `CodeableConcept`:

```fsh
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
```

#### Example Usage

```fsh
// Classify a related guideline:
* relatesTo[relatedGuideline]
  * type = #similar-to
  * extension[classifier].valueCodeableConcept = cs-related-artifact-types#related-guideline

// Classify a dissemination website:
* relatesTo[disseminationWebsite]
  * type = #documentation
  * extension[classifier].valueCodeableConcept from vs-dissemination-website (required)
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
