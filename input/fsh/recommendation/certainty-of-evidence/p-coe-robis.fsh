Profile: CertaintyOfEvidenceRatingROBIS
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-robis
Title: "Evidence Assessment ROBIS"
Description: "Structured assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews)."
* content contains
  riskOfBias 0..1
* content[riskOfBias]
  * type 1..1
  * type = $cs-certainty-type#RiskOfBias "Risk of bias assessment"
  * classifier 0..1
  //* classifier from ROBISJudgementVS (required) // TODO: add valueset
