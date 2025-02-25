Extension: FirstPublicationDate
Id: ext-first-publication-date
Title: "First Publication Date"
Description: "The date when the document was first published."
Context: Composition
* ^purpose = "The date when the document was first published."
* . 0..1
* . ^short = "First Publication Date"
* . ^definition = "The date when the document was first published."
* value[x] 1..
* value[x] only date
