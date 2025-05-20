Profile: RecommendationJustificationAWMF
Parent: RecommendationJustification
Id: recommendation-justification-awmf
Title: "Recommendation Justification AWMF"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation, including AWMF rating."

* content[recommendationRating]
  * component[ratingSystem] 1..1
    * type 1..1
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier 1..1
    * classifier = cs-evidence-rating-system#AWMF

  * component[strengthOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"
    * classifier 1..1
    * classifier from vs-recommendation-strength-awmf (required)
