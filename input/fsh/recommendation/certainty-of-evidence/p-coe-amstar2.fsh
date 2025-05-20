Profile: CertaintyOfEvidenceRatingAMSTAR2
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-amstar2
Title: "Evidence Assessment AMSTAR 2"
Description: "A structured assessment of the certainty of evidence using AMSTAR 2."
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 0..1
  * classifier from vs-amstar2-confidence-ratings (required)
