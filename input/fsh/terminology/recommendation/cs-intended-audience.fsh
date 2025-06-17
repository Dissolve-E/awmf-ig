CodeSystem: IntendedAudienceCS
Id: cs-intended-audience
Title: "Intended Audience Code System"
Description: "CodeSystem defining possible intended audiences for a section"
* insert rs-codesystem-meta
* #patient "Patient" "The content is intended for the patient"
  * ^designation[+].language = #de
  * ^designation[=].value = "Patient*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Patient*innen."
* #physician "Physician" "The content is intended for the physician"
  * ^designation[+].language = #de
  * ^designation[=].value = "Arzt/Ärztin"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Ärzt*innen."
* #nurse "Nurse" "The content is intended for the nurse"
  * ^designation[+].language = #de
  * ^designation[=].value = "Pfleger*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Krankenpfleger*innen."
* #student "Student" "The content is intended for the student"
  * ^designation[+].language = #de
  * ^designation[=].value = "Studierende"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Student*innen."
* #relative "Relative" "The content is intended for the relative of the patient"
  * ^designation[+].language = #de
  * ^designation[=].value = "Angehörige*r"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Angehörige von Patient*innen."
* #caregiver "Caregiver" "The content is intended for the caregiver of the patient"
  * ^designation[+].language = #de
  * ^designation[=].value = "Betreuer*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Betreuer*innen von Patient*innen."
* #layperson "Layperson" "The content is intended for a layperson"
  * ^designation[+].language = #de
  * ^designation[=].value = "Laie"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an Laien."
* #therapist "Therapist" "The content is intended for therapeutic healthcare professionals (e.g., physiotherapists, occupational therapists, speech therapists)."
  * ^designation[+].language = #de
  * ^designation[=].value = "Therapeutisches Personal"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Inhalt richtet sich an therapeutisches Personal (z.B. Physio-, Ergo- oder Sprachtherapeut*innen)."
