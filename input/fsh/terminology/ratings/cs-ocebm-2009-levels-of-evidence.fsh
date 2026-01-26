CodeSystem: OCEBM2009LevelsOfEvidence
Id: cs-ocebm-2009-levels-of-evidence
Title: "OCEBM 2009 Levels of Evidence"
Description: "CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2009 CEBM Levels of Evidence"
* insert rs-codesystem-meta
* ^content = #complete

* #1a "1a" "Systematic reviews of high-quality RCTs"
  * ^designation[+].language = #de
  * ^designation[=].value = "1a"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Systematische Reviews hochwertiger RCTs"

* #1b "1b" "Individual RCT (with narrow confidence interval)"
  * ^designation[+].language = #de
  * ^designation[=].value = "1b"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Einzelne randomisierte kontrollierte Studien (mit engem Konfidenzintervall)"

* #1c "1c" "All or none RCTs"
  * ^designation[+].language = #de
  * ^designation[=].value = "1c"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Alle oder keine randomisierten kontrollierten Studien"

* #2a "2a" "Systematic reviews of cohort studies"
  * ^designation[+].language = #de
  * ^designation[=].value = "2a"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Systematische Reviews von Kohortenstudien"

* #2b "2b" "Individual cohort study or low-quality RCT"
  * ^designation[+].language = #de
  * ^designation[=].value = "2b"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Individuelle Kohortenstudie oder randomisierte kontrollierte Studien mit niedriger Qualität"

* #2c "2c" "Outcomes research; ecological studies"
  * ^designation[+].language = #de
  * ^designation[=].value = "2c"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Outcomes-Forschung; ökologische Studien"

* #3a "3a" "Systematic reviews of case-control studies"
  * ^designation[+].language = #de
  * ^designation[=].value = "3a"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Systematische Überprüfung von Fall-Kontroll-Studien"

* #3b "3b" "Individual case-control study"
  * ^designation[+].language = #de
  * ^designation[=].value = "3b"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Einzelne Fall-Kontroll-Studie"

* #4 "4" "Case series"
  * ^designation[+].language = #de
  * ^designation[=].value = "4"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Fallserie"

* #5 "5" "Expert opinion"
  * ^designation[+].language = #de
  * ^designation[=].value = "5"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Expertenmeinung"