Extension: SectionLanguageExt // #P2.3.2.21
Id: ext-section-language
Title: "Section Language"
Description: "This extension allows for the indication of the Language of the Section."
Context: Composition.section
* . 0..1
* . ^short = "Language for the Section"
* . ^definition = "The Language of the Section."
* . ^comment = "This is used where an item may repeat to indicate the language of each repeat."
* value[x] 1..
* value[x] only code
* value[x] from CommonLanguages (preferred)
* value[x] ^binding.extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/binding-definition"
* value[x] ^binding.extension[=].valueMarkdown = "A human language."
* value[x] ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-maxValueSet"
* value[x] ^binding.extension[=].valueCanonical = "http://hl7.org/fhir/ValueSet/all-languages"
* value[x] ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* value[x] ^binding.extension[=].valueString = "Language"
* value[x] ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* value[x] ^binding.extension[=].valueBoolean = true
* value[x] ^binding.description = "IETF language tag"
