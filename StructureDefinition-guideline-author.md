# Guideline Author - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Author**

## Resource Profile: Guideline Author 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:GuidelineAuthor |

 
A person that authored a guideline. 

### Guidance

This profile represents a **Guideline Author** – a person who authored or contributed to a clinical practice guideline.

#### Overview

Guideline authors are typically healthcare professionals, researchers, or methodologists who contribute to guideline development. This profile captures basic identifying and contact information for these individuals.

#### Key Elements

##### Name (Required)

The author's name must be provided:

```
* name
  * family = "Smith"
  * given = "John"

```

##### Contact Information (Optional)

Telecom details for reaching the author:

```
* telecom
  * system = #phone
  * value = "555-555-5555"
* telecom
  * system = #email
  * value = "john.smith@example.org"

```

#### Relationship to GuidelineAuthorRole

While `GuidelineAuthor` captures the person's identity, the `GuidelineAuthorRole` profile captures their role in a specific guideline (e.g., coordinator, scientific lead) and the time period of their involvement.

When referencing authors in a guideline, use `GuidelineAuthorRole` which in turn references the `GuidelineAuthor`:

```
Instance: AuthorRoleExample
InstanceOf: guideline-author-role
* practitioner = Reference(MyGuidelineAuthor)
* organization = Reference(AuthorOrganization)
* period.start = "2022-08-01"
* period.end = "2023-12-31"

```

#### Example Usage

```
Instance: GuidelineAuthorExample
InstanceOf: guideline-author
Usage: #example
* name
  * family = "Müller"
  * given = "Anna"
  * prefix = "Prof. Dr. med."
* telecom[+]
  * system = #email
  * value = "anna.mueller@university-hospital.de"

```

This profile of a FHIR Practitioner is derived from the [Practitioner](http://hl7.org/fhir/StructureDefinition/Practitioner) FHIR resource.

**Usages:**

* Refer to this Profile: [Guideline Author Role](StructureDefinition-guideline-author-role.md)
* Examples for this Profile: [Practitioner/GuidelineAuthorExample](Practitioner-GuidelineAuthorExample.md) and [Practitioner/JessicaRademacher](Practitioner-JessicaRademacher.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/guideline-author)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-guideline-author.csv), [Excel](StructureDefinition-guideline-author.xlsx), [Schematron](StructureDefinition-guideline-author.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "guideline-author",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author",
  "version" : "0.2.0",
  "name" : "GuidelineAuthor",
  "title" : "Guideline Author",
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
  "description" : "A person that authored a guideline.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 V2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "servd",
      "uri" : "http://www.omg.org/spec/ServD/1.0/",
      "name" : "ServD"
    },
    {
      "identity" : "interface",
      "uri" : "http://hl7.org/fhir/interface",
      "name" : "Interface Pattern"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Practitioner",
        "path" : "Practitioner"
      },
      {
        "id" : "Practitioner.name",
        "path" : "Practitioner.name",
        "min" : 1,
        "max" : "1"
      }
    ]
  }
}

```
