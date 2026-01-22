Profile: EvidenceAssessment
Parent: $ebm-certainty-of-evidence
Id: certainty-of-evidence-rating
Title: "Certainty of Evidence Rating"
Description: "A structured assessment of the certainty of evidence for a specific outcome."

// TODO: should single study evidences point to the overall evidence assessment? (e.g. via some kind of partOf = Reference(OverallAssessment))
//       or should they be independent and only be "passively" referenced by the overall assessment (like it is now implemented)? [all, after workshop]

// #P2.3.3.2, #P2.3.3.3
* artifactReference only Reference(OutcomeEvidence or ConceptualCohortDefinitionOutcome)

// TODO: how to mark evidence as missing? #P2.3.3.7 (e.g. if no studies are available for a specific outcome) [all, after workshop]
//       we need to define the way in FHIR and explicitly mention this in the implementation guide

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
 levelOfEvidence 0..1

* content[ratingSystem]
  * classifier 1..1
  * classifier from $vs-evidence-rating-system (extensible)

* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"

* workflowStatus 1..1
* workflowStatus = #applied
