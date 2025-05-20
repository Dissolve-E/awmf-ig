Profile: AWMFGuidelineS3
Parent: AWMFGuideline
Id: awmf-guideline-s3
Title: "AWMF S3 Guideline"
Description: "AWMF S3 guideline based on systematic evidence review and structured consensus by a representative panel."
* category[awmfGuidelineClass] = cs-awmf-guideline-class#S3 "Evidence- and consensus-based guideline"

Instance: AWMFGuidelineS3Example
InstanceOf: awmf-guideline-s3
Usage: #example
Title: "AWMF Guideline S3 Example"
Description: "An example of an AWMF S3 guideline."
* insert narrative([[AWMF Guideline S3 Example]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "AWMF S3 Example Guideline"
* identifier[awmf-register-number][+]
  * use = #official
  * value = "999-996"
* author[+] = Reference(GuidelineAuthorRoleExample)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
