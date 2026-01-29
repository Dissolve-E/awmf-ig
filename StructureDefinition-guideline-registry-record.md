# Guideline Registry Record - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Registry Record**

## Resource Profile: Guideline Registry Record 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:AWMFGuidelineRegistryRecord |

 
Guideline Registry Record containing metadata and registry-specific information for a clinical practice guideline. 

### Guidance

This profile represents a **Guideline Registry Record** containing metadata and registry-specific information for a clinical practice guideline. It serves as the base profile for AWMF guideline classification levels (S1, S2e, S2k, S3).

#### Overview

The Guideline Registry Record captures comprehensive metadata about a guideline's lifecycle, including registration, consultation, publication, and validity dates, as well as authorship, contact information, and related documents.

#### Key Elements

##### Status and Workflow

The `status` element tracks the workflow state of the guideline from registration to publication:

* `registered` – Initial registration
* `preliminary` – Consultation phase
* `final` – Published guideline
* `amended` – Updated version

##### Required Dates and Extensions

The profile defines several important date-related extensions:

| | | |
| :--- | :--- | :--- |
| `approvalDate` | Date the guideline was approved | Always |
| `lastReviewDate` | Date of last update | Always |
| `effectivePeriod` | Valid until date | Always (end date required) |
| `publicationDate` | Date published in current version | Always |
| `firstPublicationDate` | Initial publication date | Optional |
| `submissionDate` | Date submitted for publication | Optional |
| `consultationPeriod` | Open for consultation period | Required if`status = #preliminary` |
| `plannedCompletionDate` | Expected completion date | Required if`status = #registered` |
| `registrationDate` | Registration submission date | Optional |

##### Identifiers

Each guideline must have exactly one official identifier. The AWMF register number uses the system `http://fhir.awmf.org/guidelines`:

```
* identifier[awmf-register-number]
  * system = "http://fhir.awmf.org/guidelines"
  * value = "XXX-XXX"
  * use = #official

```

##### Versioning

Versions must follow the major.minor format (e.g., "2.0", "1.1"):

```
* version = "2.0"

```

##### Authors and Roles

Authors must reference `GuidelineAuthorRole` or `Organization` with a required role extension:

```
* author[+] = Reference(MyAuthorRole)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant

```

Available roles include: `registrant`, `leading`, `contributing`, `coordinator`.

**Constraints:**

* Exactly one author with role `registrant` is required
* Authors with `leading` or `contributing` roles must be Organizations
* `leading` and `contributing` roles are mutually exclusive for the same author

##### Contact Information (Extended Contact Slices)

The profile provides pre-defined contact slices:

```
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

```
* attester[AWMF]
  * mode = #official
  * party.reference = "Organization/AWMF"
  * time = "2025-03-06T00:00:00+01:00"

```

##### Related Guidelines and Documents

Use `relatesTo` slices to link to related content:

```
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

* **Summary** – Including intention, target patient group, care setting, keywords
* **Attachments** – Long/short versions, evidence reports, patient versions
* **Consensus Protocol** – Documentation of the consensus process

##### Release Type (for Registered Guidelines)

When `status = #registered`, a release type tag is required:

```
* meta.tag[guideline-releaseType] = cs-guideline-release-type#new-guideline "New Guideline"

```

This profile of a FHIR Composition is derived from the [evidence-report-with-contact-slices](http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-report-with-contact-slices) FHIR resource.

**Usages:**

* Derived from this Profile: [AWMF S1 Guideline Registry Record](StructureDefinition-awmf-guideline-record-s1.md), [AWMF S2e Guideline Registry Record](StructureDefinition-awmf-guideline-record-s2e.md), [AWMF S2k Guideline Registry Record](StructureDefinition-awmf-guideline-record-s2k.md) and [AWMF S3 Guideline Registry Record](StructureDefinition-awmf-guideline-record-s3.md)
* Examples for this Profile: [Composition/DemenzenRecord](Composition-DemenzenRecord.md), [Composition/GuidelineRegistryRecordExample](Composition-GuidelineRegistryRecordExample.md), [Composition/NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.md), [Composition/RR-TestInvContribAuthorRefPerson-SHOULD-FAIL](Composition-RR-TestInvContribAuthorRefPerson-SHOULD-FAIL.md)... Show 18 more, [Composition/RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS](Composition-RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS.md), [Composition/RR-TestInvLeadingAuthorRefPerson-SHOULD-FAIL](Composition-RR-TestInvLeadingAuthorRefPerson-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorLeadVsContrExclusive-Both-SHOULD-FAIL](Composition-RR-TestTestInvAuthorLeadVsContrExclusive-Both-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorRegistSingleton-NoRegistrant-SHOULD-FAIL](Composition-RR-TestTestInvAuthorRegistSingleton-NoRegistrant-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorRegistSingleton-TwoRegistrants-SHOULD-FAIL](Composition-RR-TestTestInvAuthorRegistSingleton-TwoRegistrants-SHOULD-FAIL.md), [Composition/RR-TestTestInvAuthorRegistrantSingleton-SHOULD-PASS](Composition-RR-TestTestInvAuthorRegistrantSingleton-SHOULD-PASS.md), [Composition/RR-TestTestInvPrelimCompNeedsConsultPeriod-NoDate-SHOULD-FAIL](Composition-RR-TestTestInvPrelimCompNeedsConsultPeriod-NoDate-SHOULD-FAIL.md), [Composition/RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS](Composition-RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS.md), [Composition/RR-TestTestInvRegCompNeedsPlannedComplDate-NoDate-SHOULD-FAIL](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-NoDate-SHOULD-FAIL.md), [Composition/RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS.md), [Composition/RR-TestTestInvRequireOfficialId-NoOfficialId-SHOULD-FAIL](Composition-RR-TestTestInvRequireOfficialId-NoOfficialId-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL](Composition-RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL](Composition-RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL.md), [Composition/RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS.md), [Composition/RR-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL.md), [Composition/RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL.md) and [Composition/RR-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL](Composition-RR-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/guideline-registry-record)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-guideline-registry-record.csv), [Excel](StructureDefinition-guideline-registry-record.xlsx), [Schematron](StructureDefinition-guideline-registry-record.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "guideline-registry-record",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record",
  "version" : "0.2.0",
  "name" : "AWMFGuidelineRegistryRecord",
  "title" : "Guideline Registry Record",
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
  "description" : "Guideline Registry Record containing metadata and registry-specific information for a clinical practice guideline.",
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
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "fhirdocumentreference",
      "uri" : "http://hl7.org/fhir/documentreference",
      "name" : "FHIR DocumentReference"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Composition",
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/evidence-report-with-contact-slices",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition",
        "path" : "Composition",
        "constraint" : [
          {
            "key" : "author-leading-contributing-organization",
            "severity" : "error",
            "human" : "Authors with role “leading” or “contributing” SHALL reference an Organization.",
            "expression" : "\n  author.where(\n    extension(\n      'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role'\n    ).value.ofType(CodeableConcept).coding.where(code = 'leading' or code = 'contributing').exists()\n  ).all(resolve().is(Organization))\n",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          },
          {
            "key" : "inv-require-release-type-if-registered",
            "severity" : "error",
            "human" : "If status = #registered, meta.tag[guideline-releaseType] SHALL be present and drawn from vs-guideline-release-type.",
            "expression" : "(status != 'registered') or\n            (meta.tag.where(code.memberOf('http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-release-type')).exists())",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          },
          {
            "key" : "preliminary-composition-needs-consultation-period",
            "severity" : "error",
            "human" : "If status = #preliminary, extension[consultationPeriod] SHALL be present.",
            "expression" : "(status != 'preliminary') or\n            (extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period').value.exists())",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          },
          {
            "key" : "registered-composition-needs-planned-completion-date",
            "severity" : "error",
            "human" : "If status = #registered, extension[plannedCompletionDate] SHALL be present.",
            "expression" : "(status != 'registered') or\n            (extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date').value.exists())",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          },
          {
            "key" : "author-registrant-singleton",
            "severity" : "error",
            "human" : "Exactly one author SHALL have the role “registrant”.",
            "expression" : "author.extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role')\n             .value.ofType(CodeableConcept).coding.where(code = 'registrant').count() = 1",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          },
          {
            "key" : "author-leading-vs-contributing-exclusive",
            "severity" : "error",
            "human" : "No single author SHALL simultaneously have the roles “leading” and “contributing”.",
            "expression" : "author.all(\n              extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role')\n              .value.ofType(CodeableConcept).coding.code\n              .where($this = 'leading' or $this = 'contributing')\n              .count() <= 1          /* each author may have 0 or 1 of those roles */\n            )",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          },
          {
            "key" : "inv-require-official-identifier",
            "severity" : "error",
            "human" : "Every Guideline/Recommendation must have exactly one official identifier (with use = #official)",
            "expression" : "identifier.where(use='official').count() = 1",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          }
        ]
      },
      {
        "id" : "Composition.meta.tag",
        "path" : "Composition.meta.tag",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "$this"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.meta.tag:guideline-releaseType",
        "path" : "Composition.meta.tag",
        "sliceName" : "guideline-releaseType",
        "short" : "The typ of registration of a new or updated guideline, i.e., whether it's an update, an upgrade, a completely new guideline, etc",
        "min" : 0,
        "max" : "1",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-release-type"
        }
      },
      {
        "id" : "Composition.language",
        "path" : "Composition.language",
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:versionAlgorithm",
        "path" : "Composition.extension",
        "sliceName" : "versionAlgorithm"
      },
      {
        "id" : "Composition.extension:versionAlgorithm.value[x]:valueCoding",
        "path" : "Composition.extension.value[x]",
        "sliceName" : "valueCoding",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
          "code" : "major-minor",
          "display" : "Major-Minor Versioning"
        }
      },
      {
        "id" : "Composition.extension:approvalDate",
        "path" : "Composition.extension",
        "sliceName" : "approvalDate",
        "short" : "Approval Date",
        "definition" : "The date on which the guideline was approved by the publisher."
      },
      {
        "id" : "Composition.extension:approvalDate.extension",
        "path" : "Composition.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.extension:lastReviewDate",
        "path" : "Composition.extension",
        "sliceName" : "lastReviewDate",
        "short" : "Last Review Date",
        "definition" : "The date on which the guideline was last updated."
      },
      {
        "id" : "Composition.extension:lastReviewDate.extension",
        "path" : "Composition.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.extension:effectivePeriod",
        "path" : "Composition.extension",
        "sliceName" : "effectivePeriod",
        "short" : "Effective Period",
        "definition" : "The period during which the guideline is intended to be in use."
      },
      {
        "id" : "Composition.extension:effectivePeriod.extension",
        "path" : "Composition.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.extension:effectivePeriod.value[x].end",
        "path" : "Composition.extension.value[x].end",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:publicationDate",
        "path" : "Composition.extension",
        "sliceName" : "publicationDate",
        "short" : "Publication Date",
        "definition" : "The date on which the current version of the guideline was published."
      },
      {
        "id" : "Composition.extension:publicationDate.extension",
        "path" : "Composition.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.extension:firstPublicationDate",
        "path" : "Composition.extension",
        "sliceName" : "firstPublicationDate",
        "short" : "First Publication Date",
        "definition" : "The date on which the guideline was first published in its initial version.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:submissionDate",
        "path" : "Composition.extension",
        "sliceName" : "submissionDate",
        "short" : "Submission Date",
        "definition" : "The date on which this version of the guideline was submitted for publication.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:consultationPeriod",
        "path" : "Composition.extension",
        "sliceName" : "consultationPeriod",
        "short" : "Consultation Period",
        "definition" : "The period during which the guideline is open for consultation.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:plannedCompletionDate",
        "path" : "Composition.extension",
        "sliceName" : "plannedCompletionDate",
        "short" : "Planned Completion Date",
        "definition" : "The date on which the guideline is planned to be completed.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:registrationDate",
        "path" : "Composition.extension",
        "sliceName" : "registrationDate",
        "short" : "Registration Date",
        "definition" : "The date when the guideline registration was submitted.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.identifier",
        "path" : "Composition.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "short" : "An identifer in a (technical) system the guideline is represented in",
        "min" : 1
      },
      {
        "id" : "Composition.identifier:awmf-register-number",
        "path" : "Composition.identifier",
        "sliceName" : "awmf-register-number",
        "short" : "The AWMF register number of the guideline, e.g., 001-001",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Composition.identifier:awmf-register-number.system",
        "path" : "Composition.identifier.system",
        "min" : 1,
        "patternUri" : "http://fhir.awmf.org/guidelines"
      },
      {
        "id" : "Composition.identifier:awmf-register-number.value",
        "path" : "Composition.identifier.value",
        "min" : 1
      },
      {
        "id" : "Composition.version",
        "path" : "Composition.version",
        "min" : 1,
        "constraint" : [
          {
            "key" : "inv-version-major-minor",
            "severity" : "error",
            "human" : "Version must be a major-minor version (e.g. 5.1)",
            "expression" : "$this.matches('^[0-9]+\\\\.[0-9]+$')",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          }
        ]
      },
      {
        "id" : "Composition.status",
        "path" : "Composition.status",
        "short" : "Workflow status of the guideline from registration to publication or deprecation, e.g., preliminary, final, amendend etc.",
        "definition" : "Workflow status of the guideline from registration to publication or deprecation. Please note that the ValueSet 'http://hl7.org/fhir/ValueSet/composition-status' is required; We therefore created the ConceptMap 'FHIRStatusToAWMFStatus' to store the mapping to the AWMF status values."
      },
      {
        "id" : "Composition.type",
        "path" : "Composition.type",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "guideline-registry-record",
              "display" : "Guideline Registry Record"
            }
          ]
        }
      },
      {
        "id" : "Composition.category",
        "path" : "Composition.category",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "coding"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.category:awmfGuidelineClass",
        "path" : "Composition.category",
        "sliceName" : "awmfGuidelineClass",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Composition.category:awmfGuidelineClass.coding",
        "path" : "Composition.category.coding",
        "short" : "The guideline class for this guideline record: S1, S2k, S2e, S3",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-awmf-guideline-class"
        }
      },
      {
        "id" : "Composition.category:awmfGuidelineClass.coding.system",
        "path" : "Composition.category.coding.system",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.category:awmfGuidelineClass.coding.code",
        "path" : "Composition.category.coding.code",
        "min" : 1,
        "mustSupport" : true
      },
      {
        "id" : "Composition.date",
        "path" : "Composition.date",
        "short" : "Modification Date",
        "definition" : "Modification date of the Composition contents. Does not represent the publication, last review or approval date."
      },
      {
        "id" : "Composition.author",
        "path" : "Composition.author",
        "short" : "Author, either as organization or person",
        "definition" : "The authors of the guildeline, either organizations or persons. Their respective role is defined by extension role: content-author, moderator etc. ",
        "comment" : "Note that the authoring role defined here is disjunct with roles for the management of the guideline project as a whole (e.g., coordinatior, registrant etc). These are defined as dedicated contact points within the extension extendedContactDetail.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role",
              "http://hl7.org/fhir/StructureDefinition/Organization"
            ]
          }
        ]
      },
      {
        "id" : "Composition.author.extension",
        "path" : "Composition.author.extension",
        "min" : 1
      },
      {
        "id" : "Composition.author.extension:role",
        "path" : "Composition.author.extension",
        "sliceName" : "role",
        "min" : 1,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role"
            ]
          }
        ]
      },
      {
        "id" : "Composition.title",
        "path" : "Composition.title",
        "short" : "Human readable title of the guideline",
        "definition" : "Title of the guideline"
      },
      {
        "id" : "Composition.note",
        "path" : "Composition.note",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "extension('http://hl7.org/fhir/StructureDefinition/annotationType').value"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.note.extension",
        "path" : "Composition.note.extension",
        "min" : 1
      },
      {
        "id" : "Composition.note.extension:type",
        "path" : "Composition.note.extension",
        "sliceName" : "type",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/annotationType"]
          }
        ]
      },
      {
        "id" : "Composition.note:remark",
        "path" : "Composition.note",
        "sliceName" : "remark",
        "short" : "A remark to go with the publication of the guideline in the register, possibly changing over time based on updates to the guideline or similar circumstances",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Composition.note:remark.extension:type",
        "path" : "Composition.note.extension",
        "sliceName" : "type",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : ["http://hl7.org/fhir/StructureDefinition/annotationType"]
          }
        ]
      },
      {
        "id" : "Composition.note:remark.extension:type.value[x]",
        "path" : "Composition.note.extension.value[x]",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-remark-type"
        }
      },
      {
        "id" : "Composition.attester",
        "path" : "Composition.attester",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "party.reference"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.attester:AWMF",
        "path" : "Composition.attester",
        "sliceName" : "AWMF",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Composition.attester:AWMF.mode",
        "path" : "Composition.attester.mode",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://hl7.org/fhir/composition-attestation-mode",
              "code" : "official"
            }
          ]
        }
      },
      {
        "id" : "Composition.attester:AWMF.party",
        "path" : "Composition.attester.party",
        "min" : 1
      },
      {
        "id" : "Composition.attester:AWMF.party.reference",
        "path" : "Composition.attester.party.reference",
        "min" : 1,
        "patternString" : "Organization/AWMF"
      },
      {
        "id" : "Composition.relatesTo",
        "path" : "Composition.relatesTo",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "type"
            },
            {
              "type" : "value",
              "path" : "extension('http://hl7.org/fhir/StructureDefinition/relatesto-classifier').value.ofType(CodeableConcept)"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.relatesTo.extension:label",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "label",
        "short" : "A label to display with the reference to the related object, e.g. the title of a related guideline",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label"
            ]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline",
        "path" : "Composition.relatesTo",
        "sliceName" : "similarTo/relatedGuideline",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline.extension",
        "path" : "Composition.relatesTo.extension",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline.extension:classifier.extension",
        "path" : "Composition.relatesTo.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline.extension:classifier.value[x]",
        "path" : "Composition.relatesTo.extension.value[x]",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
              "code" : "related-guideline"
            }
          ]
        }
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline.extension:label",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "label",
        "short" : "A label to display with the reference to the related object, e.g. the title of a related guideline",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label"
            ]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:similarTo/relatedGuideline.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "similar-to"
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite",
        "path" : "Composition.relatesTo",
        "sliceName" : "disseminationWebsite",
        "short" : "A reference to a website this guideline (and accompanying informaiton) is being made available at",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.extension",
        "path" : "Composition.relatesTo.extension",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier",
        "min" : 1
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.extension:classifier.extension",
        "path" : "Composition.relatesTo.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.extension:classifier.value[x]",
        "path" : "Composition.relatesTo.extension.value[x]",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-dissemination-website"
        }
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.extension:classifier.value[x].coding",
        "path" : "Composition.relatesTo.extension.value[x].coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.extension:label",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "label",
        "short" : "A label to display with the reference to the related object, e.g. the title of a related guideline",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label"
            ]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:disseminationWebsite.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "documentation"
      },
      {
        "id" : "Composition.relatesTo:replacesGuideline",
        "path" : "Composition.relatesTo",
        "sliceName" : "replacesGuideline",
        "short" : "A reference to another (older, outdated or obsolete) guideline this guideline is replacing",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:replacesGuideline.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier"
      },
      {
        "id" : "Composition.relatesTo:replacesGuideline.extension:label",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "label",
        "short" : "A label to display with the reference to the related object, e.g. the title of a related guideline",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label"
            ]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:replacesGuideline.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "replaces"
      },
      {
        "id" : "Composition.relatesTo:replacesGuideline.target[x]",
        "path" : "Composition.relatesTo.target[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.relatesTo:replacesGuideline.target[x]:targetReference",
        "path" : "Composition.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/uv/ebm/StructureDefinition/guideline"]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:replacedWithGuideline",
        "path" : "Composition.relatesTo",
        "sliceName" : "replacedWithGuideline",
        "short" : "A reference to another (newer, updated, merged) guideline this guideline has been replaced by",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.relatesTo:replacedWithGuideline.extension:classifier",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "classifier"
      },
      {
        "id" : "Composition.relatesTo:replacedWithGuideline.extension:label",
        "path" : "Composition.relatesTo.extension",
        "sliceName" : "label",
        "short" : "A label to display with the reference to the related object, e.g. the title of a related guideline",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label"
            ]
          }
        ]
      },
      {
        "id" : "Composition.relatesTo:replacedWithGuideline.type",
        "path" : "Composition.relatesTo.type",
        "patternCode" : "replaced-with"
      },
      {
        "id" : "Composition.relatesTo:replacedWithGuideline.target[x]",
        "path" : "Composition.relatesTo.target[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.relatesTo:replacedWithGuideline.target[x]:targetReference",
        "path" : "Composition.relatesTo.target[x]",
        "sliceName" : "targetReference",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : ["http://hl7.org/fhir/uv/ebm/StructureDefinition/guideline"]
          }
        ]
      },
      {
        "id" : "Composition.section",
        "path" : "Composition.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary",
        "path" : "Composition.section",
        "sliceName" : "summary",
        "short" : "Overview information regarding the guideline, to be shown in the register upon publication",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Composition.section:summary.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "summary",
              "display" : "Summary"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "summary",
          "display" : "Summary"
        }
      },
      {
        "id" : "Composition.section:summary.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section:summary.section:intention",
        "path" : "Composition.section.section",
        "sliceName" : "intention",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:intention.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "intention",
              "display" : "Intention"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:intention.text",
        "path" : "Composition.section.section.text",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:intention.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:intention.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:intention.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:intention.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:intention.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:intention.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:intention.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:intention.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:intention.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:intention.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup",
        "path" : "Composition.section.section",
        "sliceName" : "targetPatientGroup",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.extension:value",
        "path" : "Composition.section.section.extension",
        "sliceName" : "value",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.extension:value.value[x]",
        "path" : "Composition.section.section.extension.value[x]",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-target-patient-group"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "target-patient-group",
              "display" : "Target Patient Group"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.text",
        "path" : "Composition.section.section.text",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:targetPatientGroup.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting",
        "path" : "Composition.section.section",
        "sliceName" : "careSetting",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "care-setting",
              "display" : "Care Setting"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting",
        "path" : "Composition.section.section.section",
        "sliceName" : "careSetting",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.extension:value",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "value",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.extension:value.value[x]",
        "path" : "Composition.section.section.section.extension.value[x]",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-encounter-type"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "encounter-type",
              "display" : "Encounter Type"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careSetting.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage",
        "path" : "Composition.section.section.section",
        "sliceName" : "careStage",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.extension:value",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "value",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.extension:value.value[x]",
        "path" : "Composition.section.section.section.extension.value[x]",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-care-stage"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "care-stage",
              "display" : "Care Stage"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careStage.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel",
        "path" : "Composition.section.section.section",
        "sliceName" : "careLevel",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.extension:value",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "value",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.extension:value.value[x]",
        "path" : "Composition.section.section.section.extension.value[x]",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-care-level"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "care-level",
              "display" : "Care Level"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:careSetting.section:careLevel.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason",
        "path" : "Composition.section.section",
        "sliceName" : "topicSelectionReason",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "topic-selection-reason",
              "display" : "Topic Selection Reason"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.text",
        "path" : "Composition.section.section.text",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:topicSelectionReason.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetAudience",
        "path" : "Composition.section.section",
        "sliceName" : "targetAudience",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "target-audience",
              "display" : "Target Audience"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.text",
        "path" : "Composition.section.section.text",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:targetAudience.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords",
        "path" : "Composition.section.section",
        "sliceName" : "keywords",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:keywords.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords.extension:keyword",
        "path" : "Composition.section.section.extension",
        "sliceName" : "keyword",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-keyword"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:keywords.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "keywords",
              "display" : "Keywords"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords.text",
        "path" : "Composition.section.section.text",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:keywords.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:keywords.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:attachments",
        "path" : "Composition.section",
        "sliceName" : "attachments",
        "short" : "References to document attachements published with the guideline, e.g., a PDF long version of the guideline, a short version, an evidence report etc",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Composition.section:attachments.code",
        "path" : "Composition.section.code",
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
        "id" : "Composition.section:attachments.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "attachments",
          "display" : "Attachments"
        }
      },
      {
        "id" : "Composition.section:attachments.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "open"
        },
        "min" : 1,
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ],
        "constraint" : [
          {
            "key" : "inv-guideline-attachment-type-match",
            "severity" : "error",
            "human" : "Attachment type in DocumentReference must match the type of the section",
            "expression" : "entry[0].reference.resolve().ofType(DocumentReference).where(%context.code.coding.where(system = $this.system and code = $this.code).exists()).exists()",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section.code",
        "path" : "Composition.section.section.code",
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-content-types"
        }
      },
      {
        "id" : "Composition.section:attachments.section.entry",
        "path" : "Composition.section.section.entry",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-attachment"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.section:attachments.section:longVersion",
        "path" : "Composition.section.section",
        "sliceName" : "longVersion",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:longVersion.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "long-version",
              "display" : "Long Version"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:longVersion.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:attachments.section:shortVersion",
        "path" : "Composition.section.section",
        "sliceName" : "shortVersion",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:shortVersion.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "short-version",
              "display" : "Short Version"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:shortVersion.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:attachments.section:guidelineReport",
        "path" : "Composition.section.section",
        "sliceName" : "guidelineReport",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:guidelineReport.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "guideline-report",
              "display" : "Guideline Report"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:guidelineReport.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:attachments.section:evidenceReport",
        "path" : "Composition.section.section",
        "sliceName" : "evidenceReport",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:evidenceReport.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "evidence-report",
              "display" : "Evidence Report"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:evidenceReport.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:attachments.section:implementationGuidance",
        "path" : "Composition.section.section",
        "sliceName" : "implementationGuidance",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:implementationGuidance.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "implementation-guidance",
              "display" : "Implementation Guidance"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:implementationGuidance.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:attachments.section:decisionSupport",
        "path" : "Composition.section.section",
        "sliceName" : "decisionSupport",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:decisionSupport.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "decision-support",
              "display" : "Decision Support"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:decisionSupport.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:attachments.section:patientVersion",
        "path" : "Composition.section.section",
        "sliceName" : "patientVersion",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:attachments.section:patientVersion.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "patient-version",
              "display" : "Patient Version"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:attachments.section:patientVersion.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Composition.section:consensusProtocol",
        "path" : "Composition.section",
        "sliceName" : "consensusProtocol",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:consensusProtocol.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "consensus-protocol",
              "display" : "Consensus Protocol"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "consensus-protocol",
          "display" : "Consensus Protocol"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other",
        "path" : "Composition.section",
        "sliceName" : "other",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:other.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "other",
              "display" : "Other"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "other",
          "display" : "Other"
        }
      },
      {
        "id" : "Composition.section:other.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:other.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      }
    ]
  }
}

```
