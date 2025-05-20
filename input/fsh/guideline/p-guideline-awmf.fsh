Profile: AWMFGuideline
Parent: Guideline
Id: awmf-guideline
Title: "AWMF Guideline"
Description: "AWMF Clinical Practice Guideline"


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

* section[summary]
  * section[intention] 1..1
  * section[targetPatientGroup] 1..1
  * section[careSetting] 1..*
  * section[topicSelectionReason] 1..1
  * section[targetAudience] 1..1
  * section[keywords] 1..*
  

Instance: AWMFGuidelineExample
InstanceOf: awmf-guideline
Usage: #example
Title: "AWMF Guideline Example"
Description: "An example of an AWMF guideline."
* insert narrative([[AWMF Guideline Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role][+].valueCodeableConcept = cs-guideline-author-role#registrant
* author[=].extension[ext-guideline-author-role][+].valueCodeableConcept = cs-guideline-author-role#content-author
* date = "2025-03-06"
* title = "Example Recommendation"
* identifier[awmf-register-number][+]
  * value = "999-999"
  * use = #official
