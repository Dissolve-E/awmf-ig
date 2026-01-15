Profile: PICOQuestion
Parent: $ebm-conceptual-cohort-definition //Unsicher ob dieses Profil oder lieber ein eigenes Profil von Group R6 
Id: pico-question
Title: "PICO Question"
Description: "A structured definition of the PICO question in the context of guidelines and recommendations."

// TODO: Unsicher ob man die relatesTo Extension einschränken sollte : extension[relatesTo].extension[targetReference].valueReference (zB nur auf Recommendation)

* code = $cs-pico#pico-question

* combinationMethod = $cs-group-characteristic-combination#all-of

* characteristic ^slicing.discriminator.type = #value
* characteristic ^slicing.discriminator.path = "code"
* characteristic ^slicing.rules = #open

* characteristic contains 
  population 0..1 and
  intervention 0..1 and
  comparator 0..1 and
  outcome 0..*
* characteristic[population]
  * code = $cs-pico#population
  * value[x] only CodeableConcept or Reference or Expression
  * valueReference only Reference(ConceptualCohortDefinitionPopulation) // TODO: use CodeableReference 
* characteristic[intervention]
  * code = $cs-pico#intervention
  * value[x] only CodeableConcept or Reference or Expression
  * valueReference only Reference(ConceptualCohortDefinitionIntervention)
* characteristic[comparator]
  * code = $cs-pico#comparator
  * value[x] only CodeableConcept or Reference or Expression
  * valueReference only Reference(ConceptualCohortDefinitionComparator)
* characteristic[outcome]
  * code = $cs-pico#outcome
  * value[x] only CodeableConcept or Reference or Expression
  * valueReference only Reference(ConceptualCohortDefinitionOutcome)
