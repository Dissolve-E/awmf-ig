Profile: Guideline
Parent: $ebm-guideline // #P2.1.2
Id: guideline
Title: "Guideline"
Description: "Clinical Practice Guideline"

// TODO: Create a profile for each guideline class (S3, S2k, S2e etc) that inherits from this profile [@glichtner]
// TODO: Decide whether to make another AWMF profile that contains all AWMF-specific logic [all, after workshop]

* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains 
  guideline-releaseType 0..1

// only used when status = registered // TODO: add invariant
* meta.tag[guideline-releaseType] from vs-guideline-release-type (required)

* language 0..1 MS

* title 1..1 // TODO: add description (in the IG - ^definition or so) [@sophie]

// TODO: add ConceptMap for status (e.g., preliminary = "consultation" etc) [@sophie] - we need the list of codes from AWMF first [@starlinger]
// TODO: add description (in the IG - ^definition or so) [@sophie]
// TODO: add description of this status in HTML page of the profile [@glichtner]
* status 1..1 // used for: anmeldung, konsultationsfassung, amendment, final // #P2.2.9

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

* extension[plannedCompletionDate] // MAGIC-AWMF: plannedCompletionDate, AWMF: "Geplante Fertigstellung" // #P2.3.1.10 // TODO: nur bei status=#registered (use invariant) [@glichtner]
  * ^definition = "The date on which the guideline is planned to be completed."
  * ^short = "Planned Completion Date"
  * valueDate 1..1

* extension[consultationPeriod] // MAGIC-AWMF: consultation[*]Date, AWMF: "" // #P2.3.1.10 // TODO: nur bei status=#preliminary (use invariant) [@glichtner]
  * ^definition = "The period during which the guideline is open for consultation."
  * ^short = "Consultation Period"
  * valuePeriod 1..1

* extension[registrationDate] // MAGIC-AWMF: startDate, AWMF: "Datum der Anmeldung" // #P2.3.1.10
  * ^definition = "The date when the guideline registration was submitted."
  * ^short = "Registration Date"
  * valueDate 1..1

* date // #P2.3.1.9
  * ^definition = "Modification date of the Composition contents. Does not represent the publication, last review or approval date."
  * ^short = "Modification Date"

// TODO: add invariant to allow "registrant" only 1..1 and disallow role = contributing & leading [@glichtner]
* author only Reference(GuidelineAuthorRole or Organization) // #P2.3.1.4
* author.extension contains ext-guideline-author-role named role 1..* // #P2.3.1.4

// TODO: describe what the official identifier is and that it shouldn't be changed -> html seite des Profiles im implementation guides [@glichtner]
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open // #P2.2.1
* identifier contains awmf-register-number 0..1
* identifier[awmf-register-number]
  * system 1..1
  * system = "http://fhir.awmf.org/guidelines"
  * value 1..1
* identifier obeys inv-require-official-identifier // #P2.2.1, #P2.2.3
* identifier 1..*

* version 1..1 // #P2.2.1, #P2.2.7
* version obeys inv-version-major-minor // #P2.2.1, #P2.2.8
* extension[versionAlgorithm].valueCoding = $cs-awmf#major-minor "Major-Minor Versioning"

* relatesTo.extension contains 
  ext-relates-to-classifier named classifier 0..*
  and ext-relates-to-label named label 0..1
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

// BUG: This slicing is currently not working [@gregor]
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

* attester 0..*
  * ^slicing.discriminator.type = #value // TODO: Is this correct? [@gregor]
  * ^slicing.discriminator.path = "party.reference"
  * ^slicing.rules = #open
* attester contains AWMF 0..1
* attester[AWMF] // #P2.3.1.2
  * mode 1..1
  * mode = $cs-composition-attestation-mode#official
  * party 1..1
  * party.reference = Canonical(AWMF)

// add some more codes for the sections (not only the ones defined by the EBM IG)
* section.code from vs-guideline-sections (extensible)

// close the slicing for section and add @default section
* section ^slicing.rules = #closed
* section contains 
  attachments 0..1 MS
  and consensusProtocol 0..*
  and @default 0..* 
* section[@default]
// fixme: actually, the default slice must not fix the discriminator, but as of 25-03-06 the validator is not able to handle default slices. therefore, we fix the discriminator here.
  * code 1..1
  * code.coding 1..1
  * code.coding = cs-guideline-sections#default-section

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
  * code = cs-guideline-sections#attachments "Attachments"
  * code 1..1
    * coding = cs-guideline-sections#attachments "Attachments"
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
    //* obeys inv-guideline-attachment-type-match // TODO: does currently not seem to work (doesn't resolve the references - maybe in the IG publisher?) [@gregor]
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
  * code 1..1
  * code = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * insert rs-language-section-nested

// Language for each section and nested sections until level 6 (#P2.3.2.21, #P2.1.9)
* section[@default]
  * insert rs-language-section-nested
* section[summary]
  * insert rs-language-section-nested
* section[introduction]
  * insert rs-language-section-nested
* section[methods]
  * insert rs-language-section-nested
* section[discussion]
  * insert rs-language-section-nested
* section[references]
  * insert rs-language-section-nested
* section[competingInterests]
  * insert rs-language-section-nested
* section[acknowledgements]
  * insert rs-language-section-nested
* section[appendices]
  * insert rs-language-section-nested
* section[recommendations] 
  // TODO: disallow text here because all recommendation-related text should be in the Composition instance of the recommendation profile. [@gregor]
  // TODO: explain this in the IG [@Gregor]



// lines below are just used to force sushi to add the correct code when refering to the slices
* section[summary].code 1..1
* section[summary].code = $cs-ebm-ig#summary "Summary"
* section[introduction].code 1..1
* section[introduction].code = $cs-ebm-ig#introduction "Introduction"
* section[discussion].code 1..1
* section[discussion].code = $cs-ebm-ig#discussion "Discussion"
* section[methods].code 1..1
* section[methods].code = $cs-ebm-ig#methods "Methods"
* section[references].code 1..1
* section[references].code = $cs-ebm-ig#references "References"
* section[competingInterests].code 1..1
* section[competingInterests].code = $cs-ebm-ig#competing-interests "Competing Interests"
* section[acknowledgements].code 1..1
* section[acknowledgements].code = $cs-ebm-ig#acknowledgements "Acknowledgements"
* section[appendices].code 1..1
* section[appendices].code = $cs-ebm-ig#appendices "Appendices"



Instance: GuidelineExample
InstanceOf: guideline
Usage: #example
Title: "Guideline Example"
Description: "An example of a guideline."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#content-author
* date = "2025-03-06"
* title = "Example Guideline"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

