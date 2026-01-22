{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Internal Validity Assessment** – a structured assessment of the internal validity (risk of bias) of individual studies or systematic reviews.

#### Overview

This profile serves as the base for internal validity assessments using various risk of bias tools. It is used for assessing individual studies or systematic reviews, as opposed to overall evidence assessments which aggregate evidence.

#### Relationship to Other Profiles

- **Parent profile:** [Certainty of Evidence Rating](StructureDefinition-certainty-of-evidence-rating.html)
- **Child profiles:**
  - [Evidence Assessment ROBIS](StructureDefinition-evidence-assessment-robis.html) – For systematic reviews
  - [Evidence Assessment Cochrane RoB](StructureDefinition-evidence-assessment-cochrane-rob.html) – For RCTs
  - [Evidence Assessment AMSTAR 2](StructureDefinition-evidence-assessment-amstar2.html) – For systematic reviews
  - [Evidence Assessment AGREE II](StructureDefinition-evidence-assessment-agreeii.html) – For guidelines

#### Use Cases

1. **Single study assessment** – Assessing risk of bias for an individual RCT or observational study
2. **Systematic review quality** – Assessing methodological quality of a systematic review used as evidence
3. **Source guideline quality** – Assessing quality of an existing guideline used for adaptation

#### Example Usage

```fsh
Instance: InternalValidityExample
InstanceOf: evidence-internal-validity-assessment
Usage: #example
* artifactReference = Reference(MyStudyEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#CochraneRoB
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
