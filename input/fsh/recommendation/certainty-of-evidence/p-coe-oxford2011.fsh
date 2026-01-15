Profile: EvidenceAssessmentOXFORD2011
Parent: OverallEvidenceAssessment
Id: evidence-assessment-oxford2011
Title: "Evidence Assessment Oxford 2011"
Description: "A structured assessment of the certainty of evidence for a specific outcome, including Oxford 2011 rating."
* content[ratingSystem]
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = $cs-evidence-rating-system#OCEBM2011 "Oxford 2011 (OCEBM)"

// NOTE: Currently, we only implement whether the Oxford 2011rating system has been applied (via content[ratingSystem]).
// We do not yet represent the individual ratings on the Oxford 2011 domains or the overall score (if applicable).
// This may be added in the future; therefore, the commented-out block is left here as a placeholder.
/*
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 1..1
  * classifier from OCEBM2011LevelsOfEvidenceVS (required)
*/