Extension: SectionIntendedAudience
Id: ext-section-intended-audience
Title: "Section Intended Audience"
Description: "This extension allows for the indication of the target audience for the section"
Context: Element
* ^purpose = "The SectionIntendedAudience extension is used to indicate the intended audience for the section."
* . 0..*
* . ^short = "Intended Audience"
* . ^definition = "Target audience for the section"
* . ^comment = "Indicates who the content of the section is aimed at"
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept from vs-intended-audience (required)
