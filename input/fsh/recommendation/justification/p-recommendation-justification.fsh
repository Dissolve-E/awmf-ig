Profile: RecommendationJustification
Parent: ArtifactAssessment
Id: recommendation-justification
Title: "Recommendation Justification"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation."
* artifactReference only Reference(Recommendation)

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  recommendationRating 0..1
  and evidenceRating 0..*
  and searchStrategy 0..1  // #P2.3.3.1

* content[recommendationRating]
  * type 1..1
  * type = $cs-ebm-ig#recommendation-rating "Recommendation Rating"
  * component ^slicing.discriminator.type = #value
  * component ^slicing.discriminator.path = "type"
  * component ^slicing.rules = #open
  * component contains 
    ratingSystem 0..1
    and strengthOfRecommendation 0..1
    and directionOfRecommendation 0..1
    and levelOfConsensus 0..1

  * component[ratingSystem]
    * type 1..1
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier 1..1
    * classifier from $vs-evidence-rating-system (preferred)

  * component[strengthOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#strength-of-recommendation "Strength of Recommendation"

  * component[directionOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#direction-of-recommendation "Direction of Recommendation"
    * classifier 1..1
    * classifier from $vs-direction-of-recommendation (required)
      
  * component[levelOfConsensus]
    * type 1..1
    * type = cs-awmf#level-of-consensus
    * classifier 1..1
    * classifier from vs-level-of-consensus (required)

* content[evidenceRating] // one per outcome, #P2.3.3.2, #P2.3.3.3
  * type 1..1
  * type = $cs-ebm-ig#evidence-rating "Evidence Rating"
  * component ^slicing.discriminator.type = #value
  * component ^slicing.discriminator.path = "type"
  * component ^slicing.rules = #open
  * component contains 
    ratingSystem 0..1
    and levelOfEvidence 0..1
    and outcome 0..1
    and overallQualityOfEvidence 0..* // TODO: find better name

  * component[ratingSystem]
    * type 1..1
    * type = $cs-ebm-ig#rating-system "Rating System"
    * classifier 1..1
    * classifier from $vs-evidence-rating-system (extensible)

  * component[levelOfEvidence]
    * type 1..1
    * type = $cs-certainty-type#Overall "Overall certainty"
    * classifier 1..1

  * component[outcome]
    * type 1..1
    * type = $cs-ebm-ig#outcome "Outcome"
    * relatesTo 1..1
      * type 1..1
      * type = $cs-related-artifact-type#depends-on "Depends On" // TODO: change to outcome when building on >6.0.0-ballot3 (currently value set binding is "required")
      * targetReference 1..1
      * targetReference only Reference(ConceptualCohortDefinitionOutcome or OutcomeEvidence)
  
  * component[overallQualityOfEvidence]
    * type 1..1
    * type = $cs-ebm-ig#overall-quality-of-evidence "Overall Quality"
    * relatesTo 1..1
      * type 1..1
      * type = $cs-related-artifact-type#justification "Justification"
      * targetReference 1..1
      * targetReference only Reference(EvidenceAssessment) // TODO: or other profile?

* content[searchStrategy] // #P2.3.3.1
  * type 1..1
  * type = $cs-ebm-ig#SearchStrategy "SearchStrategy"
  * relatesTo 1..1
    * targetReference 1..1
    * targetReference only Reference(SystematicReview)

* workflowStatus 1..1
* workflowStatus = #applied

Profile: RecommendationJustificationOXFORD2011
Parent: RecommendationJustification
Id: recommendation-justification-oxford-2011
Title: "Recommendation Justification OXFORD 2011"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation using the OXFORD 2011 evidence rating system."
* content[evidenceRating]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#OCEBM2011 "Oxford 2011 (OCEMB)"
  * component[levelOfEvidence]
    * classifier from OCEBM2011LevelsOfEvidenceVS (preferred)
  * component[outcome] 0..0




Profile: RecommendationJustificationSIGN
Parent: RecommendationJustification
Id: recommendation-justification-sign
Title: "Recommendation Justification SIGN"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation using the SIGN evidence rating system."
* content[evidenceRating]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#SIGN "SIGN"
  * component[levelOfEvidence]
    * classifier from SIGNLevelOfEvidenceVS (preferred)

Profile: RecommendationJustificationOxford2009
Parent: RecommendationJustification
Id: recommendation-justification-oxford-2009
Title: "Recommendation Justification OXFORD 2009"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation using the OXFORD 2009 evidence rating system."
* content[evidenceRating]
  * component[ratingSystem]
    * classifier = cs-awmf#OCEBM2009 "Oxford 2009 (OCEBM)"
  * component[levelOfEvidence]  
    * classifier from OCEBM2009LevelsOfEvidenceVS (preferred)
  * component[outcome] 0..0

Profile: RecommendationJustificationExpertConsensus
Parent: RecommendationJustification
Id: recommendation-justification-expert-consensus
Title: "Recommendation Justification Expert Consensus"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation based on expert consensus."
* content[evidenceRating] 0..0


// TODO: 1. Wie unterscheiden wir zwischen "gesamt-evidenz-rating" (e.g. Oxford, GRADE) und "einzelstudien-evidenz-rating" (z.B. ROBIS, Cochrane Risk of Bias Tool)?
// TODO: 2. Alignment mit Brians Profilen prüfen / durchführen
// TODO: 3. Wie verlinken wir Einzelevidenz?
