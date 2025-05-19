{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

### Key Requirements taken into Account 

The guideline data model must be able to: 

### Structural Aspects 

* Represent guidelines in current document-based formats (i.e., PDFs) and fully digitally strucutured guidelines at the same time - and mixtures of both 

* Capture different variants of guidelines and supplementary content including long and short variants, patient information, evidence reports etc (list extensible). 

* Structure guidelines into sections 

* Allow multilingual content on all levels 


### Indentifiers, References, Versions 

* Have a unique, persistent, cross-version identifier while at the same time allowing for multiple identifers from different editing systems to be stored in parallel; the global ID of the resource itself (next to the aforementioned idenfiers) shall be assignable by the system originally creating the guideline instance.

* Include version information in the form major.minor 

* Allow deprecation 

* Represent provenance information regarding previous versions of the guideline, e.g., after changes in an identifer 


### Guideline Content 

* Store assessment information from the AWMF's quality assurance process, together with provenance information for the AWMF

* Cover all the guideline structured medatdata currently used by the AWMF, including various dates and publication status information 

* List AMWF member associations and other organisations leading or contributing to the guideline, as well as technical partners 

* Link to related guidelines  





{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
