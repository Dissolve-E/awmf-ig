Profile: Guideline
Parent: $ebm-guideline
Id: Guideline
Title: "Guideline"
Description: "Clinical Practice Guideline"
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
* section
  * orderedBy = cs-awmf#ordered-by-authors "Ordered by authors"
  * section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code.coding"
  * section ^slicing.rules = #open
  * section contains 
    introduction 0..1 MS 
    and discussion 0..1 MS 
    and methods 0..1 MS 
    and references 0..1 MS 
    and competingInterests 0..1 MS 
    and acknowledgements 0..1 MS 
    and appendices 0..1 MS
    and recommendations 0..1 MS
    
  * section[introduction].code.coding 1..1
  * section[introduction].code.coding = https://fevir.net/resources/CodeSystem/179423#introduction "Introduction"
  * section[discussion].code.coding 1..1
  * section[discussion].code.coding = https://fevir.net/resources/CodeSystem/179423#discussion "Discussion"
  * section[methods].code.coding 1..1
  * section[methods].code.coding = https://fevir.net/resources/CodeSystem/179423#methods "Methods"
  * section[references].code.coding 1..1
  * section[references].code.coding = https://fevir.net/resources/CodeSystem/179423#references "References"
  * section[references]
    * entry only Reference(Citation)
  * section[competingInterests].code.coding 1..1
  * section[competingInterests].code.coding = https://fevir.net/resources/CodeSystem/179423#competing-interests "Competing Interests"
  * section[acknowledgements].code.coding 1..1
  * section[acknowledgements].code.coding = https://fevir.net/resources/CodeSystem/179423#acknowledgements "Acknowledgements"
  * section[appendices].code.coding 1..1
  * section[appendices].code.coding = https://fevir.net/resources/CodeSystem/179423#appendices "Appendices"
  * section[recommendations].code.coding 1..1
  * section[recommendations].code.coding = https://fevir.net/resources/CodeSystem/179423#recommendations "Recommendations"
  * section[recommendations]
    * entry only Reference(Recommendation)
// TODO: create profiles for S3, S2k, S2e etc guidelines, inheriting from guideline profile

Invariant: inv-guideline-attachment-type-match
Description: "Attachment type in DocumentReference must match the type of the section"
Expression: "reference.resolve()[type=$this.code].exists()"
Severity: #error


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
    * div = "<div>Das ist die Einleitung dieser Leitlinie</div>"
* section[+] // custom section
  * text 
    * status = #generated
    * div = "
      <div>
        <div lang='en'>Das ist Kapitel 2 zum Thema spezifische Empfehlungen</div>
        <div lang='de'>Das ist Kapitel 2 zum Thema spezifische Empfehlungen</div>
      </div>
      "
  * section[introduction]
    * text
      * status = #generated
      * div = "<div>Einleitung zu Kapitel 2</div>"
  * section[discussion]
    * text 
      * status = #generated
      * div = "<div>Diskussion zu Kapitel 2</div>"
  * section[recommendations]
    * entry[+].display = "Spezifische Empfehlung 1"
    * entry[+].display = "Spezifische Empfehlung 2"
* section[recommendations]
  * entry[+].display = "Allgemeine Empfehlung 3"
  * entry[+].display = "Allgemeine Empfehlung 4"
