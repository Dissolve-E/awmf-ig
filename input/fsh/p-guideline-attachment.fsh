Profile: GuidelineAttachment
Parent: DocumentReference
Id: guideline-attachment
Title: "Guideline Attachment"
Description: "Attachment to a Clinical Practice Guideline"
* type 1..1
* type from vs-guideline-attachment-types (preferred)

Instance: guideline-attachment-example
InstanceOf: guideline-attachment
Usage: #example
Title: "Guideline Attachment Example"
Description: "An example of a guideline attachment."
* type = cs-guideline-attachment-types#slide-deck
* status = #current
* content
  * attachment
    * title = "Slide Deck"
    * language = #en
    * contentType = #application/pdf
* insert narrative([[Guideline Attachment Example]])
