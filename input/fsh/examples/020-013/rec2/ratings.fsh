Instance: RecommendationHAPDiagnosis-A-Justification
InstanceOf: RecommendationJustification
Usage: #example
Title: "RecommendationHAPDiagnosis-A-Justification"
Description: "Justification for Recommendation HAP Diagnose A"
* insert narrative([[Justification for Recommendation HAP Diagnose A]])
* artifactReference = Reference(RecommendationHAPDiagnosis-A)
* content[recommendationRating]
  
  * component[strengthOfRecommendation]
    * classifier = $cs-strength-of-recommendation#strong "Strong"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#for "For"
  
  * component[levelOfConsensus]
    * classifier = cs-level-of-consensus#strong-consensus "Strong consensus"


Instance: RecommendationHAPDiagnosis-B-Justification
InstanceOf: RecommendationJustification
Usage: #example
Title: "RecommendationHAPDiagnosis-B-Justification"
Description: "Justification for Recommendation HAP Diagnose B"
* insert narrative([[Justification for Recommendation HAP Diagnose B]])
* artifactReference = Reference(RecommendationHAPDiagnosis-B)
* content[recommendationRating]
  
  * component[strengthOfRecommendation]
    * classifier = $cs-strength-of-recommendation#weak "Weak"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#for "For"
  
  * component[levelOfConsensus]
    * classifier = cs-level-of-consensus#strong-consensus "Strong consensus"
