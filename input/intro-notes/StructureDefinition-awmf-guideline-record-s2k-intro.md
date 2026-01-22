{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **AWMF S2k Guideline Registry Record** based on structured consensus by a representative panel. S2k guidelines are "Consensus-based Guidelines" that rely on formal consensus methods.

#### Overview

S2k guidelines are characterized by:
- Structured consensus process by a representative panel
- Formal consensus methodology
- Involvement of relevant stakeholders and experts

This profile inherits from `AWMFGuidelineRegistryRecord` and pre-sets the guideline classification to S2k.

#### Key Element: Guideline Classification

The `category[awmfGuidelineClass]` is fixed to the S2k classification:

```fsh
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S2k "Consensus-based Guideline"
```

#### Example Usage

```fsh
Instance: MyS2kGuideline
InstanceOf: awmf-guideline-record-s2k
Usage: #example
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "S2k Guideline for [Topic]"
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
