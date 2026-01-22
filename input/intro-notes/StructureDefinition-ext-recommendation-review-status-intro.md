{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **status of a recommendation in the context of an updated guideline version**, along with an optional explanatory text.

#### Overview

When guidelines are updated, recommendations may be added, modified, reviewed without changes, or reaffirmed. This extension tracks how each recommendation evolved between versions.

#### Context

This extension can be applied to any `Element` (typically recommendations).

#### Structure

The extension contains two sub-extensions:

| Extension | Cardinality | Type | Description |
|-----------|-------------|------|-------------|
| `review-status` | 1..1 | CodeableConcept | Status code from the review status value set |
| `review-status-text` | 0..1 | string | Optional explanation of the status |

#### Available Status Codes

Typical values include:
- `new` – New recommendation in this version
- `updated` – Recommendation has been modified
- `reviewed` – Recommendation was reviewed but not changed
- `reaffirmed` – Recommendation explicitly confirmed without changes

#### Example Usage

```fsh
* extension[reviewStatus]
  * extension[review-status].valueCodeableConcept from vs-recommendation-review-status (required)
  * extension[review-status].valueCodeableConcept = #updated
  * extension[review-status-text].valueString = "Updated based on new RCT evidence published in 2024"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
