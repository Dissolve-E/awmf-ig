CodeSystem: ClinicalApplicationTypeCS
Id: cs-clinical-application-type
Title: "Clinical Application Type"
Description: "CodeSystem defining different clinical application types"
* insert rs-codesystem-meta
* #diagnostic "Diagnostic" "Diagnostic"
  * ^designation[+].language = #de
  * ^designation[=].value = "Diagnostisch"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diagnostisch"
* #therapeutic "Therapeutic" "Therapeutic"
  * ^designation[+].language = #de
  * ^designation[=].value = "Therapeutisch"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Therapeutisch"
* #prognostic "Prognostic" "Prognostic"
  * ^designation[+].language = #de
  * ^designation[=].value = "Prognostisch"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Prognostisch"
* #monitoring "Monitoring" "Monitoring"
  * ^designation[+].language = #de
  * ^designation[=].value = "Monitoring"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Monitoring"
* #screening "Screening" "Screening"
  * ^designation[+].language = #de
  * ^designation[=].value = "Screening"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Screening"
* #preventive "Preventive" "Preventive"
  * ^designation[+].language = #de
  * ^designation[=].value = "Präventiv"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Präventiv"
