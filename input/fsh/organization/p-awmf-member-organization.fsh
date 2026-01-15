Profile: AWMFMemberOrganization
Parent: MedicalSociety
Id: awmf-member-organization
Title: "AWMF Member Organization"
Description: "An organization that is a member of the AWMF"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains awmf-association-number 1..1
* identifier[awmf-association-number]
  * system 1..1
  * system = "http://fhir.awmf.org/association"
  * use = #official
  * value 1..1

* type 1..*
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains organization-type 1..1
* type[organization-type] = cs-awmf#awmf-member-organization


Instance: AWMFMemberOrganizationExample
InstanceOf: awmf-member-organization
Usage: #example
Title: "AWMF Member Organization Example"
Description: "An example of an AWMF member organization."
* identifier[awmf-association-number]
  * value = "-1"
* name = "Example AWMF Member Organization"
* insert narrative([[AWMF Member Organization Example]])
* contact.telecom
  * system = #url
  * value = "https://www.example.org"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#psychosocial "Psychosocial Disciplines"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubject][+].valueCodeableConcept.text = "Anesthesiology and Intensive Care Medicine"
