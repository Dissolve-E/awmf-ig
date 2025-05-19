Profile: AWMFGuidelineS2k
Parent: AWMFGuideline
Id: awmf-guideline-s2k
Title: "AWMF S2k Guideline"
Description: "AWMF S2k guideline based on structured consensus by a representative panel."
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S2k "Consensus-based Guideline"

Instance: AWMFGuidelineS2kExample
InstanceOf: awmf-guideline-s2k
Usage: #example
Title: "AWMF Guideline S2k Example"
Description: "An example of an AWMF S2k guideline."
* insert narrative([[AWMF Guideline S2k Example]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "AWMF S2k Example Guideline"
* identifier[awmf-register-number][+]
  * use = #official
  * value = "999-997"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#content-author "Content Author"
