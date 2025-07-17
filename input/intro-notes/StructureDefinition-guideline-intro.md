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

{% include multi-language.md %}


### Identifiers, References, Versions

#### Required Official Identifier (e.g., AWMF Register Number)

Each guideline must have a unique, persistent identifier that is valid across versions and systems. To support referencing from external sources (such as the AWMF registry), **exactly one identifier must be marked as official** using `use = #official`.

The official identifier may, for example, be based on the AWMF register number using the following system:

```
* system = "http://fhir.awmf.org/guidelines"
```

However, other systems are allowed as well, as long as the identifier is appropriate and unique. The critical point is that one and only one identifier in the list must carry `use = #official`.

Additional identifiers from other systems (e.g., internal editing tools or publication platforms) can be included in parallel, using other `use` values such as `#secondary`.

Here is an example of how to define this in FHIR Shorthand (FSH) when creating a guideline instance:

```
* identifier[+]
  * system = "http://fhir.awmf.org/guidelines"
  * value = "021-001"
  * use = #official

* identifier[+]
  * system = "https://example.org/local-editing-system"
  * value = "guideline-local-xyz"
  * use = #secondary
```

This setup ensures that systems consuming the resource can clearly identify the authoritative identifier while still allowing flexibility for local or alternative identifiers. Validation will enforce that exactly one official identifier is present.



#### Versioning Using Major.Minor Scheme

Each guideline instance must include a `version` value that follows a **major.minor** pattern, such as `1.0`, `3.2`, or `12.1`. This ensures a consistent and machine-readable versioning system across implementations and updates.

The expected versioning strategy is explicitly declared using the `versionAlgorithm` extension:

```
* extension[versionAlgorithm].valueCoding = $cs-awmf#major-minor "Major-Minor Versioning"
```

A version is required and must pass a validation rule that ensures the correct format.

Here is an example of how to assign a valid version in FHIR Shorthand:

```
* version = "2.1"
* extension[versionAlgorithm].valueCoding = $cs-awmf#major-minor
```

This format supports both human understanding and automated comparison logic for version management.

#### Allowing Deprecation

To indicate that a guideline is no longer valid or recommended for use, the `status` element can be set to `#deprecated`.

This is useful for marking retired guidelines while keeping them in the ecosystem for reference, auditability, or archival purposes.

Example:

```
* status = #deprecated
```

This flag ensures consumers of the guideline (e.g., systems, registries, readers) are aware that the content is outdated and should no longer be applied in practice.

#### Tracking Previous or Replaced Versions

To represent the relationship between guideline versions, such as updates, replacements, or discontinued predecessors, the `relatesTo` element is used.

You can indicate that a guideline **replaces** a previous version or **is replaced by** a newer one using specific types and references:

```
* relatesTo[+]
  * type = #replaces
  * targetReference = Reference(Guideline/021-001-old)

* relatesTo[+]
  * type = #replaced-with
  * targetReference = Reference(Guideline/021-001-new)
```

These relationships ensure a clear lineage across updates and enable traceability in systems that aggregate or display guidelines.


### Guideline Content 

* Store assessment information from the AWMF's quality assurance process, together with provenance information for the AWMF



### Notes

- The attestation `time` can be used to reflect the official approval or publication date by the AWMF.
- This information is primarily relevant to registry publishers and consumers needing metadata about guideline provenance and validation.



* Cover all the guideline structured medatdata currently used by the AWMF, including various dates and publication status information 

* List AMWF member associations and other organisations leading or contributing to the guideline, as well as technical partners 

* Link to related guidelines





{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
