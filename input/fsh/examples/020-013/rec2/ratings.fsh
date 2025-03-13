Instance: RecommendationHAPDiagnosis-A-Justification
InstanceOf: RecommendationJustication
Usage: #example
Title: "RecommendationHAPDiagnosis-A-Justification"
Description: "Justification for Recommendation HAP Diagnose A"
* artifactReference = Reference(RecommendationHAPDiagnosis-A)
* content[recommendationRating]
  * type = cs-awmf#recommendation-rating "Recommendation Rating"
  
  * component[strengthOfRecommendation]
    * classifier = cs-strength-of-recommendation#strong "Strong"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#for "For"
  
  * component[levelOfConsensus]
    * classifier = $cs-level-of-consensus#strong "Strong"


Instance: RecommendationHAPDiagnosis-B-Justification
InstanceOf: RecommendationJustication
Usage: #example
Title: "RecommendationHAPDiagnosis-B-Justification"
Description: "Justification for Recommendation HAP Diagnose B"
* artifactReference = Reference(RecommendationHAPDiagnosis-B)
* content[recommendationRating]
  * type = cs-awmf#recommendation-rating "Recommendation Rating"
  
  * component[strengthOfRecommendation]
    * classifier = cs-strength-of-recommendation#weak "Weak"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#for "For"
  
  * component[levelOfConsensus]
    * classifier = $cs-level-of-consensus#strong "Strong"
