CodeSystem: AWMFGuidelineStatus
Id: cs-awmf-guideline-status
Title: "AWMF Guideline Status"
Description: "CodeSystem representing the guideline status according to the AWMF."
* insert rs-codesystem-meta
* ^publisher = "Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF) e.V"
* ^content = #complete
* #registered "Registered"
  * ^designation[+].language = #de
  * ^designation[=].value = "Angemeldet"
* #preliminary "Preliminary"
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsultationsfassung"
* #final "Final"
  * ^designation[+].language = #de
  * ^designation[=].value = "Veröffentlicht"
* #amended "Amended"
  * ^designation[+].language = #de
  * ^designation[=].value = "Amendment publiziert"
* #corrected "Corrected"
  * ^designation[+].language = #de
  * ^designation[=].value = "Korrigiert"
* #cancelled "Cancelled"
  * ^designation[+].language = #de
  * ^designation[=].value = "Zurückgezogen"
* #deprecated "Deprecated"
  * ^designation[+].language = #de
  * ^designation[=].value = "Abgelaufen"