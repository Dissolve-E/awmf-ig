Profile: RecommendationJustificationGRADE
Parent: RecommendationJustification
Id: recommendation-justication-grade
Title: "Recommendation Justication GRADE"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation, including GRADE rating."

* content[recommendationRating]
  * component contains
    benefitAndHarms 0..1 MS
    and overallCertaintyOfEvidence 0..1 MS
    and preferenceAndValues 0..1 MS
    and resources 0..1 MS
    and equity 0..1 MS
    and acceptability 0..1 MS
    and feasibility 0..1 MS

  * component[ratingSystem] 1..1
    * type 1..1
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier 1..1
    * classifier = cs-evidence-rating-system#GRADE

  * component[strengthOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"
    * classifier 1..1
    * classifier from $vs-strength-of-recommendation (required)
    // TODO: classifier from http://terminology.hl7.org/CodeSystem/recommendation-strength ?
    // TODO: AWMF Empfehlungssystematik: https://www.awmf.org/leitlinien/awmf-regelwerk/ll-entwicklung.html ?

// TODO: or use strong-for, strong-against ?
  * component[directionOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#direction-of-recommendation "Direction of Recommendation"
    * classifier 1..1
    * classifier from $vs-direction-of-recommendation (required)

  * component[overallCertaintyOfEvidence]
    * type 1..
    * type = $cs-certainty-type#Overall "Overall certainty"
    * classifier 1..1
    * classifier from vs-rating-certainty-of-evidence (required)

  * component[benefitAndHarms]
    * type 1..
    * type = $cs-etd-certainty-type#benefit-and-harms "Benefit and harms"
    * classifier 1..1
    * classifier from vs-rating-benefit-and-harms (required)

  * component[preferenceAndValues]
    * type 1..
    * type = $cs-etd-certainty-type#preference-and-values "Preference and values"
    * classifier 1..1
    * classifier from vs-rating-preference-and-values (required)

  * component[resources]
    * type 1..
    * type = $cs-etd-certainty-type#resources "Resources"
    * classifier 1..1
    * classifier from vs-rating-resources (required)

  * component[equity]
    * type 1..
    * type = $cs-etd-certainty-type#equity "Equity"
    * classifier 1..1
    * classifier from vs-rating-equity (required)

  * component[acceptability]
    * type 1..
    * type = $cs-etd-certainty-type#acceptability "Acceptability"
    * classifier 1..1
    * classifier from vs-rating-acceptability (required)

  * component[feasibility]
    * type 1..
    * type = $cs-etd-certainty-type#feasibility "Feasibility"
    * classifier 1..1
    * classifier from vs-rating-feasibility (required)
