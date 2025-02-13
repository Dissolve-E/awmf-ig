Profile: Guideline
Parent: $ebm-guideline
Id: Guideline
Title: "Guideline"
Description: "Clinical Practice Guideline"

* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.rules = #open
* meta.tag contains guideline-releaseType 0..1 // TODO: include awmf in name or not?
* meta.tag[guideline-releaseType]
  * system 1..1
  * system = $cs-guideline-releaseType
  * code 1..1

 // TODO: add guideline code for type
 // TODO: add ConceptMap for status (e.g., preliminary = "consultation" etc)

* title 1..1 // TODO: add description (in the IG - ^definition or so)
* status 1..1 // TODO: add description (in the IG - ^definition or so)

* extension contains ext-artifact-extended-contact named contact 0..* MS
* extension ^slicing.discriminator[1].path = "valueExtendedContactDetail.purpose"
* extension ^slicing.discriminator[1].type = #value
* extension[contact] contains 
  registrant 0..1 MS 
  and coordinator 1..* MS 
  and mainContact 1..1 MS
* extension[contact][registrant].valueExtendedContactDetail
  * purpose = cs-contact-point#registrant
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1
* extension[contact][coordinator].valueExtendedContactDetail
  * purpose = cs-contact-point#coordinator
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1
* extension[contact][mainContact].valueExtendedContactDetail
  * purpose = cs-contact-point#contact
  * name 1..1
  * telecom 1..*
    * value 1..1
  * address 0..1

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains awmf-register-number 0..1
* identifier[awmf-register-number]
  * system 1..1
  * system = "http://fhir.awmf.org" // TODO: agree on system
  * value 1..1
* identifier obeys inv-require-official-identifier // #P2.2.1
* version 1..1 // #P2.2.1
* version obeys inv-version-major-minor // #P2.2.1

* note.extension contains $ext-annotationType named type 1..1
* note ^slicing.discriminator.type = #value
* note ^slicing.discriminator.path = "extension[type].valueCodeableConcept"
* note ^slicing.rules = #open
* note contains remark 0..1
* note[remark]
  * extension[type].valueCodeableConcept 1..1
  * extension[type].valueCodeableConcept from vs-remark-type (required)
  * text 1..1


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
* section[attachments]
  * code
    * coding = $cs-awmf#attachments "Attachments"
    * coding 1..1
  * section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code"
  * section ^slicing.rules = #open
  * section contains 
    longVersion 0..1 
    and shortVersion 0..1
    and patientVersion 0..*
    and evidenceReport 0..*
  * section 1..*
    * code from vs-guideline-attachment-types (preferred)
    * entry only Reference(GuidelineAttachment)
    * entry 1..1 MS
  * section[longVersion]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#long-version "Long Version"
  * section[shortVersion]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#short-version "Short Version"
  * section[patientVersion]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#patient-version "Patient Version"
  * section[evidenceReport]
    * code.coding 1..1
    * code.coding = cs-guideline-attachment-types#evidence-report "Evidence Report"
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