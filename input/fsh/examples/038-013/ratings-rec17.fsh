Instance: RecommendationCognitiveTestsWhenSuspectingDementia-Justification
InstanceOf: RecommendationJustificationAWMF
Usage: #example
Title: "RecommendationCognitiveTestsWhenSuspectingDementia-Justification"
Description: "Justification for Recommendation Cognitive Tests When Suspecting Dementia"
* insert narrative([[Justification for Recommendation Cognitive Tests When Suspecting Dementia]])
* artifactReference = Reference(RecommendationCognitiveTestsWhenSuspectingDementia)
* content[recommendationRating]

  * component[strengthOfRecommendation]
    * classifier = cs-recommendation-strength-awmf#A "Strong Recommendation"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#for "For"
  
  * component[levelOfConsensus]
    * classifier = cs-level-of-consensus#strong-consensus "Strong consensus" //"97%"


* content[evidenceRating][+]
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#very-low "Very low quality"
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(RoB-CognitiveTestsWhenSuspectingDementia-Sensitivity)

* content[evidenceRating][+]
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#very-low "Very low quality"
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(RoB-CognitiveTestsWhenSuspectingDementia-Specificity)
