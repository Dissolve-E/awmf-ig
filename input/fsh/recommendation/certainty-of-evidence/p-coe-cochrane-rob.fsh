Profile: CertaintyOfEvidenceRatingCochraneRoB
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-cochrane-rob
Title: "Evidence Assessment Cochrane Risk of Bias"
Description: "Structured assessment of risk of bias using Cochrane RoB tool."
* content contains
  riskOfBias 0..1
* content[riskOfBias]
  * type 1..1
  * type = $cs-certainty-type#RiskOfBias "Risk of bias assessment"
  * classifier 0..1
  //* classifier from CochraneRoBJudgementVS (required) // TODO: add valueset
