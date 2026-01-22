Profile: MedicalSociety
Parent: Organization
Id: medical-society
Title: "Medical Society"
Description: "A profile for medical societies."
* extension contains 
  ext-medical-subject-category named medicalSubjectCategory 0..*
  and ext-medical-subject named medicalSubject 0..*
  and $ext-organization-brand named brand 0..1 
  and $ext-organization-period named organizationPeriod 0..1

* type 1..*
* type = cs-awmf#medical-society


Instance: MedicalSocietyExample
InstanceOf: medical-society
Usage: #example
Title: "Medical Society Example"
Description: "An example of a medical society."
* name = "Example Medical Society"
* insert narrative([[Some Medical Society]])
* contact.telecom
  * system = #url
  * value = "https://www.example.org"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#psychosocial "Psychosocial Disciplines"
* extension[medicalSubjectCategory][+].valueCodeableConcept = cs-medical-subject-categories#surgical "Surgical Disciplines"
* extension[medicalSubject][+].valueCodeableConcept.text = "Anesthesiology and Intensive Care Medicine"
* extension[organizationPeriod].valuePeriod.start = "2000-01-01"
* extension[organizationPeriod].valuePeriod.end = "2050-12-31"
