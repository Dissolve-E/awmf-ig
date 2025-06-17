Profile: AWMFGuideline
Parent: Guideline
Id: awmf-guideline
Title: "AWMF Guideline"
Description: "AWMF Clinical Practice Guideline"

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


Instance: TestInvLeadingAuthorRefPerson-SHOULD-FAIL
InstanceOf: awmf-guideline
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

Instance: TestInvContribAuthorRefPerson-SHOULD-FAIL
InstanceOf: awmf-guideline
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

Instance: TestInvLeadingAuthorRefOrganization-SHOULD-PASS
InstanceOf: awmf-guideline
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
