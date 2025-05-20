Profile: CertaintyOfEvidenceRatingCochraneRoB
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-cochrane-rob
Title: "Evidence Assessment Cochrane Risk of Bias"
Description: "Structured assessment of risk of bias using Cochrane RoB tool."
* content[ratingSystem]
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = cs-evidence-rating-system#CochraneRoB "Cochrane RoB"

// NOTE: Currently, we only implement whether the Cochrane RoB rating system has been applied (via content[ratingSystem]).
// We do not yet represent the individual ratings on the Cochrane RoB domains or the overall score (if applicable).
// This may be added in the future; therefore, the commented-out block is left here as a placeholder.
/*
* content contains
  riskOfBias 0..1
* content[riskOfBias]
  * type 1..1
  * type = $cs-certainty-type#RiskOfBias "Risk of bias"
  * classifier 0..1
  * classifier from vs-rob-2-overall-judgment (required) //from RoB2
*/