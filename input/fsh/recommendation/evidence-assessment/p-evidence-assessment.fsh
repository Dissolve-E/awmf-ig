Profile: EvidenceAssessment
Parent: $ebm-evidence-assessment
Id: evidence-assessment
Title: "Evidence Assessment"
Description: "A structured assessment of the certainty of evidence for a specific outcome."

// TODO: should single study evidences point to the overall evidence assessment? (e.g. via some kind of partOf = Reference(OverallAssessment))
//       or should they be independent and only be "passively" referenced by the overall assessment (like it is now implemented)? [all, after workshop]

// #P2.3.3.2, #P2.3.3.3
* artifactReference only Reference(PublicationRecord or Evidence or SummaryOfFindings or EvidenceList or CitationList)

// TODO: how to mark evidence as missing? #P2.3.3.7 (e.g. if no studies are available for a specific outcome) [all, after workshop]
//       we need to define the way in FHIR and explicitly mention this in the implementation guide

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
// The EBM parent defines the slices ratingSystem, overall (type certainty-type#Overall)
// and riskOfBias (type certainty-type#RiskOfBias); the AWMF profiles constrain those.

* content[ratingSystem]
  * classifier 1..1
  * classifier from $vs-evidence-rating-system (extensible)

* workflowStatus 1..1
* workflowStatus = #applied
