CodeSystem: OCEBM2011LevelsOfEvidence
Id: cs-ocebm-2011-levels-of-evidence
Title: "OCEBM 2011 Levels of Evidence"
Description: "CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence."
* ^status = #active
* ^content = #complete

* #level1 "Systematic Reviews and Randomized Trials" "Includes systematic reviews of randomized trials or n-of-1 trials."
  * ^designation[+].language = #de
  * ^designation[=].value = "Systematische Reviews und randomisierte Studien"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Schließt systematische Reviews von randomisierten Studien oder n-of-1-Studien ein."

* #level2 "Cohort Studies" "Includes systematic reviews of cohort studies or individual cohort studies and low-quality randomized trials."
  * ^designation[+].language = #de
  * ^designation[=].value = "Kohortenstudien"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Schließt systematische Reviews von Kohortenstudien oder einzelne Kohortenstudien oder randomisierte Studien mit niedriger Qualität ein."

* #level3 "Case-Control Studies" "Includes systematic reviews of case-control studies or individual case-control studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Fall-Kontroll-Studie"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Schließt systematische Reviews von Fall-Kontroll-Studien oder einzelne Fall-Kontroll-Studien."

* #level4 "Case Series" "Includes case series and poor-quality cohort and case-control studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Fallserien"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Schließt Fallserien sowie Kohorten- und Fall-Kontroll-Studien mit niedriger Qualität ein."

* #level5 "Expert Opinion" "Includes expert opinion without explicit critical appraisal, or based on physiology, bench research, or 'first principles'."
  * ^designation[+].language = #de
  * ^designation[=].value = "Expertenmeinung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Umfasst Expertenmeinung(en) ohne explizite kritische Beurteilung oder auf der Grundlage von Physiologie, Bench Research oder First Principles"