Profile: RecommendationJustification
Parent: ArtifactAssessment // TODO: inherit from EBM IG profile
Id: recommendation-justication
Title: "Recommendation Justication"
Description: "A structured assessment of the evidence and consensus that underpins a recommendation."
* artifactReference only Reference(Recommendation)

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  recommendationRating 0..1
  and evidence 0..*
  and searchStrategy 0..1  // #P2.3.3.1


* content[recommendationRating]
  * type 1..1
  * type = cs-awmf#recommendation-rating "Recommendation Rating" // TODO: or should we use EBM IG code (#recommendation-specification)
  * component ^slicing.discriminator.type = #value
  * component ^slicing.discriminator.path = "type"
  * component ^slicing.rules = #open
  * component contains 
    strengthOfRecommendation 0..1
    and directionOfRecommendation 0..1
    and levelOfConsensus 0..1

  * insert rs-grade-rating-slices

  * component[strengthOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#strength-of-recommendation
    * classifier 1..1
    * classifier from vs-strength-of-recommendation (required)
    // TODO: classifier from http://terminology.hl7.org/CodeSystem/recommendation-strength ?
    // TODO: AWMF Empfehlungssystematik: https://www.awmf.org/leitlinien/awmf-regelwerk/ll-entwicklung.html ?

// TODO: or use strong-for, strong-against ?
  * component[directionOfRecommendation]
    * type 1..1
    * type = $cs-ebm-ig#direction-of-recommendation
    * classifier 1..1
    * classifier from $vs-direction-of-recommendation (required)
      
  * component[levelOfConsensus]
    * type 1..1
    * type = cs-awmf#level-of-consensus
    * classifier 1..1
    * classifier from vs-level-of-consensus (required)

// TODO: we need to add the different rating systems (GRADE, LoE Oxford); then Risk of Bias and other components
//       currently we only CertaintyOfEvidenceRating profile for this, is this sufficient?
* content[evidence] // one per outcome, #P2.3.3.2, #P2.3.3.3
  * type 1..1
  * type = $cs-ebm-ig#evidence "Evidence"
  * relatedArtifact 1..1
    * type 1..1
    * type = $cs-related-artifact-type#justification "Justification"
    * resourceReference 1..1
    * resourceReference only Reference(CertaintyOfEvidenceRating)
  
  * component // #P2.3.3.2, #P2.3.3.3
    * type 1..1
    * type = $cs-ebm-ig#evidence "Evidence"
    * relatedArtifact 1..1
      * resourceReference 1..1
      * resourceReference only Reference(CertaintyOfEvidenceRating)

// TODO: should this be here or in recommendation or / and in guideline?
* content[searchStrategy] // #P2.3.3.1
  * type 1..1
  * type = $cs-ebm-ig#search-strategy "Search Strategy"
  * relatedArtifact 1..1
    * resourceReference 1..1
    * resourceReference only Reference(SearchStrategy)

Profile: CertaintyOfEvidenceRating
Parent: ArtifactAssessment
Id: certainty-of-evidence-rating
Title: "Evidence Assessment"
Description: "A structured assessment of the certainty of evidence for a specific outcome."

// TODO: should single study evidences point to the overall evidence assessment? (e.g. via some kind of partOf = Reference(OverallAssessment))
//       or should they be independent and only be "passively" referenced by the overall assessment (like it is now implemented)?

// #P2.3.3.2, #P2.3.3.3
* artifactReference only Reference(Evidence) // TODO: should we make a profile for Evidence that requires an Outcome Definition?

// TODO: how to mark evidence as missing? #P2.3.3.7 (e.g. if no studies are available for a specific outcome)
//       we need to define the way in FHIR and explicitly mention this in the implementation guide

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  levelOfEvidence 0..1
  and riskOfBias 0..1
  and inconsistency 0..1
  and indirectness 0..1
  and imprecision 0..1
  and publicationBias 0..1
  and doseResponseGradient 0..1
  and plausibleConfounding 0..1
  and largeEffect 0..1
  // TODO: which other components should be included here?

// TODO: the code system and value set is called "quality of evidence"  - is this ok?
// TODO: There is another code system with the same codes: http://hl7.org/fhir/codesystem-certainty-rating.html
* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 1..1
  * classifier from $vs-quality-of-evidence (required)
* content[riskOfBias]
  * type 1..1
  * type = $cs-certainty-type#RiskOfBias "Risk of bias"
* content[inconsistency]
  * type 1..1
  * type = $cs-certainty-type#Inconsistency "Inconsistency"
* content[indirectness]
  * type 1..1
  * type = $cs-certainty-type#Indirectness "Indirectness"
* content[imprecision]
  * type 1..1
  * type = $cs-certainty-type#Imprecision "Imprecision"
* content[publicationBias]
  * type 1..1
  * type = $cs-certainty-type#PublicationBias "Publication bias"
* content[doseResponseGradient]
  * type 1..1
  * type = $cs-certainty-type#DoseResponseGradient "Dose response gradient"
* content[plausibleConfounding]
  * type 1..1
  * type = $cs-certainty-type#PlausibleConfounding "Plausible confounding"
* content[largeEffect]
  * type 1..1
  * type = $cs-certainty-type#LargeEffect "Large effect"


RuleSet: rs-grade-rating-slices
* component contains
  benefitAndHarms 0..1 MS
  and certaintyOfEvidence 0..1 MS
  and preferenceAndValues 0..1 MS
  and resources 0..1 MS
  and equity 0..1 MS
  and acceptability 0..1 MS
  and feasibility 0..1 MS

* component[certaintyOfEvidence]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 1..1
  * classifier from vs-rating-certainty-of-evidence (required)

* component[benefitAndHarms]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-etd-certainty-type#benefit-and-harms "Benefit and harms"
  * classifier 1..1
  * classifier from vs-rating-benefit-and-harms (required)

* component[preferenceAndValues]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-etd-certainty-type#preference-and-values "Preference and values"
  * classifier 1..1
  * classifier from vs-rating-preference-and-values (required)

* component[resources]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-etd-certainty-type#resources "Resources"
  * classifier 1..1
  * classifier from vs-rating-resources (required)

* component[equity]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-etd-certainty-type#equity "Equity"
  * classifier 1..1
  * classifier from vs-rating-equity (required)

* component[acceptability]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-etd-certainty-type#acceptability "Acceptability"
  * classifier 1..1
  * classifier from vs-rating-acceptability (required)

* component[feasibility]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-etd-certainty-type#feasibility "Feasibility"
  * classifier 1..1
  * classifier from vs-rating-feasibility (required)

