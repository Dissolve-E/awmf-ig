{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This extension indicates the **role of an author** in the context of guideline development.

#### Overview

Guideline authors can have different roles such as registrant, leading author, contributing author, or coordinator. This extension provides a coded classification of those roles.

#### Context

This extension can be applied to `Composition.author` elements.

#### Value Type

The value is a `CodeableConcept` bound to the guideline author role value set:

```fsh
* value[x] only CodeableConcept
* valueCodeableConcept from vs-guideline-author-role (extensible)
```

#### Available Roles

| Code | Description |
|------|-------------|
| `registrant` | Person who registered the guideline |
| `leading` | Leading author (organization-level) |
| `contributing` | Contributing author (organization-level) |
| `coordinator` | Coordination role |

#### Usage Notes

- Exactly **one author must have the role `registrant`**
- `leading` and `contributing` roles must reference Organizations
- `leading` and `contributing` are mutually exclusive for the same author

#### Example Usage

```fsh
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant

* author[+] = Reference(LeadOrganization)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#leading
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
