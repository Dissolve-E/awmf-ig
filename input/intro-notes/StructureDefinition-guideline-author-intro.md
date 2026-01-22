{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Guideline Author** – a person who authored or contributed to a clinical practice guideline.

#### Overview

Guideline authors are typically healthcare professionals, researchers, or methodologists who contribute to guideline development. This profile captures basic identifying and contact information for these individuals.

#### Key Elements

##### Name (Required)

The author's name must be provided:

```fsh
* name
  * family = "Smith"
  * given = "John"
```

##### Contact Information (Optional)

Telecom details for reaching the author:

```fsh
* telecom
  * system = #phone
  * value = "555-555-5555"
* telecom
  * system = #email
  * value = "john.smith@example.org"
```

#### Relationship to GuidelineAuthorRole

While `GuidelineAuthor` captures the person's identity, the `GuidelineAuthorRole` profile captures their role in a specific guideline (e.g., coordinator, scientific lead) and the time period of their involvement.

When referencing authors in a guideline, use `GuidelineAuthorRole` which in turn references the `GuidelineAuthor`:

```fsh
Instance: AuthorRoleExample
InstanceOf: guideline-author-role
* practitioner = Reference(MyGuidelineAuthor)
* organization = Reference(AuthorOrganization)
* period.start = "2022-08-01"
* period.end = "2023-12-31"
```

#### Example Usage

```fsh
Instance: GuidelineAuthorExample
InstanceOf: guideline-author
Usage: #example
* name
  * family = "Müller"
  * given = "Anna"
  * prefix = "Prof. Dr. med."
* telecom[+]
  * system = #email
  * value = "anna.mueller@university-hospital.de"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
