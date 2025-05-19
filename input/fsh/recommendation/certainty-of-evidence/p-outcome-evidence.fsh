Profile: OutcomeEvidence
Parent: Evidence
Id: outcome-evidence
Title: "Outcome Evidence"
Description: "Represents evidence supporting a specific outcome within a body of clinical or scientific evidence."
* variableDefinition ^slicing.discriminator.type = #value
* variableDefinition ^slicing.discriminator.path = "variableRole"
* variableDefinition ^slicing.rules = #open
* variableDefinition contains outcome 1..*
* variableDefinition[outcome]
  * variableRole = #outcome
