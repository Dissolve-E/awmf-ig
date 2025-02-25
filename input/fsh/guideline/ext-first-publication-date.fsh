Extension: FirstPublicationDate
Id: ext-first-publication-date
Title: "First Publication Date"
Description: "The date when the guideline was first published."
Context: Composition
* ^purpose = "The date when the guideline was first published."
* . 0..1
* . ^short = "First Publication Date"
* . ^definition = "The date when the guideline was first published."
* value[x] 1..
* value[x] only date
