Extension: SubmissionDate
Id: ext-submission-date
Title: "Submission Date"
Description: "This extension allows for the indication of the date when the guideline was submitted to the system."
Context: Composition
* insert rs-extension-url(ext-submission-date)
* ^purpose = "The SubmissionDate extension is used to indicate the date when the guideline was submitted to the system."
* . 0..1
* . ^short = "Submission Date"
* . ^definition = "The date when the guideline was submitted to the system."
* value[x] 1..
* value[x] only date
