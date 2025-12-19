Profile: EvidenceAssessmentAGREEII
Parent: EvidenceInternalValidityAssessment
Id: evidence-assessment-agreeii
Title: "Evidence Assessment AGREE II"
Description: "A structured assessment of the quality of guidelines using the AGREE II instrument."
* content[ratingSystem]
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = cs-evidence-rating-system#AGREEII "AGREE II"

// NOTE: Currently, we only implement whether the AGREE II rating system has been applied (via content[ratingSystem]).
// We do not yet represent the individual ratings on the AGREE II domains or the overall score (if applicable).
// This may be added in the future; therefore, the commented-out block is left here as a placeholder.
/*
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 0..1
  * classifier from AGREEIIAssessmentVS (required)
*/