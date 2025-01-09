Profile: Guideline
Parent: ebm-guideline
Id: Guideline
Title: "Guideline"
Description: "Clinical Practice Guideline"
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


Profile: Guideline
Parent: ebm-guideline
* section[otherDocuments]
  * code from value-set-awmf-document-types (extensible)

CodeSystem: code-system-awmf-document-types
* #long-version
* #short-version
* #patient-version

ValueSet: value-set-awmf-document-types
* include all codes from code-system-awmf-document-types

Instance: Guideline-example
InstanceOf: Guideline
* status = #preliminary
* date = "2024-12-05"
* author.display = "Dissolve-E Team"
* title = "Beispiel-Leitlinie"

// Version 1: Keine Information über den Typ der Dokumente in dieser Instanz
* section[documents]
  * entry[+] = Reference(DocumentReferenceThisGuideline)
  * entry[+] = Reference(DocumentReferenceLongVersionOfThisGuideline)
  * entry[+] = Reference(DocumentReferenceShortVersionOfThisGuideline)
  * entry[+] = Reference(DocumentReferencePatientVersionOfThisGuideline)

// Version 2: Information über den Typ der Dokumente in dieser Instanz via code
//  (s. auch code-system-awmf-document-types, value-set-awmf-document-types)
* section[documents]
  * section[+]
    * code = cs-awmf#long-version
    * title = "Langversion"
    * entry = Reference(DocumentReferenceLongVersionOfThisGuideline)
  * section[+]
    * code = cs-awmf#short-version
    * entry = Reference(DocumentReferenceShortVersionOfThisGuideline)
  * section[+]
    * code = cs-awmf#patient-version
    * entry = Reference(DocumentReferencePatientVersionOfThisGuideline)

// Version 3: Information über den Typ der Dokumente in dieser Instanz via section
// Hier kann auch das Profil von DocumentReference festgelegt werden (in V2 nicht)
* section[documents] 
  * section[longVersion]
    * title = "Langversion"
    * entry[+] = Reference(DocumentReferenceLongVersionOfThisGuideline)
  * section[shortVersion]
    * entry = Reference(DocumentReferenceShortVersionOfThisGuideline)
  * section[patientVersion]
    * entry = Reference(DocumentReferencePatientVersionOfThisGuideline)
  * section[patientVersion]
    * text.div = "<div>Das ist die Patientenversion dieser Leitlinie</div>"
  * section[otherDocuments]
    * entry[+] = Reference(DocumentReferenceOtherDocumentOfThisGuideline)



* section[introduction]
  * text 
    * status = #generated
    * div = "<div>Das ist die Einleitung dieser Leitlinie</div>"
* section[+] // custom section
  * text 
    * status = #generated
    * div = "
      <div lang='en'>Das ist Kapitel 2 zum Thema spezifische Empfehlungen</div>
      <div lang='de'>Das ist Kapitel 2 zum Thema spezifische Empfehlungen</div>
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
