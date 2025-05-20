CodeSystem: TargetPatientGroup
Id: cs-target-patient-group
Title: "Target Patient Group"
Description: "CodeSystem defining the intended patient population for whom the guideline is applicable."
* #adults "Adults" "Guideline specifically targeted at adult patients."
  * ^designation[+].language = #de
  * ^designation[=].value = "Erwachsene"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Leitlinie richtet sich an Erwachsene."
* #children-adolescents "Children/Adolescents" "Guideline specifically targeted at children and adolescents."
  * ^designation[+].language = #de
  * ^designation[=].value = "Kinder und Jugendliche"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Leitlinie richtet sich an Kinder und Jugendliche." 