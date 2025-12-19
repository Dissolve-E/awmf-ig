Profile: EvidenceAssessmentROBIS
Parent: EvidenceInternalValidityAssessment
Id: evidence-assessment-robis
Title: "Evidence Assessment ROBIS"
Description: "Structured assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews)."
* content[ratingSystem]
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = cs-evidence-rating-system#ROBIS "ROBIS"

// NOTE: Currently, we only implement whether the ROBIS rating system has been applied (via content[ratingSystem]).
// We do not yet represent the individual ratings on the ROBIS domains or the overall score (if applicable).
// This may be added in the future; therefore, the commented-out block is left here as a placeholder.
/*
* content contains
  riskOfBias 0..1
* content[riskOfBias]
  * type 1..1
  * type = $cs-certainty-type#RiskOfBias "Risk of bias"
  * classifier 0..1
  * classifier from ROBISJudgmentOfRiskOfBiasVS (required)
*/