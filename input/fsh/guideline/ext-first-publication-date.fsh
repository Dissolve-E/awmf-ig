Extension: FirstPublicationDate
Id: ext-first-publication-date
Title: "First Publication Date"
Description: "This extension allows for the indication of the date when the guideline was first published."
Context: Composition
* ^purpose = "The FirstPublicationDate extensions allows to indicate the date when the guideline was first published."
* . 0..1
* . ^short = "First Publication Date"
* . ^definition = "The date when the guideline was first published."
* value[x] 1..
* value[x] only date
