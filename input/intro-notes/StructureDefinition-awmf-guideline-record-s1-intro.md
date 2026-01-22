{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **AWMF S1 Guideline Registry Record** for expert recommendations developed through informal consensus. S1 guidelines represent "Action recommendations from expert groups" and are the simplest level in the AWMF classification system.

#### Overview

S1 guidelines are characterized by:
- Expert consensus without formal evidence-based methodology
- Informal agreement among specialists
- Recommendations based primarily on clinical experience

This profile inherits from `AWMFGuidelineRegistryRecord` and pre-sets the guideline classification to S1.

#### Key Element: Guideline Classification

The `category[awmfGuidelineClass]` is fixed to the S1 classification:

```fsh
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S1 "Action recommendations from expert groups"
```

#### Example Usage

```fsh
Instance: MyS1Guideline
InstanceOf: awmf-guideline-record-s1
Usage: #example
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "S1 Guideline for [Topic]"
* identifier[awmf-register-number]
  * use = #official
  * value = "XXX-XXX"
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
```

For detailed information on all available elements, please refer to the parent profile [Guideline Registry Record](StructureDefinition-guideline-registry-record.html).

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
