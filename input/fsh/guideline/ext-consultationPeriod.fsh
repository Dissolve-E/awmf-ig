Extension: ConsultationPeriod
Id: ext-consultation-period
Title: "Consultation Period"
Description: "This extension allows for the indication of the period during which the guideline is open for consultation."
Context: Composition
* ^purpose = "The ConsultationPeriod extensions allows to indicate the period during which the guideline is open for consultation."
* . 0..1
* . ^short = "Consultation Period"
* . ^definition = "The period during which the guideline is open for consultation."
* value[x] 1..
* value[x] only Period
