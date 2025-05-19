Profile: CertaintyOfEvidenceRatingAGREEII
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-agreeii
Title: "Evidence Assessment AGREE II"
Description: "A structured assessment of the quality of guidelines using the AGREE II instrument."

* content[ratingSystem]
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = cs-evidence-rating-system#AGREEII "AGREE II"

/* TODO: describe why this is commented out (and comment out in the other profiles as well) [@glichtner]
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 0..1
  * classifier from AGREEIIAssessmentVS (required)
*/