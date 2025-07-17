{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Key Requirements taken into Account 

The recommendation data model must be able to: 

### Structural Aspects 

* Capture different variants of content including long and short variants, patient information, qualtity indicators, evidence-to-decision data, videos, images, etc (list extensible). 

* Include procedural linking between individual recommendations 

{% include multi-language.md %}


### Indentifiers, References, Versions 

* Allow identification of individual recommendations across guideline version 

* Allow referencing of individual recommendations and their respective content elements 

* Include version information in the form major.minor 

* Allow deprecation 

#### Represent provenance information regarding previous versions of the guideline, e.g., after changes in an identifer 

To represent the relationship between recommendation versions, such as updates, replacements, or discontinued predecessors, the `relatesTo` element is used.

You can indicate that a recommendation **replaces** a previous version or **is replaced by** a newer one using specific types and references:

```
* relatesTo[+]
  * type = #replaces
  * targetReference = Reference(Recommendation/021-001-old)

* relatesTo[+]
  * type = #replaced-with
  * targetReference = Reference(Recommendation/021-001-new)
```

These relationships ensure a clear lineage across updates and enable traceability in systems that aggregate or display recommendation.



### Guideline Content 

* Capture PICO criteria, both as text and via coded annotations, especially P and I

* Include multiple interventions, e.g. from network meta analysis 

* Differentiate patient sub-populations and their respective interventions 

* Allow terminological coding both on a keyword-type level and on a detailed, CDS-type level 

* Use codes from a variety of terminologies such as SNOMED-CT, ICD-10/11, LOINC, OPS, ATC etc 

* Include labels regarding intended target audience, recommendation type (diagnostic, therapeutic etc), topical relevance  for each content variant 

* Include labels describing the revision status of recommendations after a guideline update, i.e., *new*, *revised*, *confirmed after review* 






{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
