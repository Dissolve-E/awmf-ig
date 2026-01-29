# Guideline Attachment - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Attachment**

## Resource Profile: Guideline Attachment 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-attachment | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:GuidelineAttachment |

 
Attachment to a Clinical Practice Guideline 

### Guidance

This profile represents a **Guideline Attachment** – a document or file attached to a clinical practice guideline, such as PDF versions, slide decks, patient information, or visual abstracts.

#### Overview

Guidelines often have multiple associated documents beyond the main text. This profile provides a standardized way to attach and categorize these supplementary materials.

#### Key Elements

##### Type (Required)

The `type` element is fixed to identify the resource as an attachment:

```
* type = $cs-ebm-ig#attachments "Attachments"

```

##### Category (Required)

The `category` element specifies what type of content the attachment represents. Multiple categories can be assigned:

```
* category[+] = cs-guideline-sections#long-version "Long Version"
* category[+] = cs-guideline-sections#patient-version "Patient Version"
* category[+] = cs-guideline-sections#visual-abstract "Visual Abstract"
* category[+] = cs-guideline-sections#slide-deck "Slide Deck"

```

Common categories include:

* `long-version` – Full guideline document
* `short-version` – Abbreviated version
* `guideline-report` – Methods/evidence report
* `evidence-report` – Systematic review evidence
* `implementation-guidance` – Implementation tools
* `decision-support` – Decision support materials
* `patient-version` – Patient-friendly version
* `slide-deck` – Presentation slides
* `visual-abstract` – Graphical summary

##### Status (Required)

The document status:

```
* status = #current

```

##### Content

The actual attachment with its metadata:

```
* content
  * attachment
    * title = "Patient Information Brochure"
    * language = #de
    * contentType = #application/pdf
    * url = "https://example.org/guideline-patient-version.pdf"

```

##### Tagging for Searchability

Use `meta.tag` to add keywords or topics for easier discovery:

```
* meta
  * tag[+].display = "Cardiovascular Disease"
  * tag[+].display = "Diabetes"

```

#### Usage in Guideline Registry Records

Attachments are referenced from the guideline's attachment section:

```
// In the guideline:
* section[attachments]
  * section[longVersion]
    * entry = Reference(MyLongVersionAttachment)
  * section[patientVersion]
    * entry = Reference(MyPatientVersionAttachment)

```

#### Example Usage

```
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

This profile of a FHIR DocumentReference is derived from the [DocumentReference](http://hl7.org/fhir/StructureDefinition/DocumentReference) FHIR resource.

**Usages:**

* Refer to this Profile: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Profile: [DocumentReference/Guideline-020-013-GuidelineReport](DocumentReference-Guideline-020-013-GuidelineReport.md), [DocumentReference/Guideline-020-013-ImplementationGuidance](DocumentReference-Guideline-020-013-ImplementationGuidance.md), [DocumentReference/Guideline-020-013-LongVersion](DocumentReference-Guideline-020-013-LongVersion.md), [DocumentReference/Guideline-020-013-PatientVersion](DocumentReference-Guideline-020-013-PatientVersion.md)... Show 4 more, [DocumentReference/Guideline-020-013-ShortVersion](DocumentReference-Guideline-020-013-ShortVersion.md), [DocumentReference/Guideline-020-013-SlideDeck](DocumentReference-Guideline-020-013-SlideDeck.md), [DocumentReference/guideline-attachment-example](DocumentReference-guideline-attachment-example.md) and [DocumentReference/guideline-attachment-patient-version-example](DocumentReference-guideline-attachment-patient-version-example.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/guideline-attachment)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-guideline-attachment.csv), [Excel](StructureDefinition-guideline-attachment.xlsx), [Schematron](StructureDefinition-guideline-attachment.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "guideline-attachment",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-attachment",
  "version" : "0.2.0",
  "name" : "GuidelineAttachment",
  "title" : "Guideline Attachment",
  "status" : "draft",
  "date" : "2026-01-29T18:27:10+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [
    {
      "name" : "AWMF e.V.",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org"
        }
      ]
    }
  ],
  "description" : "Attachment to a Clinical Practice Guideline",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "fhircomposition",
      "uri" : "http://hl7.org/fhir/composition",
      "name" : "FHIR Composition"
    },
    {
      "identity" : "xds",
      "uri" : "https://profiles.ihe.net/ITI/TF/Volume3",
      "name" : "XDS metadata equivalent"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 V2 Mapping"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "DocumentReference",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/DocumentReference",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "DocumentReference",
        "path" : "DocumentReference"
      },
      {
        "id" : "DocumentReference.type",
        "path" : "DocumentReference.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "attachments",
              "display" : "Attachments"
            }
          ]
        }
      },
      {
        "id" : "DocumentReference.category",
        "path" : "DocumentReference.category",
        "min" : 1,
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-content-types"
        }
      }
    ]
  }
}

```
