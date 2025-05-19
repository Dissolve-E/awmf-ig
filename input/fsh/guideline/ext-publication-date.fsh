Extension: PublicationDate
Id: ext-publication-date
Title: "Publication Date"
Description: "This extensions allows for the indication of the date when the guideline was published."
Context: Composition
* insert rs-extension-url(ext-publication-date)
* ^purpose = "The PublicationDate extension allows to indicate the date when the guideline was published."
* . 0..1
* . ^short = "Publication Date"
* . ^definition = "The date when the guideline was published."
* value[x] 1..
* value[x] only date
