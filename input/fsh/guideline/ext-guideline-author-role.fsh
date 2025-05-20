Extension: GuidelineAuthorRoleExt  // #P2.3.1.4
Id: ext-guideline-author-role
Title: "Guideline Author Role"
Description: "This extension allows for the indication of the role of the author of the guideline."
Context: Composition.author
* ^purpose = "The GuidelineAuthorRoleExt extension describes the role of the author of the guideline."
* . ^short = "Author Role"
* . ^definition = "Describes the role of the author of the guideline."
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from vs-guideline-author-role (extensible)
