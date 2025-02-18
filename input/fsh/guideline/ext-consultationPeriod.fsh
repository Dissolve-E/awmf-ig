Extension: ConsultationPeriod
Id: ext-consultation-period
Title: "Consultation Period"
Description: "The period during which the document is open for consultation."
Context: Composition
* ^purpose = "The period during which the document is open for consultation."
* . 0..1
* . ^short = "Consultation Period"
* . ^definition = "The period during which the document is open for consultation."
* value[x] 1..
* value[x] only Period
