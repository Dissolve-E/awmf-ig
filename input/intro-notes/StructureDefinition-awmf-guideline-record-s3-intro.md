{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **AWMF S3 Guideline Registry Record** based on systematic evidence review and structured consensus by a representative panel. S3 guidelines are "Evidence- and consensus-based Guidelines" – the highest quality level in the AWMF classification system.

#### Overview

S3 guidelines are characterized by:
- Systematic evidence review (like S2e)
- Structured consensus process by a representative panel (like S2k)
- Combination of both evidence-based and consensus-based methodology
- Highest methodological quality standard

This profile inherits from `AWMFGuidelineRegistryRecord` and pre-sets the guideline classification to S3.

#### Key Element: Guideline Classification

The `category[awmfGuidelineClass]` is fixed to the S3 classification:

```fsh
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S3 "Evidence- and consensus-based guideline"
```

#### Example Usage

```fsh
Instance: MyS3Guideline
InstanceOf: awmf-guideline-record-s3
Usage: #example
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "S3 Guideline for [Topic]"
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
