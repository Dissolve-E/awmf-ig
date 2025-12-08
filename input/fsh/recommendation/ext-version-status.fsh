Extension: RecommendationVersionStatus // #P2.3.2.29 // To do @Gregor: Add new requirement if there is any
Id: ext-recommendation-version-status
Title: "Recommendation Version Status"
Description: "This extension allows for the indication of the status of a recommendation in the context of an updated guideline version along with an optional explanatory text"
Context: Element
* ^purpose = "The RecommendationVersionStatus extension is used to indicate whether a recommendation has been added, updated, reviewed, or reaffirmed in the new guideline version, as well as to add an explanation text related to the status."
* . 0..1
* . ^short = "Version status of recommendation"
* . ^definition = "Indicates the status of a recommendation in the context of a newer version of the guideline."
* . ^comment = "Supports tracking how a recommendation evolved in the new version of the guideline."

* extension contains version-status 1..1 and version-status-text 0..1

* extension[version-status].value[x] only CodeableConcept
* extension[version-status].valueCodeableConcept from vs-recommendation-version-status (required)

* extension[version-status-text].value[x] only string