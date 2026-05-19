{% include variables.md %}

### Authoring a Guideline Registry Record

This page shows how to build a `Guideline Registry Record` — the FHIR resource that carries the **registry-side metadata** about a clinical practice guideline: its AWMF class (S1/S2e/S2k/S3), the contact points (registrant, coordinator, main contact), the published attachments (long version, short version, evidence report, …), the release type, the AWMF attestation, and the dissemination websites.

The registry record is a **separate resource** from the [Guideline](authoring-guideline.html). The Guideline carries the guideline *content* (sections, recommendations); the registry record carries everything the registry needs *about* the guideline. They are linked together but are two distinct documents.

#### What you are building

A registry record is a constrained FHIR [Composition]({{ fhir_base_url }}composition.html) (specifically, an EBM-IG `EvidenceReport`-derived Composition). The base profile is **Guideline Registry Record**:

```
http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record
```

For AWMF guidelines you do **not** use that base profile directly — you pick one of the four AWMF class profiles below.

##### Picking the right S-class profile

AWMF guidelines are classified by the method used to produce them. The IG defines four profiles, one per class:

| AWMF class | Profile id                     | Canonical URL                                                                                              | Use when…                                                                                                  |
| ---------- | ------------------------------ | ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| **S1**     | `awmf-guideline-record-s1`     | `http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s1`     | Action recommendations from expert groups, developed through informal consensus.                            |
| **S2e**    | `awmf-guideline-record-s2e`    | `http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s2e`    | Evidence-based guideline — built on a systematic literature search and evaluation, but without formal consensus. |
| **S2k**    | `awmf-guideline-record-s2k`    | `http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s2k`    | Consensus-based guideline — built on structured consensus by a representative panel, but without systematic evidence review. |
| **S3**     | `awmf-guideline-record-s3`     | `http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s3`     | Evidence- and consensus-based guideline — both systematic evidence review *and* structured consensus.       |

Each S-class profile is a thin wrapper: it just fixes the `category[awmfGuidelineClass]` coding to the matching code (`S1`, `S2e`, `S2k`, `S3`). All other constraints come from the shared `AWMFGuidelineRegistryRecord` parent — so if you understand the parent, you understand every S-class record.

A minimum S3 record looks like:

```json
{
  "resourceType": "Composition",
  "id": "MyS3Record",
  "meta": {
    "profile": ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s3"]
  },
  "type": {
    "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf", "code": "guideline-registry-record" }]
  },
  "title": "My S3 Guideline",
  "version": "1.0",
  "status": "final",
  "date": "2026-01-15",
  "identifier": [
    { "use": "official", "system": "http://fhir.awmf.org/guidelines", "value": "001-001" }
  ],
  "author": [ /* see "Authors and their roles" below — at least one with role=registrant */ ]
}
```

#### Required metadata

Most of the basics — `title`, `version` (`major.minor`), `status`, `date`, the `identifier[awmf-register-number]`, the `inv-require-official-identifier` rule — are **identical** to the [Guideline](authoring-guideline.html#required-metadata). Re-read that section if you have not yet. The differences specific to a registry record are below.

##### `type`

The registry record `type` is fixed to a single coding:

```json
"type": {
  "coding": [{
    "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
    "code": "guideline-registry-record",
    "display": "Guideline Registry Record"
  }]
}
```

##### Authors and their roles (stricter than the Guideline profile)

On a registry record, every author **must** carry at least one role extension, and there are extra rules:

- Exactly one author must have role `registrant` (invariant `author-registrant-singleton`).
- An author with role `leading` or `contributing` must reference an `Organization` — *not* a `Practitioner` — (invariant `author-leading-contributing-organization`).
- An author cannot have both `leading` and `contributing` roles (invariant `author-leading-vs-contributing-exclusive`).

```json
"author": [
  {
    "reference": "Organization/DGAI",
    "extension": [{
      "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
      "valueCodeableConcept": {
        "coding": [{
          "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
          "code": "leading"
        }]
      }
    }]
  },
  {
    "reference": "Organization/AWMF",
    "extension": [{
      "url": "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
      "valueCodeableConcept": {
        "coding": [{
          "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
          "code": "registrant"
        }]
      }
    }]
  }
]
```

##### AWMF attestation

A registry record can carry an `attester` block whose `party` is `Organization/AWMF`. This is the formal record that AWMF has attested the registration.

```json
"attester": [{
  "mode": "official",
  "party": { "reference": "Organization/AWMF" }
}]
```

#### Lifecycle dates

The registry record has more date fields than the Guideline. Each is an extension on the root, all with `valueDate` (except `effectivePeriod` and `consultationPeriod`, which use `valuePeriod`):

| Concept                   | Extension URL                                                                                       | Value type    |
| ------------------------- | --------------------------------------------------------------------------------------------------- | ------------- |
| Approval date             | `http://hl7.org/fhir/StructureDefinition/composition-approval-date` (see profile for re-slicing)    | `valueDate`   |
| Last review date          | `http://hl7.org/fhir/StructureDefinition/composition-last-review-date`                              | `valueDate`   |
| Effective period          | `http://hl7.org/fhir/StructureDefinition/composition-effective-period`                              | `valuePeriod` |
| Publication date          | `http://hl7.org/fhir/StructureDefinition/composition-publication-date`                              | `valueDate`   |
| First publication date    | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date`                       | `valueDate`   |
| Submission date           | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date`                              | `valueDate`   |
| Registration date         | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date`                            | `valueDate`   |
| Planned completion date   | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date`                      | `valueDate`   |
| Consultation period       | `http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period`                          | `valuePeriod` |

Two conditional rules apply:

- If `status = "preliminary"`, the `consultationPeriod` extension is **required** (invariant `preliminary-composition-needs-consultation-period`).
- If `status = "registered"`, the `plannedCompletionDate` extension and the `releaseType` tag (see below) are both **required** (invariants `registered-composition-needs-planned-completion-date` and `inv-require-release-type-if-registered`).

#### Release type (only when `status = "registered"`)

When you submit a new or updated registration, you must say *what kind* of registration it is. This is carried on `meta.tag` from the [`vs-guideline-release-type`](ValueSet-vs-guideline-release-type.html) value set (e.g. `class-upgrade`, `new-guideline`, …):

```json
"meta": {
  "profile": ["http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s3"],
  "tag": [
    { "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-release-type", "code": "class-upgrade", "display": "Class Upgrade" }
  ]
}
```

#### Contact points (registrant, coordinator, main contact)

Registry records can list structured contact information for up to three roles, modelled as extensions on `extension[extendedContactDetail]`:

| Slice                            | Purpose code                                                              |
| -------------------------------- | ------------------------------------------------------------------------- |
| `extendedContactDetail/registrant`   | `http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point#registrant` |
| `extendedContactDetail/coordinator`  | `…#coordinator`                                                       |
| `extendedContactDetail/mainContact`  | `…#contact`                                                            |

Each contact has a required `name`, a list of `telecom` entries, and an optional `address`. Refer to the rendered [StructureDefinition page](StructureDefinition-guideline-registry-record.html) for the exact extension URL nesting — the profile uses the standard `extendedContactDetail` extension from the EBM IG with these named sub-slices.

#### Attachments

`section[attachments]` is the place where you link out to all the published artefacts that go with the guideline (PDFs, slide decks, patient versions, evidence reports, …). Each entry references a [Guideline Attachment](StructureDefinition-guideline-attachment.html) resource:

```json
"section": [
  {
    "code": { "coding": [{ "system": "https://fevir.net/resources/CodeSystem/179423", "code": "attachments" }] },
    "section": [
      {
        "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "long-version" }] },
        "entry": [ { "reference": "DocumentReference/guideline-020-013-long-version" } ]
      },
      {
        "code": { "coding": [{ "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections", "code": "patient-version" }] },
        "entry": [ { "reference": "DocumentReference/guideline-020-013-patient-version" } ]
      }
    ]
  }
]
```

The named slices available under `attachments` are: `longVersion`, `shortVersion`, `guidelineReport`, `evidenceReport`, `implementationGuidance`, `decisionSupport`, `patientVersion`. You can add more (the slicing is open) — use codes from the [`vs-content-types`](ValueSet-vs-content-types.html) value set.

#### Summary metadata section

`section[summary]` is the "show in the registry" overview block. It can carry several sub-sections, each coded with its own kind:

| Sub-section          | Section code (system `cs-guideline-sections`)                  | Purpose                                                                |
| -------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------- |
| `intention`          | `intention`                                                    | Why this guideline was written.                                        |
| `targetPatientGroup` | `target-patient-group`                                         | Coded target patient group; coded values from `vs-target-patient-group`. |
| `careSetting`        | `care-setting`                                                 | Container; has `encounterType`, `careStage`, `careLevel` sub-sections. |
| `topicSelectionReason` | `topic-selection-reason`                                     | Free text on why the topic was chosen.                                 |
| `targetAudience`     | `target-audience`                                              | Intended users (clinicians, patients, …).                              |
| `keywords`           | `keywords`                                                     | Keywords; one per `ext-section-keyword` extension.                     |

Each of these uses the same `section[language]` multilingual pattern as the Guideline — see [Multilingual content](authoring-guideline.html#multilingual-content-the-sectionlanguage-pattern) on the Guideline page.

#### Linking to the Guideline and to other registry records

| Relationship                       | Slice                                  | `relatesTo.type` | Target                  |
| ---------------------------------- | -------------------------------------- | ---------------- | ----------------------- |
| Related Guideline (the content)    | `similarTo/relatedGuideline`           | `similar-to`     | `Reference(Guideline)`  |
| Dissemination website              | `disseminationWebsite`                 | `documentation`  | `targetReference` to a website resource; classifier from `vs-dissemination-website` |
| Replaces an older guideline        | `replacesGuideline`                    | `replaces`       | `Reference(Guideline)`  |
| Replaced by a newer guideline      | `replacedWithGuideline`                | `replaced-with`  | `Reference(Guideline)`  |

Example linking the registry record to its Guideline content:

```json
"relatesTo": [
  {
    "type": "similar-to",
    "targetReference": { "reference": "Composition/NosokomialePneumonie" },
    "extension": [{
      "url": "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
      "valueCodeableConcept": {
        "coding": [{
          "system": "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
          "code": "related-guideline"
        }]
      }
    }]
  }
]
```

#### Remarks

`note[remark]` holds free-text remarks shown in the registry alongside the guideline. The note must declare its type via the `annotationType` extension (value set [`vs-remark-type`](ValueSet-vs-remark-type.html)).

#### Full worked examples

- AWMF S3, full record: [Composition-NosokomialePneumonieRecord](Composition-NosokomialePneumonieRecord.html)
- AWMF S1, minimal: [Composition-AWMFGuidelineS1Example](Composition-AWMFGuidelineS1Example.html)
- AWMF S2e: [Composition-AWMFGuidelineS2eExample](Composition-AWMFGuidelineS2eExample.html)
- AWMF S2k: [Composition-AWMFGuidelineRecordS2kExample](Composition-AWMFGuidelineRecordS2kExample.html)
- AWMF S3 (minimal): [Composition-AWMFGuidelineRecordS3Example](Composition-AWMFGuidelineRecordS3Example.html)

Source FSH files live under [`input/fsh/registry-record/`](https://github.com/Dissolve-E/awmf-ig/tree/main/input/fsh/registry-record).

{% include link-list.md %}
