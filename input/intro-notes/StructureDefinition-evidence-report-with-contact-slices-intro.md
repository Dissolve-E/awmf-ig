{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This is an **intermediate technical profile** that handles re-slicing of the `extendedContactDetail` extension. It exists as a workaround for FHIR IG Publisher limitations.

#### Overview

This profile is not intended for direct use by implementers. It serves as an intermediate layer between the EBM Evidence Report and the `GuidelineRegistryRecord` profile.

#### Technical Background

The FHIR IG Publisher's snapshot generation algorithm enforces strict ordering rules for slices. When attempting to re-slice the parent's `extendedContactDetail` extension to create sub-slices (registrant, coordinator, mainContact), these new slices can cause ordering errors.

This intermediate profile isolates the re-slicing, allowing the main `GuidelineRegistryRecord` profile to inherit cleanly.

#### Contact Slices Defined

| Slice | Purpose | Description |
|-------|---------|-------------|
| `registrant` | Registrant contact | Person who registered the guideline |
| `coordinator` | Coordinator | Coordination contact |
| `mainContact` | Main contact | Primary contact for inquiries |

#### For Implementers

You should use the [Guideline Registry Record](StructureDefinition-guideline-registry-record.html) profile directly, which inherits from this profile and provides all the necessary functionality.

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
