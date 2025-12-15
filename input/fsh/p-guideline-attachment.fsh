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
