Instance: DiffuseLargeBCellLymphomaGuidelineRecord
InstanceOf: AWMFGuidelineRegistryRecord
Usage: #example
Title: "S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten"
Description: "S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom (DLBCL) und verwandten Entitäten"

* identifier[awmf-register-number][+]
  * value = "018-038"
  * use = #official

* insert narrative([[S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten]])

* date = "2022-10"

* title = "Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten"
* version = "1.0"
* status = #final

* category[awmfGuidelineClass] = cs-awmf-guideline-class#S3 "Evidence- and consensus-based guideline"

* extension[publicationDate].valueDate = "2022-10"

* attester[AWMF]

// AWMF member organizations
* author[+] = Reference(DGHO)
* author[=].extension[role][+].valueCodeableConcept = cs-guideline-author-role#leading
* author[=].extension[role][+].valueCodeableConcept = cs-guideline-author-role#registrant
* author[+] = Reference(DGA)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGCH)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGEBV)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGG)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGGG)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGIM)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGN)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGPalliativ)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGPathologie)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DEGRO)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DEGUM)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGU)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DRG)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(EbMNetzwerk)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing

* relatesTo[+]
  * type = #documentation
  * extension[classifier][+].valueCodeableConcept = cs-related-artifact-types#awmf-detail-page
  * targetUri = "https://register.awmf.org/de/leitlinien/detail/018-038"
