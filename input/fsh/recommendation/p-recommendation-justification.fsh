Profile: RecommendationJustication
Parent: ArtifactAssessment
Id: recommendation-justication
Title: "Recommendation Justication"
Description: ""
* artifactReference only Reference(Recommendation)

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  recommendationSpecification 0..1
  and evidence 0..*


* content[recommendationSpecification]
  * component[strengthOfRecommendation]
  * component[strengthOfConsensus]

// Variante 1: extra profil für "overall evidence"
* content[evidence][+]
  * type = cs-awmf#evidence
  * relatedArtifact = Reference(RecommendationHAPDiagnosis-Mortality)
* content[evidence][+]
  * type = cs-awmf#evidence
  * relatedArtifact = Reference(RecommendationHAPDiagnosis-AntibioticDays)
* content[evidence][+]
  * type = cs-awmf#evidence
  * relatedArtifact = Reference(RecommendationHAPDiagnosis-TimeToDeescalation)

// Variante 2: overall-evidenz-bewertung direkt hier
* content[evidence][+] // Mortalität
// TODO: wie outcome?
  * component[levelOfEvidence].classifier = #very-niedrig
  * component[riskOfBias].classifier = #sehr-strong
  * relatedArtifact[outcome].resourceReference = Reference(Mortality)
* content[evidence][+] // Antibiotikatage
  * component[levelOfEvidence].classifier = #very-niedrig
  * component[riskOfBias].classifier = #sehr-strong
  * relatedArtifact[outcome].resourceReference = Reference(AntibioticDays)
* content[evidence][+] // Zeit bis Deeskalation
  * component[levelOfEvidence].classifier = #very-niedrig
  * component[riskOfBias].classifier = #sehr-strong
  * relatedArtifact[outcome].resourceReference = Reference(TimeToDeescalation)

/*
  * component[primaryEvidence]
    * type = cs-awmf#evidence-single-study
    * relatedArtifact = Reference(EvidenceAssessment)
    * content[+]
      * type = cs-awmf#outcome
*/

Profile: EvidenceAssessment
Parent: ArtifactAssessment
Id: evidence-assessment
Title: "Evidence Assessment"
Description: ""

// TODO: wie outcome?
* artifactReference only Reference(OutcomeDefinition)


* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  levelOfEvidence 0..1
  and riskOfBias 0..1
* content[levelOfEvidence]
* content[riskOfBias]


// ALTERNATIVE
* content[+]
  * relatedArtifact.resourceReference = Reference(Mortality)
  * component[levelOfEvidence].classifier = #very-niedrig
  * component[riskOfBias].classifier = #sehr-strong
* content[+]
  * relatedArtifact.resourceReference = Reference(AntibioticDays)
  * component[levelOfEvidence].classifier = #very-niedrig
  * component[riskOfBias].classifier = #sehr-strong
* content[+]
  * relatedArtifact.resourceReference = Reference(TimeToDeescalation)
  * component[levelOfEvidence].classifier = #very-niedrig
  * component[riskOfBias].classifier = #sehr-strong

// ALTERNATIVE 2
* content
  * component[+]
    * relatedArtifact.resourceReference = Reference(Mortality)
    * component[levelOfEvidence].classifier = #very-niedrig
    * component[riskOfBias].classifier = #sehr-strong
  * component[+]
    * relatedArtifact.resourceReference = Reference(AntibioticDays)
    * component[levelOfEvidence].classifier = #very-niedrig
    * component[riskOfBias].classifier = #sehr-strong
  * component[+]
    * relatedArtifact.resourceReference = Reference(TimeToDeescalation)
    * component[levelOfEvidence].classifier = #very-niedrig
    * component[riskOfBias].classifier = #sehr-strong




Instance: RecommendationHAPDiagnosis-Mortality
InstanceOf: EvidenceAssessment
Usage: #example
Title: "RecommendationHAPDiagnosis-Mortality"
Description: ""
* artifactReference.display = "Gesamt-Evidenz Mortalität"
* content[levelOfEvidence] = #very-niedrig

