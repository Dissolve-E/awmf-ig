Profile: CertaintyOfEvidenceRatingAGREEII
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-agreeii
Title: "Evidence Assessment AGREE II"
Description: "A structured assessment of the quality of guidelines using the AGREE II instrument."
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 0..1
  //* classifier from AGREEIIAssessmentVS (required) //TODO: Add valueset [@sophie]
