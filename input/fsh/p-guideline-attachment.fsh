Profile: GuidelineAttachment
Parent: DocumentReference
Id: guideline-attachment
Title: "Guideline Attachment"
Description: "Attachment to a Clinical Practice Guideline"
* type 1..1
* type = $cs-ebm-ig#attachments "Attachments"
* category 1..*
* category from vs-content-types (preferred)

Instance: guideline-attachment-example
InstanceOf: guideline-attachment
Usage: #example
Title: "Guideline Attachment Example"
Description: "An example of a guideline attachment."
* category[+] = cs-guideline-sections#slide-deck
* category[+] = cs-guideline-sections#visual-abstract "Visual Abstract"
* status = #current
* content
  * attachment
    * title = "Slide Deck"
    * language = #en
    * contentType = #application/pdf
* insert narrative([[Guideline Attachment Example]])



Instance: guideline-attachment-patient-version-example
InstanceOf: guideline-attachment
Usage: #example
Title: "Guideline Attachment Patient Version Example"
Description: "An example of a guideline attachment for the patient version."
* meta
  * tag[+].display = "Herz-Kreislauf-Erkrankungen"
  * tag[+].display = "Diabetes"
* category[+] = cs-guideline-sections#patient-version
* status = #current
* content
  * attachment
    * title = "Patient Version"
    * language = #de
    * contentType = #application/pdf
* insert narrative([[Guideline Attachment Patient Version Example]])