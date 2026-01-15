Instance: PICOQuestionRec17
InstanceOf: PICOQuestion
Usage: #example
Title: "PICO Question of Recommendation 17 from Guideline 038-013"
Description: "Schlüsselfrage: Sind Tests in nicht-spezialisierten Settings sinnvoll, um eine Demenz zu erkennen bei Personen, die kognitive Störungen berichten oder bei denen eine
kognitive Störung beobachtet wird und die einer solchen Untersuchung zustimmen?"

* description = "Schlüsselfrage: Sind Tests in nicht-spezialisierten Settings sinnvoll, um eine Demenz zu erkennen bei Personen, die kognitive Störungen berichten oder bei denen eine
kognitive Störung beobachtet wird und die einer solchen Untersuchung zustimmen?"

* characteristic[population]
  * code = $cs-pico#population
  * valueReference = Reference(PICOPopulationRec17)
  * exclude = false
* characteristic[intervention]
  * code = $cs-pico#intervention
  * valueReference = Reference(PICOInterventionRec17)
  * exclude = false
* characteristic[comparator]
  * code = $cs-pico#comparator
  * valueReference = Reference(PICOComparatorRec17)
  * exclude = false
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(PICOOutcomeSensitivityRec17)
  * exclude = false
* characteristic[outcome][+]
  * code = $cs-pico#outcome
  * valueReference = Reference(PICOOutcomeSpecificityRec17)
  * exclude = false
