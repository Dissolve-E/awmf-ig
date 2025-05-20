CodeSystem: CareSetting
Id: cs-care-setting
Title: "Care Setting"
Description: "CodeSystem defining different care settings, including levels of care, healthcare services, and treatment contexts."
// TODO: add descriptions
// Prävention, Früherkennung, Diagnose, Therapie, Rehabilitation
// primärärztliche Vesorgung, spezialärztliche Versorgung
// ambulant, stationär, teilstationär
* #prevention "Prevention" "Activities aimed at preventing diseases or injuries before they occur."
  * ^designation[+].language = #de
  * ^designation[=].value = "Prävention"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #early-detection "Early Detection" "The identification of diseases or conditions at an early stage, often before symptoms appear."
  * ^designation[+].language = #de
  * ^designation[=].value = "Früherkennung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #diagnosis "Diagnosis" "The process of determining the nature and cause of a disease or injury through evaluation of patient history, examination, and tests."
  * ^designation[+].language = #de
  * ^designation[=].value = "Diagnose"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #therapy "Therapy" "The treatment of a disease or condition, including medical, surgical, or psychological interventions."
  * ^designation[+].language = #de
  * ^designation[=].value = "Therapie"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #rehabilitation "Rehabilitation" "The process of restoring physical, mental, or social abilities lost due to illness or injury."
  * ^designation[+].language = #de
  * ^designation[=].value = "Rehabilitation"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #primary-care "Primary Care" "First-contact healthcare provided by general practitioners or family physicians."
  * ^designation[+].language = #de
  * ^designation[=].value = "Primärärztliche Vesorgung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #specialized-care "Specialized Care" "Healthcare provided by medical specialists with advanced training in specific fields."
  * ^designation[+].language = #de
  * ^designation[=].value = "Spezialärztliche Versorgung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #outpatient "Outpatient" "Healthcare services provided to patients who are not admitted to a hospital or other facility."
  * ^designation[+].language = #de
  * ^designation[=].value = "Ambulant"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #inpatient "Inpatient" "Healthcare services provided to patients who are admitted to a hospital or other facility for at least one night."
  * ^designation[+].language = #de
  * ^designation[=].value = "Stationär"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""
* #partial-hospitalization "Partial Hospitalization" "Healthcare services provided in a hospital or facility during the day, with patients returning home at night."
  * ^designation[+].language = #de
  * ^designation[=].value = "Teilstationär"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = ""