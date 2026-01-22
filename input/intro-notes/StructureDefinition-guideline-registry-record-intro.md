{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Guideline Registry Record** containing metadata and registry-specific information for a clinical practice guideline. It serves as the base profile for AWMF guideline classification levels (S1, S2e, S2k, S3).

#### Overview

The Guideline Registry Record captures comprehensive metadata about a guideline's lifecycle, including registration, consultation, publication, and validity dates, as well as authorship, contact information, and related documents.

#### Key Elements

##### Status and Workflow

The `status` element tracks the workflow state of the guideline from registration to publication:
- `registered` – Initial registration
- `preliminary` – Consultation phase
- `final` – Published guideline
- `amended` – Updated version

##### Required Dates and Extensions

The profile defines several important date-related extensions:

| Extension | Description | Required When |
|-----------|-------------|---------------|
| `approvalDate` | Date the guideline was approved | Always |
| `lastReviewDate` | Date of last update | Always |
| `effectivePeriod` | Valid until date | Always (end date required) |
| `publicationDate` | Date published in current version | Always |
| `firstPublicationDate` | Initial publication date | Optional |
| `submissionDate` | Date submitted for publication | Optional |
| `consultationPeriod` | Open for consultation period | Required if `status = #preliminary` |
| `plannedCompletionDate` | Expected completion date | Required if `status = #registered` |
| `registrationDate` | Registration submission date | Optional |

##### Identifiers

Each guideline must have exactly one official identifier. The AWMF register number uses the system `http://fhir.awmf.org/guidelines`:

```fsh
* identifier[awmf-register-number]
  * system = "http://fhir.awmf.org/guidelines"
  * value = "XXX-XXX"
  * use = #official
```

##### Versioning

Versions must follow the major.minor format (e.g., "2.0", "1.1"):

```fsh
* version = "2.0"
```

##### Authors and Roles

Authors must reference `GuidelineAuthorRole` or `Organization` with a required role extension:

```fsh
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
```

Available roles include: `registrant`, `leading`, `contributing`, `coordinator`.

**Constraints:**
- Exactly one author with role `registrant` is required
- Authors with `leading` or `contributing` roles must be Organizations
- `leading` and `contributing` roles are mutually exclusive for the same author

##### Contact Information (Extended Contact Slices)

The profile provides pre-defined contact slices:

```fsh
* extension[extendedContactDetail][registrant].valueExtendedContactDetail
  * purpose = cs-contact-point#registrant
  * name = "Dr. Jane Smith"
  * telecom[+].value = "jane.smith@example.org"

* extension[extendedContactDetail][coordinator].valueExtendedContactDetail
  * purpose = cs-contact-point#coordinator
  * name = "Coordination Office"

* extension[extendedContactDetail][mainContact].valueExtendedContactDetail
  * purpose = cs-contact-point#contact
  * name = "Main Contact"
```

##### AWMF Attestation

To document AWMF quality assurance:

```fsh
* attester[AWMF]
  * mode = #official
  * party.reference = "Organization/AWMF"
  * time = "2025-03-06T00:00:00+01:00"
```

##### Related Guidelines and Documents

Use `relatesTo` slices to link to related content:

```fsh
// Related guideline
* relatesTo[relatedGuideline]
  * type = #similar-to
  * extension[classifier].valueCodeableConcept = cs-related-artifact-types#related-guideline

// Dissemination website
* relatesTo[disseminationWebsite]
  * type = #documentation
  * targetUri = "https://register.awmf.org/..."

// Replaces previous version
* relatesTo[replacesGuideline]
  * type = #replaces
  * targetReference = Reference(OldGuideline)
```

##### Sections

The profile defines structured sections for:
- **Summary** – Including intention, target patient group, care setting, keywords
- **Attachments** – Long/short versions, evidence reports, patient versions
- **Consensus Protocol** – Documentation of the consensus process

##### Release Type (for Registered Guidelines)

When `status = #registered`, a release type tag is required:

```fsh
* meta.tag[guideline-releaseType] = cs-guideline-release-type#new-guideline "New Guideline"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
