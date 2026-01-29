# Guideline Author Role - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Author Role**

## Extension: Guideline Author Role 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:GuidelineAuthorRoleExt |

This extension allows for the indication of the role of the author of the guideline.

The GuidelineAuthorRoleExt extension describes the role of the author of the guideline.

**Context of Use**

### Guidance

This extension indicates the **role of an author** in the context of guideline development.

#### Overview

Guideline authors can have different roles such as registrant, leading author, contributing author, or coordinator. This extension provides a coded classification of those roles.

#### Context

This extension can be applied to `Composition.author` elements.

#### Value Type

The value is a `CodeableConcept` bound to the guideline author role value set:

```
* value[x] only CodeableConcept
* valueCodeableConcept from vs-guideline-author-role (extensible)

```

#### Available Roles

| | |
| :--- | :--- |
| `registrant` | Person who registered the guideline |
| `leading` | Leading author (organization-level) |
| `contributing` | Contributing author (organization-level) |
| `coordinator` | Coordination role |

#### Usage Notes

* Exactly **one author must have the role `registrant`**
* `leading` and `contributing` roles must reference Organizations
* `leading` and `contributing` are mutually exclusive for the same author

#### Example Usage

```
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant

* author[+] = Reference(LeadOrganization)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#leading

```

This profile of a FHIR Extension is derived from the [Extension](http://hl7.org/fhir/StructureDefinition/Extension) FHIR resource.

**Usage info**

**Usages:**

* Use this Extension: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)
* Examples for this Extension: [Composition/AWMFGuidelineRecordS2kExample](Composition-AWMFGuidelineRecordS2kExample.md), [Composition/AWMFGuidelineRecordS3Example](Composition-AWMFGuidelineRecordS3Example.md), [Composition/AWMFGuidelineS1Example](Composition-AWMFGuidelineS1Example.md), [Composition/AWMFGuidelineS2eExample](Composition-AWMFGuidelineS2eExample.md)... Show 22 more, [Composition/DemenzenRecord](Composition-DemenzenRecord.md), [Composition/GuidelineRegistryRecordExample](Composition-GuidelineRegistryRecordExample.md), [Composition/NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.md), [Composition/RR-TestInvContribAuthorRefPerson-SHOULD-FAIL](Composition-RR-TestInvContribAuthorRefPerson-SHOULD-FAIL.md), [Composition/RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS](Composition-RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS.md), [Composition/RR-TestInvLeadingAuthorRefPerson-SHOULD-FAIL](Composition-RR-TestInvLeadingAuthorRefPerson-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorLeadVsContrExclusive-Both-SHOULD-FAIL](Composition-RR-TestTestInvAuthorLeadVsContrExclusive-Both-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorRegistSingleton-NoRegistrant-SHOULD-FAIL](Composition-RR-TestTestInvAuthorRegistSingleton-NoRegistrant-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorRegistSingleton-TwoRegistrants-SHOULD-FAIL](Composition-RR-TestTestInvAuthorRegistSingleton-TwoRegistrants-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorRegistrantSingleton-SHOULD-PASS](Composition-RR-TestTestInvAuthorRegistrantSingleton-SHOULD-PASS.md), [Composition/RR-TestTestInvPrelimCompNeedsConsultPeriod-NoDate-SHOULD-FAIL](Composition-RR-TestTestInvPrelimCompNeedsConsultPeriod-NoDate-SHOULD-FAIL.md), [Composition/RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS](Composition-RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS.md), [Composition/RR-TestTestInvRegCompNeedsPlannedComplDate-NoDate-SHOULD-FAIL](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-NoDate-SHOULD-FAIL.md), [Composition/RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS.md), [Composition/RR-TestTestInvRequireOfficialId-NoOfficialId-SHOULD-FAIL](Composition-RR-TestTestInvRequireOfficialId-NoOfficialId-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL](Composition-RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL](Composition-RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS.md), [Composition/RR-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL.md), [Composition/RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL.md) and [Composition/RR-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/ext-guideline-author-role)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-ext-guideline-author-role.csv), [Excel](StructureDefinition-ext-guideline-author-role.xlsx), [Schematron](StructureDefinition-ext-guideline-author-role.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "ext-guideline-author-role",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
      "valueCode" : "can-bind"
    }
  ],
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
  "version" : "0.2.0",
  "name" : "GuidelineAuthorRoleExt",
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
  "description" : "This extension allows for the indication of the role of the author of the guideline.",
  "purpose" : "The GuidelineAuthorRoleExt extension describes the role of the author of the guideline.",
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
      "expression" : "Composition.author"
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
        "short" : "Author Role",
        "definition" : "Describes the role of the author of the guideline."
      },
      {
        "id" : "Extension.extension",
        "path" : "Extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-author-role"
        }
      }
    ]
  }
}

```
