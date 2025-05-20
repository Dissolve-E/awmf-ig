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
  * ^definition.extension[$ext-translation].extension[content].valueString = "Aktivitäten, die darauf abzielen, Krankheiten oder Verletzungen zu verhindern, bevor sie auftreten."
* #early-detection "Early Detection" "The identification of diseases or conditions at an early stage, often before symptoms appear."
  * ^designation[+].language = #de
  * ^designation[=].value = "Früherkennung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Erkennung von Krankheiten oder Zuständen in einem frühen Stadium, oft bevor Symptome auftreten."
* #diagnosis "Diagnosis" "The process of determining the nature and cause of a disease or injury through evaluation of patient history, examination, and tests."
  * ^designation[+].language = #de
  * ^designation[=].value = "Diagnostik"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Prozess der Bestimmung der Art und Ursache einer Krankheit oder Verletzung durch Auswertung der Krankengeschichte, Untersuchungen und Tests."
* #therapy "Therapy" "The treatment of a disease or condition, including medical, surgical, or psychological interventions."
  * ^designation[+].language = #de
  * ^designation[=].value = "Behandlung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Behandlung einer Krankheit oder eines Zustands, einschließlich medizinischer, chirurgischer oder psychologischer Eingriffe."
* #rehabilitation "Rehabilitation" "The process of restoring physical, mental, or social abilities lost due to illness or injury."
  * ^designation[+].language = #de
  * ^designation[=].value = "Rehabilitation"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Prozess der Wiederherstellung körperlicher, geistiger oder sozialer Fähigkeiten, die aufgrund von Krankheit oder Verletzung verloren gegangen sind."
* #primary-care "Primary Care" "First-contact healthcare provided by general practitioners or family physicians."
  * ^designation[+].language = #de
  * ^designation[=].value = "Primärärztliche Versorgung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Medizinische Versorgung durch den Allgemein- oder Hausarzt."
* #specialized-care "Specialized Care" "Healthcare provided by medical specialists with advanced training in specific fields."
  * ^designation[+].language = #de
  * ^designation[=].value = "Spezialärztliche Versorgung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Medizinische Versorgung durch Fachärzt*innen mit spezieller Ausbildung in bestimmten Bereichen."
* #outpatient "Outpatient" "Healthcare services provided to patients who are not admitted to a hospital or other facility."
  * ^designation[+].language = #de
  * ^designation[=].value = "Ambulant"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Gesundheitsdienstleistungen für Patient*innen, die nicht in ein Krankenhaus oder eine andere Einrichtung eingewiesen werden."
* #inpatient "Inpatient" "Healthcare services provided to patients who are admitted to a hospital or other facility for at least one night."
  * ^designation[+].language = #de
  * ^designation[=].value = "Stationär"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Gesundheitsdienstleistungen für Patient*innen, die für mindestens eine Nacht in ein Krankenhaus oder eine andere Einrichtung eingewiesen werden."
* #partial-hospitalization "Partial Hospitalization" "Healthcare services provided in a hospital or facility during the day, with patients returning home at night."
  * ^designation[+].language = #de
  * ^designation[=].value = "Teilstationär"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Gesundheitsdienstleistungen, die tagsüber in einem Krankenhaus oder einer Einrichtung erbracht werden; Patient*innen bleiben nicht über Nacht im Krankenhaus oder in der Gesundheitseinrichtung."