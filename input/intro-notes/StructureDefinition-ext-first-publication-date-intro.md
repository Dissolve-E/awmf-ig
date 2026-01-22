{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **date when the guideline was first published** in its initial version.

#### Overview

The first publication date is distinct from subsequent publication dates of updated versions. It helps track the original release date of a guideline.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The value is a `date`:

```fsh
* value[x] only date
```

#### Related Extensions

- `publicationDate` – Date the current version was published
- `lastReviewDate` – Date of last content review

#### Example Usage

```fsh
* extension[firstPublicationDate].valueDate = "2018-06-15"
* extension[publicationDate].valueDate = "2023-03-01"  // Current version publication
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
