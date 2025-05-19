Extension: PlannedCompletionDate
Id: ext-planned-completion-date
Title: "Planned Completion Date"
Description: "The date when the guideline is planned to be completed."
Context: Composition
* insert rs-extension-url(ext-planned-completion-date)
* ^purpose = "The date when the guideline is planned to be completed."
* . 0..1
* . ^short = "Planned Completion Date"
* . ^definition = "The date when the guideline is planned to be completed."
* value[x] 1..
* value[x] only date
