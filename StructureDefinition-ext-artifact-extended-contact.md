# Artifact Contact (Extended) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Artifact Contact (Extended)**

## Extension: Artifact Contact (Extended) 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-artifact-extended-contact | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:ArtifactExtendedContact |

This extension provides additional contact details for individuals or organizations associated with an artifact (e.g., a clinical document, guideline, or other composition).

**Context of Use**

### Guidance

This extension provides **additional contact details** for individuals or organizations associated with an artifact (e.g., a clinical guideline, document, or composition).

#### Overview

The `ArtifactExtendedContact` extension allows capturing structured contact information including name, organization, telecom details, and address using the `ExtendedContactDetail` datatype.

#### Context

This extension can be applied to `Composition` resources.

#### Value Type

The extension value must be an `ExtendedContactDetail`:

```
* valueExtendedContactDetail 1..1

```

#### Example Usage

```
* extension[ext-artifact-extended-contact].valueExtendedContactDetail
  * name = "Dr. Jane Smith"
  * organization = Reference(MyOrganization)
  * telecom[+]
    * system = #email
    * value = "jane.smith@example.org"
  * address
    * city = "Berlin"
    * country = "DE"

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* This Extension is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-artifact-extended-contact)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-artifact-extended-contact.csv), [Excel](StructureDefinition-ext-artifact-extended-contact.xlsx), [Schematron](StructureDefinition-ext-artifact-extended-contact.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-artifact-extended-contact",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-artifact-extended-contact",
  "version" : "0.2.0",
  "name" : "ArtifactExtendedContact",
  "title" : "Artifact Contact (Extended)",
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
  "description" : "This extension provides additional contact details for individuals or organizations associated with an artifact (e.g., a clinical document, guideline, or other composition).",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Composition"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "Artifact Contact (Extended)",
        "definition" : "This extension provides additional contact details for individuals or organizations associated with an artifact (e.g., a clinical document, guideline, or other composition)."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-artifact-extended-contact"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "ExtendedContactDetail"
          }
        ]
      }
    ]
  }
}

```
