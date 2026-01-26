{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents an **Evidence Assessment using Oxford 2011 (OCEBM)** – a structured assessment of the certainty of evidence for a specific outcome using the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence.

#### Overview

The Oxford 2011 system (OCEBM 2011) provides a framework for grading evidence based on study design and question type. It is commonly used in clinical practice guidelines, particularly in German-speaking countries.

#### Key Elements

##### Rating System (Required)

The rating system is fixed to Oxford 2011:

```fsh
* content[ratingSystem]
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier = $cs-evidence-rating-system#OCEBM2011 "Oxford 2011 (OCEBM)"
```

#### Current Implementation

Currently, this profile only implements specification of the rating system used. Detailed domain-level ratings and the overall Oxford score may be added in future versions.

#### Example Usage

```fsh
Instance: Oxford2011EvidenceExample
InstanceOf: evidence-assessment-oxford2011
Usage: #example
* artifactReference = Reference(MyOutcomeEvidence)
* workflowStatus = #applied
* content[ratingSystem].classifier = $cs-evidence-rating-system#OCEBM2011 "Oxford 2011 (OCEBM)"
```

For the base profile structure, see [Evidence Overall Quality Assessment][SD:Evidence Overall Quality Assessment].

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
