{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance


#### Representing AWMF Quality Assurance Assessment and Provenance

To document the quality assurance process carried out by the AWMF, we use the `attester` element in the `Guideline` profile. This structure enables linking the attesting party (the AWMF) and specifying their role in the guideline publication process.

The profile includes a named slice `attester[AWMF]` to record the attestation by the AWMF:

- `attester.mode` is set to `official`, indicating that the guideline has been formally attested by an authoritative body.
- `attester.party.reference` must point to the AWMF organization resource (typically `"Organization/AWMF"`).
- Standard FHIR elements `date` and `dateElement` can be used to record the date of attestation.

Example: Attestation by AWMF

```fsh
* attester[AWMF]
  * mode = $cs-composition-attestation-mode#official
  * party.reference = "Organization/AWMF"
  * time = "2025-03-06T00:00:00+01:00"
```

This example shows a guideline that was officially attested by the AWMF on March 6, 2025.

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
