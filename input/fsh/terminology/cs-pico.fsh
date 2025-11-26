CodeSystem: PICOCS
Id: cs-pico
Title: "PICO Related Terms"
Description: "CodeSystem defining different terms related to PICO question and objects"
* insert rs-codesystem-meta

* #pico-question "PICO question" "PICO question"
  * ^designation[+].language = #de
  * ^designation[=].value = "PICO Fragestellung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "PICO Fragestellung"
* #population "Population" "Population" // $ncit#C17005 "Population Group"
  * ^designation[+].language = #de
  * ^designation[=].value = "Population"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Population"
* #intervention "Intervention" "Intervention" // #$ncit#C207649 "Trial Intervention"
  * ^designation[+].language = #de
  * ^designation[=].value = "Intervention"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Intervention"
* #comparator "Comparator" "Comparator" // $ncit#C142458 "Comparator"
  * ^designation[+].language = #de
  * ^designation[=].value = "Vergleichsintervention"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Vergleichsintervention"
* #outcome "Outcome" "Outcome" // $ncit#C20200 "Outcome"
  * ^designation[+].language = #de
  * ^designation[=].value = "Outcome"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Outcome"
* #setting "Setting" "Setting"
  * ^designation[+].language = #de
  * ^designation[=].value = "Setting"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Setting"
* #timing "Timing" "Timing"
  * ^designation[+].language = #de
  * ^designation[=].value = "Zeitpunkt"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zeitpunkt"
