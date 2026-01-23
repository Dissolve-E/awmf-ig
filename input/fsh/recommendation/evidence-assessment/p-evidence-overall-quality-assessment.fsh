Profile: EvidenceOverallQualityAssessment
Parent: EvidenceAssessment
Id: evidence-overall-quality-assessment
Title: "Evidence Overall Quality Assessment"
Description: "A structured assessment of the overall evidence for a specific outcome."
* content contains outcome 0..1
* content[outcome]
  * type 1..1
  * type = $cs-ebm-ig#outcome "Outcome"
  * relatesTo 1..1
    * type 1..1
    * type = $cs-related-artifact-type#depends-on "Depends On" // TODO: change to outcome when building on >6.0.0-ballot3 (currently value set binding is "required")
    * targetReference 1..1
    * targetReference only Reference(ConceptualCohortDefinitionOutcome or OutcomeEvidence)
