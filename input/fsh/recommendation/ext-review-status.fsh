Extension: RecommendationReviewStatus // #P2.3.2.29 // Todo @Gregor: Add new requirement if there is any
Id: ext-recommendation-review-status
Title: "Recommendation Review Status"
Description: "This extension allows for the indication of the status of a recommendation in the context of an updated guideline version along with an optional explanatory text"
Context: Composition
* ^purpose = "The RecommendationReviewStatus extension is used to indicate whether a recommendation has been added, updated, reviewed, or reaffirmed in the new guideline version, as well as to add an explanation text related to the status."
* . 0..1
* . ^short = "Version status of recommendation"
* . ^definition = "Indicates the status of a recommendation in the context of a newer version of the guideline."
* . ^comment = "Supports tracking how a recommendation evolved in the new version of the guideline."

* extension contains review-status 1..1 and review-status-text 0..1

* extension[review-status].value[x] only CodeableConcept
* extension[review-status].valueCodeableConcept from vs-recommendation-review-status (required)

* extension[review-status-text].value[x] only string
