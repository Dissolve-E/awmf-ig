{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension provides **additional contact details** for individuals or organizations associated with an artifact (e.g., a clinical guideline, document, or composition).

#### Overview

The `ArtifactExtendedContact` extension allows capturing structured contact information including name, organization, telecom details, and address using the `ExtendedContactDetail` datatype.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The extension value must be an `ExtendedContactDetail`:

```fsh
* valueExtendedContactDetail 1..1
```

#### Example Usage

```fsh
* extension[ext-artifact-extended-contact].valueExtendedContactDetail
  * name = "Dr. Jane Smith"
  * organization = Reference(MyOrganization)
  * telecom[+]
    * system = #email
    * value = "jane.smith@example.org"
  * address
    * city = "Berlin"
    * country = "DE"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
