Profile: GuidelineAuthorRole // #P2.3.1.4
Parent: PractitionerRole
Id: guideline-author-role
Title: "Guideline Author Role"
Description: "The role of the author of the guideline."
* period 1..1
* practitioner only Reference(GuidelineAuthor)

Instance: GuidelineAuthorRoleExample
InstanceOf: guideline-author-role
Usage: #example
Title: "Guideline Author Role Example"
Description: "An example of a guideline author role."
* practitioner = Reference(GuidelineAuthorExample)
* organization = Reference(AWMFMemberOrganizationExample)
* period
  * start = "2022-08-01"
  * end = "2023-12-31"
* code.text = "Coordinaion and scientific leadership"
* insert narrative([[Guideline Author Role Example]])
