Extension: MedicalSubjectCategory
Id: ext-medical-subject-category
Title: "Medical Subject Category"
Description: "An extension to specify medical subject category related to an organization."
Context: Organization
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
  * coding from vs-medical-subject-categories (required)
    * system 1.. MS
    * code 1.. MS
