{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **AWMF S2e Guideline Registry Record** based on systematic literature search and evaluation. S2e guidelines are "Evidence-based Guidelines" that rely on a formal evidence review process.

#### Overview

S2e guidelines are characterized by:
- Systematic literature search and evaluation
- Evidence-based methodology
- Formal assessment of available scientific evidence

This profile inherits from `AWMFGuidelineRegistryRecord` and pre-sets the guideline classification to S2e.

#### Key Element: Guideline Classification

The `category[awmfGuidelineClass]` is fixed to the S2e classification:

```fsh
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S2e "Evidence-based Guideline"
```

#### Example Usage

```fsh
Instance: MyS2eGuideline
InstanceOf: awmf-guideline-record-s2e
Usage: #example
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "S2e Guideline for [Topic]"
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
