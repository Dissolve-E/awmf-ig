Extension: RecommendationVersionStatus // #P2.3.2.29
Id: ext-recommendation-version-status
Title: "Recommendation Version Status"
Description: "Status of a recommendation in the context of an updated guideline version"
Context: Element
* ^purpose = "Indicates whether a recommendation has been added, updated, reviewed, or reaffirmed in the new guideline version."
* . 0..1
* . ^short = "Version status of recommendation"
* . ^definition = "Indicates the status of a recommendation in the context of a newer version of the guideline."
* . ^comment = "Supports tracking how a recommendation evolved in the new version of the guideline."
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from vs-recommendation-version-status (required)
