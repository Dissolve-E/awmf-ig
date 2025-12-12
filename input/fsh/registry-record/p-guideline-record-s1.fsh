Profile: AWMFGuidelineRecordS1
Parent: AWMFGuidelineRegistryRecord
Id: awmf-guideline-record-s1
Title: "AWMF S1 Guideline Registry Record"
Description: "AWMF S1 guideline representing expert recommendations developed through informal consensus."
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S1 "Action recommendations from expert groups"

Instance: AWMFGuidelineS1Example
InstanceOf: awmf-guideline-record-s1
Usage: #example
Title: "AWMF Guideline S1 Example"
Description: "An example of an AWMF S1 guideline."
* insert narrative([[AWMF Guideline S1 Example]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "AWMF S1 Example Guideline"
* identifier[awmf-register-number][+]
  * use = #official
  * value = "999-999"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
