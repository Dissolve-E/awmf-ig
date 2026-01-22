{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

This profile represents a **Guideline Attachment** – a document or file attached to a clinical practice guideline, such as PDF versions, slide decks, patient information, or visual abstracts.

#### Overview

Guidelines often have multiple associated documents beyond the main text. This profile provides a standardized way to attach and categorize these supplementary materials.

#### Key Elements

##### Type (Required)

The `type` element is fixed to identify the resource as an attachment:

```fsh
* type = $cs-ebm-ig#attachments "Attachments"
```

##### Category (Required)

The `category` element specifies what type of content the attachment represents. Multiple categories can be assigned:

```fsh
* category[+] = cs-guideline-sections#long-version "Long Version"
* category[+] = cs-guideline-sections#patient-version "Patient Version"
* category[+] = cs-guideline-sections#visual-abstract "Visual Abstract"
* category[+] = cs-guideline-sections#slide-deck "Slide Deck"
```

Common categories include:
- `long-version` – Full guideline document
- `short-version` – Abbreviated version
- `guideline-report` – Methods/evidence report
- `evidence-report` – Systematic review evidence
- `implementation-guidance` – Implementation tools
- `decision-support` – Decision support materials
- `patient-version` – Patient-friendly version
- `slide-deck` – Presentation slides
- `visual-abstract` – Graphical summary

##### Status (Required)

The document status:

```fsh
* status = #current
```

##### Content

The actual attachment with its metadata:

```fsh
* content
  * attachment
    * title = "Patient Information Brochure"
    * language = #de
    * contentType = #application/pdf
    * url = "https://example.org/guideline-patient-version.pdf"
```

##### Tagging for Searchability

Use `meta.tag` to add keywords or topics for easier discovery:

```fsh
* meta
  * tag[+].display = "Cardiovascular Disease"
  * tag[+].display = "Diabetes"
```

#### Usage in Guideline Registry Records

Attachments are referenced from the guideline's attachment section:

```fsh
// In the guideline:
* section[attachments]
  * section[longVersion]
    * entry = Reference(MyLongVersionAttachment)
  * section[patientVersion]
    * entry = Reference(MyPatientVersionAttachment)
```

#### Example Usage

```fsh
Instance: PatientVersionPDF
InstanceOf: guideline-attachment
Usage: #example
* status = #current
* category[+] = cs-guideline-sections#patient-version "Patient Version"
* content
  * attachment
    * title = "Patienteninformation zur Leitlinie"
    * language = #de
    * contentType = #application/pdf
    * url = "https://register.awmf.org/assets/guidelines/XXX-XXX_Patienten.pdf"
```

{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
