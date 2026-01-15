Profile: PatientOrganization
Parent: Organization
Id: patient-organization
Title: "Patient Organization"
Description: "An organization that represents patients"
* type 1..*
* type ^slicing.discriminator.type = #value
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains organization-type 1..1
* type[organization-type] = cs-awmf#patient-organization
