Profile: AWMFGuidelineRegistryRecord
Parent: $ebm-evidence-report // do not use Guideline or EvidenceReportPackage as parent, because these have already "content" sections that we do not need
Id: guideline-registry-record
Title: "Guideline Registry Record"
Description: "Guideline Registry Record containing metadata and registry-specific information for a clinical practice guideline."

// TODO: Decide whether to make another AWMF profile that contains all AWMF-specific logic [all, after workshop]

* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "$this"
* meta.tag ^slicing.rules = #open
* meta.tag contains 
  guideline-releaseType 0..1

// leading and contributing authors SHALL be Organizations
* obeys author-leading-contributing-organization

* attester 0..*
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "party.reference"
  * ^slicing.rules = #open
* attester contains AWMF 0..1
* attester[AWMF] // #P2.3.1.2
  * mode 1..1
  * mode = $cs-composition-attestation-mode#official
  * party 1..1
  * party.reference 1..1
  * party.reference = "Organization/AWMF"

// only used when status = registered 
* meta.tag[guideline-releaseType] from vs-guideline-release-type (required)
* obeys inv-require-release-type-if-registered

* language 0..1 MS

* title 1..1
* title ^definition = "Title of the Guideline"
// TODO: add description of this status in HTML page of the profile [@glichtner]
* status 1..1 // used for: anmeldung, konsultationsfassung, amendment, final // #P2.2.9
* status ^definition = "Workflow status of the guideline from registration to publication or deprecation. Please note that the ValueSet 'http://hl7.org/fhir/ValueSet/composition-status' is required; We therefore created the ConceptMap 'FHIRStatusToAWMFStatus' to store the mapping to the AWMF status values."


* type = cs-awmf#guideline-registry-record "Guideline Registry Record"

* extension contains 
  ext-first-publication-date named firstPublicationDate 0..1 MS
  and ext-submission-date named submissionDate 0..1 MS
  and ext-consultation-period named consultationPeriod 0..1 MS
  and ext-planned-completion-date named plannedCompletionDate 0..1 MS
  and ext-registration-date named registrationDate 0..1 MS
// NOTE: We avoid re-slicing the existing 'extendedContactDetail' slice from the EBM IG here,
// as the IG Publisher currently throws a "named items are out of order in the slice" error
// when attempting to do so. 
//
// As a workaround, we redefine the 'extendedContactDetail' extension under a new slice name
// ('extContactDetail') and apply slicing there. This avoids the snapshot generation error
// and preserves the intended semantics.
//
// It's unclear whether this restriction is intended behavior or a limitation in the IG Publisher.
  //and $ext-extended-contact-detail named extContactDetail 0..* MS


// TODO: Use guideline-registration extension instead? https://build.fhir.org/ig/HL7/ebm/en/StructureDefinition-guideline-registration.html
/*
* extension[registrationStatus] ^slicing.discriminator[+].type = #value
* extension[registrationStatus] ^slicing.discriminator[=].path = "slice('activity').valueCodeableConcept"
* extension[registrationStatus] ^slicing.rules = #open
* extension[registrationStatus] contains 
  firstPublicationDate 0..1
  and submissionDate 0..1
  and consultationPeriod 0..1
  and plannedCompletionDate 0..1
  and registrationDate 0..1
  and lastReviewDate  0..1
  and publishedDate 0..1
  and effectivePeriod 0..1

* extension[registrationDate][firstPublicationDate][activity].valueCodeableConcept = $cs-cirted-artifact-status-type#
* extension[registrationDate][submissionDate][activity].valueCodeableConcept = $cs-cited-artifact-status-type#submitted	"Submitted"
* extension[registrationDate][consultationPeriod][activity].valueCodeableConcept = $cs-cited-artifact-status-type#under-review "Under review"
* extension[registrationDate][plannedCompletionDate][activity].valueCodeableConcept = $cs-cited-artifact-status-type#
* extension[registrationDate][registrationDate][activity].valueCodeableConcept = $cs-cited-artifact-status-type#
*/


* extension[extendedContactDetail] contains 
  registrant 0..1 MS 
  and coordinator 0..* MS 
  and mainContact 0..1 MS

* extension[extendedContactDetail].valueExtendedContactDetail
  * purpose 1..1
* extension[extendedContactDetail][registrant].valueExtendedContactDetail
  * purpose = cs-contact-point#registrant
  * purpose 1..1
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1
* extension[extendedContactDetail][coordinator].valueExtendedContactDetail
  * purpose = cs-contact-point#coordinator
  * purpose 1..1
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1
* extension[extendedContactDetail][mainContact].valueExtendedContactDetail
  * purpose = cs-contact-point#contact
  * purpose 1..1
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1

// TODO: Should we use ProvenanceResource for activities such as review, approval, publication etc, instead of extensions for dates?[(Discussion Point for Workshop]
* extension[lastReviewDate] // MAGIC-AWMF: lastEdit, AWMF: "Aktueller Stand" // #P2.3.1.9
  * ^definition = "The date on which the guideline was last updated."
  * ^short = "Last Review Date"
  * valueDate 1..1

* extension[approvalDate] // MAGIC-AWMF: ..., AWMF: "Freigegeben am"
  * ^definition = "The date on which the guideline was approved by the publisher."
  * ^short = "Approval Date"
  * valueDate 1..1

* extension[effectivePeriod] // MAGIC-AWMF: validUntilDate, AWMF: "Gültig bis"  // #P2.3.1.9
  * ^definition = "The period during which the guideline is intended to be in use."
  * ^short = "Effective Period"
  * valuePeriod 1..1
    * end 1..1 MS

* extension[publicationDate] // MAGIC-AWMF: releaseDate, AWMF: "Eingestellt am"  // #P2.3.1.9
  * ^definition = "The date on which the current version of the guideline was published."
  * ^short = "Publication Date"
  * valueDate 1..1

* extension[firstPublicationDate] // MAGIC-AWMF: publishedDate, AWMF: "Veröffentlicht seit"  // #P2.3.1.9
  * ^definition = "The date on which the guideline was first published in its initial version."
  * ^short = "First Publication Date"
  * valueDate 1..1

* extension[submissionDate] // MAGIC-AWMF: submittedDate, AWMF: "Eingereicht am" // #P2.3.1.10
  * ^definition = "The date on which this version of the guideline was submitted for publication."
  * ^short = "Submission Date"
  * valueDate 1..1

* extension[plannedCompletionDate] // MAGIC-AWMF: plannedCompletionDate, AWMF: "Geplante Fertigstellung" // #P2.3.1.10
  * ^definition = "The date on which the guideline is planned to be completed."
  * ^short = "Planned Completion Date"
  * valueDate 1..1
// required for status=#registered
* obeys registered-composition-needs-planned-completion-date

* extension[consultationPeriod] // MAGIC-AWMF: consultation[*]Date, AWMF: "" // #P2.3.1.10
  * ^definition = "The period during which the guideline is open for consultation."
  * ^short = "Consultation Period"
  * valuePeriod 1..1
// require for status=#preliminary 
* obeys preliminary-composition-needs-consultation-period


* extension[registrationDate] // MAGIC-AWMF: startDate, AWMF: "Datum der Anmeldung" // #P2.3.1.10
  * ^definition = "The date when the guideline registration was submitted."
  * ^short = "Registration Date"
  * valueDate 1..1

* date // #P2.3.1.9
  * ^definition = "Modification date of the Composition contents. Does not represent the publication, last review or approval date."
  * ^short = "Modification Date"

* author only Reference(GuidelineAuthorRole or Organization) // #P2.3.1.4
* author.extension contains ext-guideline-author-role named role 1..* // #P2.3.1.4
// "registrant" only 1..1 and disallow role = contributing & leading
* obeys author-registrant-singleton
* obeys author-leading-vs-contributing-exclusive

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open // #P2.2.1
* identifier contains awmf-register-number 0..1
* identifier[awmf-register-number]
  * system 1..1
  * system = "http://fhir.awmf.org/guidelines"
  * value 1..1
* identifier 1..*
* obeys inv-require-official-identifier // #P2.2.1, #P2.2.3

* version 1..1 // #P2.2.1, #P2.2.7
* version obeys inv-version-major-minor // #P2.2.1, #P2.2.8
* extension[versionAlgorithm].valueCoding = cs-awmf#major-minor "Major-Minor Versioning"

* relatesTo.extension contains  ext-relates-to-label named label 0..1 
  // todo: use attachment with label instead or targetReference.display
* relatesTo ^slicing.discriminator.type = #value
* relatesTo ^slicing.discriminator.path = "type"
* relatesTo ^slicing.rules = #open
* relatesTo contains 
  relatedGuideline 0..*
  and disseminationWebsite 0..* 
  and replacesGuideline 0..* // #P2.3.1.8
  and replacedWithGuideline 0..* // #P2.3.1.8
* relatesTo[relatedGuideline]
  * type 1..1
  * type = #similar-to
  * extension[classifier] 1..1
  * extension[classifier].valueCodeableConcept = cs-related-artifact-types#related-guideline 
      // TODO: use code that exists "Guideline" -> no need to have this code system here
* relatesTo[disseminationWebsite]
  * type 1..1
  * type = #documentation
  * extension[classifier] 1..1
  * extension[classifier].valueCodeableConcept from vs-dissemination-website (required)
* relatesTo[replacesGuideline]
  * type 1..1
  * type = #replaces
  * targetReference 1..1
  * targetReference only Reference(Guideline)
* relatesTo[replacedWithGuideline]
  * type 1..1
  * type = #replaced-with
  * targetReference 1..1
  * targetReference only Reference(Guideline)

* note.extension contains $ext-annotationType named type 1..1
* note ^slicing.discriminator.type = #value
* note ^slicing.discriminator.path = "extension('http://hl7.org/fhir/StructureDefinition/annotationType').value"
* note ^slicing.rules = #open
* note contains remark 0..1 
* note[remark] // #P2.3.1.1, #P2.3.1.6
  * extension[type].valueCodeableConcept 1..1
  * extension[type].valueCodeableConcept from vs-remark-type (required)
  * text 1..1

// TODO: discuss whether to move this into AWMF Guideline profile? [all, after workshop]
* category 0..*
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "coding"
  * ^slicing.rules = #open
* category contains awmfGuidelineClass 0..1
* category[awmfGuidelineClass]
  * coding from vs-awmf-guideline-class (required)
    * system 1.. MS
    * code 1.. MS

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #closed
* section contains 
  summary 0..1 MS
  and attachments 0..1 MS
  and consensusProtocol 0..*

* section[summary]
  * code = $cs-ebm-ig#summary "Summary"
  * code 1..1
    * coding = $cs-ebm-ig#summary "Summary"
    * coding 1..1
  * section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code"
  * section ^slicing.rules = #open
  * section contains 
    intention 0..1 // TODO: do these entries have to exist ALWAYS (at registration time?)
    and targetPatientGroup 0..1
    and careSetting 0..*
    and topicSelectionReason 0..1
    and targetAudience 0..1
    and keywords 0..*
  * section[intention]
    * code 1..1
    * code = cs-guideline-sections#intention "Intention"
    * text 0..0 // text is contained in the language subsection
    * insert rs-language-section
  * section[careSetting]
    * code 1..1
    * code = cs-guideline-sections#care-setting "Care Setting"
    * section ^slicing.discriminator.type = #value
    * section ^slicing.discriminator.path = "code"
    * section ^slicing.rules = #closed
    * section contains careSetting 0..1 and careStage 0..1 and careLevel 0..1
    // versorgungssektor, versorgungsabschnitt, versorgungsebene
    * section[careSetting]
      * code 1..1
      * code = cs-guideline-sections#encounter-type "Encounter Type"
      // ambulant, stationär, teilstationär
      * extension contains ext-section-coding named value 0..*
      * extension[value]
        * valueCodeableConcept 1..1
        * valueCodeableConcept from vs-encounter-type (extensible)
      * insert rs-language-section
    * section[careStage]
      * code 1..1
      * code = cs-guideline-sections#care-stage "Care Stage"
      // Präventation, Früherkennung, Diagnose, Therapie, Rehabilitation
      * extension contains ext-section-coding named value 0..*
      * extension[value]
        * valueCodeableConcept 1..1
        * valueCodeableConcept from vs-care-stage (extensible)
      * insert rs-language-section
    * section[careLevel]
      * code 1..1
      * code = cs-guideline-sections#care-level "Care Level"
      // primärärztliche Vesorgung, spezialärztliche Versorgung
      * extension contains ext-section-coding named value 0..*
      * extension[value]
        * valueCodeableConcept 1..1
        * valueCodeableConcept from vs-care-level (extensible)
      * insert rs-language-section
  * section[topicSelectionReason]
    * code 1..1
    * code = cs-guideline-sections#topic-selection-reason "Topic Selection Reason"
    * text 0..0 // text is contained in the language subsection
    * insert rs-language-section
  * section[targetPatientGroup]
    * code 1..1
    * code = cs-guideline-sections#target-patient-group "Target Patient Group"
    // Erwachsene, Kinder/Jugendliche
    * extension contains ext-section-coding named value 0..*
    * extension[value]
      * valueCodeableConcept 1..1
      * valueCodeableConcept from vs-target-patient-group (extensible)
    * text 0..0 // text is contained in the language subsection
    * insert rs-language-section
  * section[targetAudience]
    * code 1..1
    * code = cs-guideline-sections#target-audience "Target Audience"
    * text 0..0  // text is contained in the language subsection
    * insert rs-language-section
  * section[keywords]
    * code 1..1
    * text 0..0 // text is contained in the language subsection
    * code = cs-guideline-sections#keywords "Keywords"
    * insert rs-language-section
    * extension contains ext-section-keyword named keyword 0..*


* section[attachments] // #P2.1.6
  * code = $cs-ebm-ig#attachments "Attachments"
  * code 1..1
    * coding = $cs-ebm-ig#attachments "Attachments"
    * coding 1..1
  * section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code"
  * section ^slicing.rules = #open
  * section contains 
    longVersion 0..1 
    and shortVersion 0..1
    and guidelineReport 0..1
    and evidenceReport 0..*
    and implementationGuidance 0..*
    and decisionSupport 0..*
    and patientVersion 0..*
    // further sections are not defined explicitly, to highlight that they are optional
  * section 1..*
    * code from vs-content-types (preferred) // #P2.1.7 (preferred binding)
    * entry only Reference(GuidelineAttachment)
    * entry 1..* MS
    * obeys inv-guideline-attachment-type-match // TODO: does currently not seem to work (doesn't resolve the references - maybe in the IG publisher?) [@gregor]
  * section[longVersion]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#long-version "Long Version"
  * section[shortVersion]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#short-version "Short Version"
  * section[guidelineReport]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#guideline-report "Guideline Report"
  * section[evidenceReport]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#evidence-report "Evidence Report"
  * section[implementationGuidance]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#implementation-guidance "Implementation Guidance"
  * section[decisionSupport]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#decision-support "Decision Support"
  * section[patientVersion]
    * code 1..1
    * code.coding 1..1
    * code = cs-guideline-sections#patient-version "Patient Version"

* section[consensusProtocol]
  * code = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * code 1..1
    * coding = cs-guideline-sections#consensus-protocol "Consensus Protocol"
    * coding 1..1
  * insert rs-language-section-nested


Instance: GuidelineRegistryRecordExample
InstanceOf: guideline-registry-record
Usage: #example
Title: "Guideline Registry Record Example"
Description: "An example of a guideline registry record."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvRequireOfficialId-NoOfficialId-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: No Official Identifier (Should Fail)"
Description: "Tests that inv-require-official-identifier fails when no official identifier is present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #secondary


Instance: RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Two Official Identifiers (Should Fail)"
Description: "Tests that inv-require-official-identifier fails when two official identifiers are present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example2"
  * use = #official


Instance: RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Release Type If Registered (Should Pass)"
Description: "Tests that inv-require-release-type-if-registered passes when release type is present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #registered
* extension[plannedCompletionDate].valueDate = "2025-03-06"
* meta.tag[guideline-releaseType] = cs-guideline-release-type#class-upgrade "Class Upgrade"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Release Type Wrong Code (Should Fail)"
Description: "Tests that inv-require-release-type-if-registered fails when release type code is invalid."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #registered
* extension[plannedCompletionDate].valueDate = "2025-03-06"
* meta.tag[guideline-releaseType] = cs-awmf#major-minor "Major-Minor Versioning"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Release Type No Tag (Should Fail)"
Description: "Tests that inv-require-release-type-if-registered fails when release type tag is missing."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #registered
* extension[plannedCompletionDate].valueDate = "2025-03-06"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Version Major.Minor.Patch (Should Fail)"
Description: "Tests that inv-version-major-minor fails when version has three parts."
* insert narrative([[Guideline Example]])
* version = "2.0.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Version with Prefix (Should Fail)"
Description: "Tests that inv-version-major-minor fails when version has 'v' prefix."
* insert narrative([[Guideline Example]])
* version = "v2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Version as Text (Should Fail)"
Description: "Tests that inv-version-major-minor fails when version is text."
* insert narrative([[Guideline Example]])
* version = "zweiteVersion"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official
* extension[plannedCompletionDate].valueDate = "2025-03-06"


Instance: RR-TestTestInvRegCompNeedsPlannedComplDate-NoDate-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Registered Without Planned Completion Date (Should Fail)"
Description: "Tests that registered-composition-needs-planned-completion-date fails when date is missing."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #registered
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* meta.tag[guideline-releaseType] = cs-guideline-release-type#class-upgrade "Class Upgrade"
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

Instance: RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Registered With Planned Completion Date (Should Pass)"
Description: "Tests that registered-composition-needs-planned-completion-date passes when date is present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #registered
* meta.tag[guideline-releaseType] = cs-guideline-release-type#class-upgrade "Class Upgrade"
* extension[plannedCompletionDate].valueDate = "2025-03-06"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

Instance: RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Preliminary With Consultation Period (Should Pass)"
Description: "Tests that preliminary-composition-needs-consultation-period passes when period is present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #preliminary
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official
* extension[consultationPeriod].valuePeriod
  * start = "2025-03-06"
  * end = "2025-03-07"


Instance: RR-TestTestInvPrelimCompNeedsConsultPeriod-NoDate-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Preliminary Without Consultation Period (Should Fail)"
Description: "Tests that preliminary-composition-needs-consultation-period fails when period is missing."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #preliminary
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvAuthorRegistrantSingleton-SHOULD-PASS
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Single Registrant Author (Should Pass)"
Description: "Tests that author-registrant-singleton passes when exactly one registrant is present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

Instance: RR-TestTestInvAuthorRegistSingleton-NoRegistrant-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: No Registrant Author (Should Fail)"
Description: "Tests that author-registrant-singleton fails when no registrant is present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: RR-TestTestInvAuthorRegistSingleton-TwoRegistrants-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Two Registrant Authors (Should Fail)"
Description: "Tests that author-registrant-singleton fails when two registrants are present."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

Instance: RR-TestTestInvAuthorLeadVsContrExclusive-Both-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Test: Author Both Leading and Contributing (Should Fail)"
Description: "Tests that author-leading-vs-contributing-exclusive fails when author has both roles."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role][+].valueCodeableConcept = cs-guideline-author-role#leading
* author[=].extension[ext-guideline-author-role][+].valueCodeableConcept = cs-guideline-author-role#contributing
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

Instance: RR-TestInvLeadingAuthorRefPerson-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Guideline with leading author referencing Practitioner (fails invariant)"
Description: "Fails because the leading author points to a Practitioner instead of an Organization."
* version = "1.0"
* status = #final
* date = "2025-06-17"
* title = "Leading Author Practitioner Fail"
* identifier[awmf-register-number][+]
  * value = "888-001"
  * use = #official

* author[+] = Reference(GuidelineAuthorRoleExample)                // <– Practitioner
* author[=].extension[ext-guideline-author-role].valueCodeableConcept
    = cs-guideline-author-role#leading

Instance: RR-TestInvContribAuthorRefPerson-SHOULD-FAIL
InstanceOf: guideline-registry-record
Usage: #example
Title: "Guideline with contributing author referencing Practitioner (fails invariant)"
Description: "Fails because the contributing author points to a Practitioner instead of an Organization."
* version = "1.0"
* status = #final
* date = "2025-06-17"
* title = "Contributing Author Practitioner Fail"
* identifier[awmf-register-number][+]
  * value = "888-002"
  * use = #official

* author[+] = Reference(GuidelineAuthorRoleExample)                // <– Practitioner
* author[=].extension[ext-guideline-author-role].valueCodeableConcept
    = cs-guideline-author-role#contributing

Instance: RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS
InstanceOf: guideline-registry-record
Usage: #example
Title: "Guideline with leading author referencing Organization (passes invariant)"
Description: "Passes because the leading author points to an Organization."
* version = "1.0"
* status = #final
* date = "2025-06-17"
* title = "Leading Author Organization Pass"
* identifier[awmf-register-number][+]
  * value = "888-003"
  * use = #official

* author[+] = Reference(DGAI)            // <– Organization
* author[=].extension[ext-guideline-author-role].valueCodeableConcept
    = cs-guideline-author-role#leading
