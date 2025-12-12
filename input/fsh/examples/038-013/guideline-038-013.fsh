Instance: Demenzen
InstanceOf: AWMFGuideline
Usage: #example
Title: "S3-Leitlinie Demenzen Living Guideline - Langfassung"
Description: "S3-Leitlinie Demenzen Living Guideline - Langfassung"
* identifier[awmf-register-number][+]
  * value = "038-013"
  * use = #official

* insert narrative([[S3-Leitlinie Demenzen Living Guideline - Langfassung]])

* meta
//	* tag[guideline-releaseType] = $cs-guideline-releaseType#update // just an example, this guideline has no release type

// required by profile (ebm or so) -> TODO: define use in profile
* date = "2025-07-17"

* title = "Demenzen"
* version = "5.2"
* status = #final

* author[+] = Reference(DGPPN)

Instance: DemenzenRecord
InstanceOf: AWMFGuidelineRegistryRecord
Usage: #example
Title: "S3-Leitlinie Demenzen Living Guideline - Record"
Description: "S3-Leitlinie Demenzen Living Guideline - Record"
* identifier[awmf-register-number][+]
  * value = "038-013"
  * use = #official

* date = "2025-07-17"

* title = "Demenzen"
* version = "5.2"
* status = #final

* author[+] = Reference(DGPPN)
* author[=].extension[role][+].valueCodeableConcept = cs-guideline-author-role#leading
* author[=].extension[role][+].valueCodeableConcept = cs-guideline-author-role#registrant
