Profile: EvidenceAssessmentAMSTAR2
Parent: EvidenceInternalValidityAssessment
Id: evidence-assessment-amstar2
Title: "Evidence Assessment AMSTAR 2"
Description: "A structured assessment of the certainty of evidence using AMSTAR 2."

* content[ratingSystem]
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = $cs-evidence-rating-system#AMSTAR2 "AMSTAR 2"

// NOTE: Currently, we only implement whether the AMSTAR2 rating system has been applied (via content[ratingSystem]).
// We do not yet represent the individual ratings on the AMSTAR2 domains or the overall score (if applicable).
// This may be added in the future; therefore, the commented-out block is left here as a placeholder.

/*
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 0..1
  * classifier from vs-amstar2-confidence-ratings (required)
*/