Extension: SubmissionDate
Id: ext-submission-date
Title: "Submission Date"
Description: "The date when the guideline was submitted to the system."
Context: Composition
* ^purpose = "The date when the guideline was submitted to the system."
* . 0..1
* . ^short = "Submission Date"
* . ^definition = "The date when the guideline was submitted to the system."
* value[x] 1..
* value[x] only date
