# Guideline Author Role - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Author Role**

## Resource Profile: Guideline Author Role 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:GuidelineAuthorRole |

 
The role of the author of the guideline. 

### Guidance

This profile represents a **Guideline Author Role** – the role of an author in the context of a specific guideline, including their time period of involvement.

#### Overview

The `GuidelineAuthorRole` links a `GuidelineAuthor` (person) to an organization and specifies the time period during which they participated in guideline development. This allows tracking of who contributed to a guideline and in what capacity.

#### Key Elements

##### Period (Required)

The time period during which the author was involved:

```
* period
  * start = "2022-08-01"
  * end = "2023-12-31"

```

##### Practitioner Reference

Links to the actual person (GuidelineAuthor):

```
* practitioner = Reference(MyGuidelineAuthor)

```

##### Organization

The organization the author was affiliated with during their contribution:

```
* organization = Reference(MyMedicalSociety)

```

##### Role Description

Use the `code` element to describe the author's specific role:

```
* code.text = "Coordination and scientific leadership"

```

#### Usage in Guidelines

When referencing authors in a guideline or registry record, the author reference should point to `GuidelineAuthorRole`, with an additional extension specifying their formal role in the guideline development:

```
// In the guideline:
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant

```

Available formal roles include:

* `registrant` – The person who registered the guideline
* `leading` – Leading author (organization-level)
* `contributing` – Contributing author (organization-level)
* `coordinator` – Coordination role

#### Example Usage

```
Instance: MyAuthorRole
InstanceOf: guideline-author-role
Usage: #example
* practitioner = Reference(DrSmith)
* organization = Reference(GermanSurgicalSociety)
* period
  * start = "2022-08-01"
  * end = "2023-12-31"
* code.text = "Methodology expert and systematic review lead"

```

This profile of a FHIR PractitionerRole is derived from the [PractitionerRole](http://hl7.org/fhir/StructureDefinition/PractitionerRole) FHIR resource.

**Usages:**

* Refer to this Profile: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Profile: [PractitionerRole/GuidelineAuthorRoleExample](PractitionerRole-GuidelineAuthorRoleExample.md) and [PractitionerRole/JessicaRademacherDGPFor020-013](PractitionerRole-JessicaRademacherDGPFor020-013.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/guideline-author-role)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-guideline-author-role.csv), [Excel](StructureDefinition-guideline-author-role.xlsx), [Schematron](StructureDefinition-guideline-author-role.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "guideline-author-role",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role",
  "version" : "0.2.0",
  "name" : "GuidelineAuthorRole",
  "title" : "Guideline Author Role",
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
  "description" : "The role of the author of the guideline.",
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
  "type" : "PractitionerRole",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/PractitionerRole",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "PractitionerRole",
        "path" : "PractitionerRole"
      },
      {
        "id" : "PractitionerRole.period",
        "path" : "PractitionerRole.period",
        "min" : 1
      },
      {
        "id" : "PractitionerRole.practitioner",
        "path" : "PractitionerRole.practitioner",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author"
            ]
          }
        ]
      }
    ]
  }
}

```
