Extension: AuthorLanguage
Id: ext-author-language
Title: "Author Language"
Description: "This extension allows for the specification of the language(s) the author contributed to a section in a FHIR Composition."
Context: Reference
* . ^short = "Language(s) used by the author"
* . ^definition = "Indicates the language(s) contributed by the author for content in a Composition section."
* . ^comment = "Use when an author contributes content in multiple languages or to clarify which languages were authored."
* . 0..1
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
