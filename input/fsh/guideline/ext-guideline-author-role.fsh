Extension: GuidelineAuthorRoleExt  // #P2.3.1.4
Id: ext-guideline-author-role
Title: "Guideline Author Role"
Description: "The role of the author of the guideline."
Context: Composition.author
* insert rs-extension-url(ext-guideline-author-role)
* ^purpose = "Describes the role of the author of the guideline."
* . 0..1
* . ^short = "Author Role"
* . ^definition = "Describes the role of the author of the guideline."
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from vs-guideline-author-role (extensible)
