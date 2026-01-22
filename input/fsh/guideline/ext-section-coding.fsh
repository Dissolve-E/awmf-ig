Extension: SectionCoding
Id: ext-section-coding
Title: "Section Coding"
Description: "This extension allows for the assignment of a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts."
Context: Composition.section
* ^purpose = "The SectionCoding extension is used to indicate a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts."
* . ^short = "Section Coding"
* . ^definition = "Section Coding of a Composition providing a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts."
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
