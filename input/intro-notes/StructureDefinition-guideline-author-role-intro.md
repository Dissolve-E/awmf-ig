{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Guideline Author Role** – the role of an author in the context of a specific guideline, including their time period of involvement.

#### Overview

The `GuidelineAuthorRole` links a `GuidelineAuthor` (person) to an organization and specifies the time period during which they participated in guideline development. This allows tracking of who contributed to a guideline and in what capacity.

#### Key Elements

##### Period (Required)

The time period during which the author was involved:

```fsh
* period
  * start = "2022-08-01"
  * end = "2023-12-31"
```

##### Practitioner Reference

Links to the actual person (GuidelineAuthor):

```fsh
* practitioner = Reference(MyGuidelineAuthor)
```

##### Organization

The organization the author was affiliated with during their contribution:

```fsh
* organization = Reference(MyMedicalSociety)
```

##### Role Description

Use the `code` element to describe the author's specific role:

```fsh
* code.text = "Coordination and scientific leadership"
```

#### Usage in Guidelines

When referencing authors in a guideline or registry record, the author reference should point to `GuidelineAuthorRole`, with an additional extension specifying their formal role in the guideline development:

```fsh
// In the guideline:
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
```

Available formal roles include:
- `registrant` – The person who registered the guideline
- `leading` – Leading author (organization-level)
- `contributing` – Contributing author (organization-level)
- `coordinator` – Coordination role

#### Example Usage

```fsh
Instance: MyAuthorRole
InstanceOf: guideline-author-role
Usage: #example
* practitioner = Reference(DrSmith)
* organization = Reference(GermanSurgicalSociety)
* period
  * start = "2022-08-01"
  * end = "2023-12-31"
* code.text = "Methodology expert and systematic review lead"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
