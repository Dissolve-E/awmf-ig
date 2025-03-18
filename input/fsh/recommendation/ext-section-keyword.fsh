Extension: SectionKeyword
Id: ext-section-keyword
Title: "Section Keyword"
Description: "Keywords associated with the section"
Context: Element
* ^purpose = "The SectionKeyword extension is used to capture keywords associated with the section."
* . 0..*
* . ^short = "Keyword"
* . ^definition = "Keywords associated with the section"
* . ^comment = "Keywords associated with the section"
* value[x] 1..
* value[x] only CodeableConcept
