Profile: AWMFGuidelineS2e
Parent: AWMFGuideline
Id: awmf-guideline-s2e
Title: "AWMF S2e Guideline"
Description: "AWMF S2e guideline based on systematic literature search and evaluation."
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S2e "Evidence-based Guideline"

Instance: AWMFGuidelineS2eExample
InstanceOf: awmf-guideline-s2e
Usage: #example
Title: "AWMF Guideline S2e Example"
Description: "An example of an AWMF S2e guideline."
* insert narrative([[AWMF Guideline S2e Example]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "AWMF S2e Example Guideline"
* identifier[awmf-register-number][+]
  * use = #official
  * value = "999-998"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
