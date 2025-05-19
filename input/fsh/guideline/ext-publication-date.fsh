Extension: PublicationDate
Id: ext-publication-date
Title: "Publication Date"
Description: "The date when the guideline was published."
Context: Composition
* ^purpose = "The date when the guideline was published."
* . 0..1
* . ^short = "Publication Date"
* . ^definition = "The date when the guideline was published."
* value[x] 1..
* value[x] only date
