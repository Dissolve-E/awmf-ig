Profile: RecommendationJustification
Parent: ArtifactAssessment // TODO: we should inherit from EBM IG, but that profile has content[evidence] 0..1, we need 0..*
Id: recommendation-justication
Title: "Recommendation Justication"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation."
* artifactReference only Reference(Recommendation)

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  recommendationRating 0..1
  and searchStrategy 0..1  // #P2.3.3.1
  and evidence 0..*

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
    * classifier from vs-evidence-rating-system (preferred)

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

* content[evidence] // one per outcome, #P2.3.3.2, #P2.3.3.3
  * type 1..1
  * type = $cs-ebm-ig#evidence "Evidence"
  * relatesTo 1..1
    * type 1..1
    * type = $cs-related-artifact-type#justification "Justification"
    * targetReference 1..1
    * targetReference only Reference(CertaintyOfEvidenceRating) // overall evidence rating for this outcome
  
  * component // #P2.3.3.2, #P2.3.3.3 - single study evidence (one component per study)
    * type 1..1
    * type = $cs-ebm-ig#evidence "Evidence"
    * relatesTo 1..1
      * targetReference 1..1
      * targetReference only Reference(CertaintyOfEvidenceRating)

* content[searchStrategy] // #P2.3.3.1
  * type 1..1
  * type = $cs-ebm-ig#search-strategy "Search Strategy"
  * relatesTo 1..1
    * targetReference 1..1
    * targetReference only Reference(SearchStrategy)

* workflowStatus 1..1
* workflowStatus = #applied