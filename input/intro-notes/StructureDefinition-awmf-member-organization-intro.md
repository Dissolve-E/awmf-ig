{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance


#### Representing AWMF Member Organizations

Medical associations that are members of the AWMF are each assigned a unique **association number**, typically a 3-character code. These organizations should be modeled using the `AWMFMemberOrganization` profile, which enforces the presence of this identifier and distinguishes the organization as a member.

The identifier must use the fixed system URI and must be marked as the official identifier. The type of the organization must explicitly reflect its AWMF membership by using a designated coding:

```
* system = "http://fhir.awmf.org/association"
* use = #official
* type = cs-awmf#awmf-member-organization
```

This ensures clarity and consistency in downstream systems and supports clear separation between member and non-member organizations.

Here is a complete example of how to define an AWMF member organization in FHIR Shorthand (FSH):

```
Instance: ExampleAWMFMemberOrg
InstanceOf: awmf-member-organization
* name = "German Society of Example Medicine"
* identifier[awmf-association-number]
  * system = "http://fhir.awmf.org/association"
  * value = "123"
  * use = #official
* type = cs-awmf#awmf-member-organization
* contact.telecom
  * system = #url
  * value = "https://www.example-med.org"
```

Important:
The information about whether an organization is (currently or historically) a member of the AWMF is stored **only** in the `Organization` resource. This information is **not duplicated** in the guideline itself, even if that organization contributed to the development of the guideline.

To represent that the AWMF itself is the official publishing authority for a guideline, the following structure is used in the `Composition.attester`:

```
* attester[+]
  * mode = #official
  * party = Reference(AWMF)
```

This separation ensures that the provenance and role of organizations are cleanly modeled, and avoids redundancy between metadata and contributor definitions.



{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
