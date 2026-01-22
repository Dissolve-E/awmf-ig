{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **date when the current version of the guideline was published**.

#### Overview

The publication date refers to when the current version of the guideline was released. This is distinct from the first publication date (initial release) and the modification date (technical changes).

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```fsh
* value[x] only date
```

#### Related Extensions

- `firstPublicationDate` – Date of initial publication (first version)
- `lastReviewDate` – Date of last content review
- `approvalDate` – Date of formal approval

#### Example Usage

```fsh
* extension[publicationDate].valueDate = "2025-03-01"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
