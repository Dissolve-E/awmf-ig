Profile: GuidelineAuthor // #P2.3.1.4
Parent: Practitioner
Id: guideline-author
Title: "Guideline Author"
Description: "A person that authored a guideline."
* name 1..1
* telecom 0..*

Instance: GuidelineAuthorExample
InstanceOf: guideline-author
Usage: #example
Title: "Guideline Author Example"
Description: "An example of a guideline author."
* insert narrative([[Guideline Author Example]])
* name
  * family = "Smith"
  * given = "John"
* telecom
  * system = #phone
  * value = "555-555-5555"
