Profile: Guideline
Parent: $ebm-guideline // #P2.1.2
Id: Guideline
Title: "Guideline"
Description: "Clinical Practice Guideline"

// TODO: Create a profile for each guideline class (S3, S2k, S2e etc) that inherits from this profile
// TODO: Decide whether to make another AWMF profile that contains all AWMF-specific logic

* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains 
  guideline-releaseType 0..1 // TODO: include awmf in name or not?

* meta.tag[guideline-releaseType] // only used when status = registered // TODO: add invariant
  * system 1..1
  * system = $cs-guideline-releaseType
  * code 1..1


 // TODO: add guideline code for type
 

* title 1..1 // TODO: add description (in the IG - ^definition or so)

// TODO: add ConceptMap for status (e.g., preliminary = "consultation" etc)
// TODO: add description (in the IG - ^definition or so)
* status 1..1 // used for: anmeldung, konsultationsfassung, amemdment, final // #P2.2.9


// BUG: this slicing yields a validator error when inheriting from any profile that contains an extension, but if the
// extension is defined directly here, it works (i.e. incorporating this slicing into the parent profile) - validator bug?
// see https://chat.fhir.org/#narrow/channel/179252-IG-creation/topic/Reslicing.20extensions.20causes.20validator.20errors
* extension contains 
  ext-artifact-extended-contact named contact 0..* MS
  and ext-publication-date named publicationDate 0..1 MS
  and ext-first-publication-date named firstPublicationDate 0..1 MS
  and ext-submission-date named submissionDate 0..1 MS
  and ext-consultation-period named consultationPeriod 0..1 MS
  and ext-planned-completion-date named plannedCompletionDate 0..1 MS
  and ext-registration-date named registrationDate 0..1 MS

* extension ^slicing.discriminator[1].type = #value
* extension ^slicing.discriminator[=].path = "value.ofType(ExtendedContactDetail).purpose"

* extension[contact] contains 
  registrant 0..1 MS 
  and coordinator 0..* MS 
  and mainContact 0..1 MS

* extension[contact].valueExtendedContactDetail
  * purpose 1..1
* extension[contact][registrant].valueExtendedContactDetail
  * purpose = cs-contact-point#registrant
  * purpose 1..1
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1
* extension[contact][coordinator].valueExtendedContactDetail
  * purpose = cs-contact-point#coordinator
  * purpose 1..1
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1
* extension[contact][mainContact].valueExtendedContactDetail
  * purpose = cs-contact-point#contact
  * purpose 1..1
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1

// TODO: Should we use ProvenanceResource for activities such as review, approval, publication etc, instead of extensions for dates?
* extension[lastReviewDate] // MAGIC-AWMF: lastEdit, AWMF: "Aktueller Stand" // #P2.3.1.9
  * ^definition = "The date on which the guideline was last reviewed." // TODO: check definition
  * ^short = "Last Review Date"
  * valueDate

* extension[approvalDate] // MAGIC-AWMF: ..., AWMF: "Freigegeben am"
  * ^definition = "The date on which the guideline was approved." // TODO: check definition
  * ^short = "Approval Date"
  * valueDate

* extension[effectivePeriod] // MAGIC-AWMF: validUntilDate, AWMF: "Gültig bis"  // #P2.3.1.9
  * ^definition = "The period during which the guideline is intended to be in use." // TODO: check definition
  * ^short = "Effective Period"
  * valuePeriod
    * end 0..1 MS

* extension[publicationDate] // MAGIC-AWMF: releaseDate, AWMF: "Eingestellt am"  // #P2.3.1.9
  * ^definition = "The date on which the current version of the guideline was published." // TODO: check definition
  * ^short = "Publication Date"
  * valueDate

* extension[firstPublicationDate] // MAGIC-AWMF: publishedDate, AWMF: "Veröffentlicht seit"  // #P2.3.1.9
  * ^definition = "The date on which the guideline was first published in its initial version." // TODO: check definition
  * ^short = "First Publication Date"
  * valueDate

* extension[submissionDate] // MAGIC-AWMF: submittedDate, AWMF: "Eingereicht am" // #P2.3.1.10
  * ^definition = "The date on which this version of the guideline was submitted for publication." // TODO: check definition
  * ^short = "Submission Date"
  * valueDate

* extension[plannedCompletionDate] // MAGIC-AWMF: plannedCompletionDate, AWMF: "Geplante Fertigstellung" // #P2.3.1.10
  * ^definition = "The date on which the guideline is planned to be completed." // TODO: check definition
  * ^short = "Planned Completion Date"
  * valueDate

* extension[consultationPeriod] // MAGIC-AWMF: consultation[*]Date, AWMF: "" // #P2.3.1.10
  * ^definition = "The period during which the guideline is open for consultation." // TODO: check definition
  * ^short = "Consultation Period"
  * valuePeriod

* extension[registrationDate] // MAGIC-AWMF: startDate, AWMF: "Datum der Anmeldung" // #P2.3.1.10
  * ^definition = "The date on which the guideline was registered." // TODO: check definition
  * ^short = "Registration Date"
  * valueDate

* date // #P2.3.1.9
  * ^definition = "Modification date of the Composition contents. Does not represent the publication, last review or approval date." // TODO: check definition
  * ^short = "Modification Date"

// TODO: add invariant to allow "registrant" only 1..1 and disallow role = contributing & leading
* author only Reference(GuidelineAuthorRole or Organization) // #P2.3.1.4
* author.extension contains ext-guideline-author-role named role 1..* // #P2.3.1.4

// TODO: describe what the official identifier is and that it shouldn't be changed
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open // #P2.2.1
* identifier contains awmf-register-number 0..1
* identifier[awmf-register-number]
  * system 1..1
  * system = "http://fhir.awmf.org/register" // TODO: agree on system
  * value 1..1
* identifier obeys inv-require-official-identifier // #P2.2.1, #P2.2.3

* version 1..1 // #P2.2.1
* version obeys inv-version-major-minor // #P2.2.1, #P2.2.8

* relatesTo ^slicing.discriminator.type = #value
* relatesTo ^slicing.discriminator.path = "type"
* relatesTo ^slicing.rules = #open
* relatesTo contains 
  relatedGuideline 0..* 
  and disseminationWebsite 0..* 
  and predecessorGuideline 0..* // #P2.3.1.8
  and successorGuideline 0..* // #P2.3.1.8
* relatesTo[relatedGuideline]
  * type 1..1
  * type = #similar-to
  * classifier 1..1
  * classifier = cs-related-artifact-types#related-guideline
* relatesTo[disseminationWebsite]
  * type 1..1
  * type = #documents
  * classifier 1..1
  * classifier = cs-related-artifact-types#dissemination-website  // TODO:  allow children of this code (e.g. awmf-detail-page )
* relatesTo[predecessorGuideline] 
  * type 1..1
  * type = #replaces
  * resourceReference 1..1
  * resourceReference only Reference(Guideline)
* relatesTo[successorGuideline]
  * type 1..1
  * type = #replaced-by
  * resourceReference 1..1
  * resourceReference only Reference(Guideline)

// BUG: This slicing is currently not working
* note.extension contains $ext-annotationType named type 1..1
* note ^slicing.discriminator.type = #value
* note ^slicing.discriminator.path = "extension.where(url='http://hl7.org/fhir/StructureDefinition/annotationType').value"
* note ^slicing.rules = #open
* note contains remark 0..1 
* note[remark] // #P2.3.1.1, #P2.3.1.6
  * extension[type].valueCodeableConcept 1..1
  * extension[type].valueCodeableConcept from vs-remark-type (required)
  * text 1..1


* category 0..*
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "coding"
  * ^slicing.rules = #open
* category contains awmfGuidelineClass 0..1
* category[awmfGuidelineClass]
  * coding from vs-awmf-guideline-class (required)
    * system 1.. MS
    * code 1.. MS

* attester 0..*
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "party"
  * ^slicing.rules = #open
* attester contains AWMF 0..1
* attester[AWMF] // #P2.3.1.2
  * mode 1..1
  * mode = #official
  * party 1..1
  * party = Reference(AWMF)

* section[summary]
  * section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code"
  * section ^slicing.rules = #open
  * section contains 
    intention 0..1
    and targetPatientGroup 0..1
    and careSetting 0..*
    and topicSelectionReason 0..1
    and targetAudience 0..1
    and keywords 0..*
  * section[intention]
    * code.coding 1..1
    * code.coding = cs-guideline-sections#intention "Intention"
    * text 1..1
  * section[careSetting]
    * code.coding 1..1
    * code.coding = cs-guideline-sections#care-setting "Care Setting"
    * section ^slicing.discriminator.type = #value
    * section ^slicing.discriminator.path = "code"
    * section ^slicing.rules = #open
    * section contains careSetting 0..1 and careStage 0..1 and careLevel 0..1
    // versorgungssektor, versorgungsabschnitt, versorgungsebene
    * section[careSetting]
      * code.coding 1..1
      * code.coding = cs-guideline-sections#encounter-type "Encounter Type"
      // ambulant, stationär, teilstationär
      * extension contains ext-section-coding named value 0..*
      * extension[value]
        * valueCodeableConcept 1..1
        * valueCodeableConcept from vs-encounter-type (extensible)
    * section[careStage]
      * code.coding 1..1
      * code.coding = cs-guideline-sections#care-stage "Care Stage"
      // Präventation, Früherkennung, Diagnose, Therapie, Rehabilitation
      * extension contains ext-section-coding named value 0..*
      * extension[value]
        * valueCodeableConcept 1..1
        * valueCodeableConcept from vs-care-stage (extensible)
    * section[careLevel]
      * code.coding 1..1
      * code.coding = cs-guideline-sections#care-level "Care Level"
      // primärärztliche Vesorgung, spezialärztliche Versorgung
      * extension contains ext-section-coding named value 0..*
      * extension[value]
        * valueCodeableConcept 1..1
        * valueCodeableConcept from vs-care-level (extensible)
  * section[topicSelectionReason]
    * code.coding 1..1
    * code.coding = cs-guideline-sections#topic-selection-reason "Topic Selection Reason"
    * text 1..1
  * section[targetPatientGroup]
    * code.coding 1..1
    * code.coding = cs-guideline-sections#target-audience "Target Audience"
    // Erwachsene, Kinder/Jugendliche
    * extension contains ext-section-coding named value 0..*
    * extension[value]
      * valueCodeableConcept 1..1
      * valueCodeableConcept from vs-target-patient-group (extensible)
    * text 0..1
  * section[targetAudience]
    * text 1..1
  * section[keywords]
    * text 1..1


* section contains attachments 0..1 MS
* section[attachments] // #P2.1.6
  * code
    * coding = $cs-awmf#attachments "Attachments"
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
    * code from vs-guideline-attachment-types (preferred) // #P2.1.7 (preferred binding)
    * entry only Reference(GuidelineAttachment)
    * entry 1..1 MS
  * section[longVersion]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#long-version "Long Version"
  * section[shortVersion]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#short-version "Short Version"
  * section[evidenceReport]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#evidence-report "Evidence Report"
  * section[implementationGuidance]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#implementation-guidance "Implementation Guidance"
  * section[decisionSupport]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#decision-support "Decision Support"
  * section[patientVersion]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#patient-version "Patient Version"
    
  * section obeys inv-guideline-attachment-type-match
// gl 250213: currently unused, and somehow breaks ig publisher, therefore commented out
// * section
//   * orderedBy = cs-awmf#ordered-by-authors "Ordered by authors"
//   * section ^slicing.discriminator.type = #value
//   * section ^slicing.discriminator.path = "code.coding"
//   * section ^slicing.rules = #open
//   * section contains 
//     introduction 0..1 MS 
//     and discussion 0..1 MS 
//     and methods 0..1 MS 
//     and references 0..1 MS 
//     and competingInterests 0..1 MS 
//     and acknowledgements 0..1 MS 
//     and appendices 0..1 MS
//     and recommendations 0..1 MS
//   * section.code 1..1
//   * section[introduction].code.coding 1..1
//   * section[introduction].code.coding = https://fevir.net/resources/CodeSystem/179423#introduction "Introduction"
//   * section[discussion].code.coding 1..1
//   * section[discussion].code.coding = https://fevir.net/resources/CodeSystem/179423#discussion "Discussion"
//   * section[methods].code.coding 1..1
//   * section[methods].code.coding = https://fevir.net/resources/CodeSystem/179423#methods "Methods"
//   * section[references].code.coding 1..1
//   * section[references].code.coding = https://fevir.net/resources/CodeSystem/179423#references "References"
//   * section[references]
//     * entry only Reference(Citation)
    
//   * section[competingInterests].code.coding 1..1
//   * section[competingInterests].code.coding = https://fevir.net/resources/CodeSystem/179423#competing-interests "Competing Interests"
//   * section[acknowledgements].code.coding 1..1
//   * section[acknowledgements].code.coding = https://fevir.net/resources/CodeSystem/179423#acknowledgements "Acknowledgements"
//   * section[appendices].code.coding 1..1
//   * section[appendices].code.coding = https://fevir.net/resources/CodeSystem/179423#appendices "Appendices"
//   * section[recommendations].code.coding 1..1
//   * section[recommendations].code.coding = https://fevir.net/resources/CodeSystem/179423#recommendations "Recommendations"
//   * section[recommendations]
//     * entry only Reference(Recommendation)
// // TODO: create profiles for S3, S2k, S2e etc guidelines, inheriting from guideline profile

Invariant: inv-guideline-attachment-type-match
Description: "Attachment type in DocumentReference must match the type of the section"
Expression: "reference.resolve()[type=$this.code].exists()"
Severity: #error

/*
Instance: Guideline-example
InstanceOf: Guideline
* status = #preliminary
* date = "2024-12-05"
* author.display = "Dissolve-E Team"
* title = "Beispiel-Leitlinie"
* section[attachments]
  * section[+]
    * code = cs-guideline-attachment-types#long-version
    * title = "Langversion"
    * entry = Reference(DocumentReferenceLongVersionOfThisGuideline)
  * section[+]
    * code = cs-guideline-attachment-types#short-version
    * entry = Reference(DocumentReferenceShortVersionOfThisGuideline)
  * section[+]
    * code = cs-guideline-attachment-types#patient-version
    * entry = Reference(DocumentReferencePatientVersionOfThisGuideline)

* section[introduction]
  * text 
    * status = #generated
    * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Das ist die Einleitung dieser Leitlinie</div>"
* section[+] // custom section
  * text 
    * status = #generated
    * div = "
      <div xmlns=\"http://www.w3.org/1999/xhtml\">
        <div lang='en'>Das ist Kapitel 2 zum Thema spezifische Empfehlungen</div>
        <div lang='de'>Das ist Kapitel 2 zum Thema spezifische Empfehlungen</div>
      </div>
      "
  * section[introduction]
    * text
      * status = #generated
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Einleitung zu Kapitel 2</div>"
  * section[discussion]
    * text 
      * status = #generated
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Diskussion zu Kapitel 2</div>"
  * section[recommendations]
    * entry[+].display = "Spezifische Empfehlung 1"
    * entry[+].display = "Spezifische Empfehlung 2"
* section[recommendations]
  * entry[+].display = "Allgemeine Empfehlung 3"
  * entry[+].display = "Allgemeine Empfehlung 4"
*/