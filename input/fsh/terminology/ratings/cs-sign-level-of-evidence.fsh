CodeSystem: SIGNLevelOfEvidence
Id: cs-sign-level-of-evidence
Title: "SIGN Level of Evidence"
Description: "CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Levels of Evidence."
* insert rs-codesystem-meta
* ^content = #complete

* #1plusplus "1++" "High-quality meta-analyses, systematic reviews of RCTs, or RCTs with a very low risk of bias."
  * ^designation[+].language = #de
  * ^designation[=].value = "1++"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Hochwertige Metaanalysen, systematische Reviews von RCTs oder RCTs mit sehr niedrigem Bias-Risiko."

* #1plus "1+" "Well-conducted meta-analyses, systematic reviews, or RCTs with a low risk of bias."
  * ^designation[+].language = #de
  * ^designation[=].value = "1+"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Gut durchgeführte Metaanalysen, systematische Reviews oder RCTs mit geringem Bias-Risiko."

* #1minus "1-" "Meta-analyses, systematic reviews, or RCTs with a high risk of bias."
  * ^designation[+].language = #de
  * ^designation[=].value = "1-"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Metaanalysen, systematische Reviews oder RCTs mit hohem Bias-Risiko."

* #2plusplus "2++" "High-quality systematic reviews of case-control or cohort studies, or high-quality case-control or cohort studies with a very low risk of confounding or bias and a high probability that the relationship is causal."
  * ^designation[+].language = #de
  * ^designation[=].value = "2++"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Hochwertige systematische Reviews von Fall-Kontroll- oder Kohortenstudien oder hochwertige Fall-Kontroll- oder Kohortenstudien mit sehr niedrigem Risiko für Confounding oder Bias."

* #2plus "2+" "Well-conducted case-control or cohort studies with a low risk of confounding or bias and a moderate probability that the relationship is causal."
  * ^designation[+].language = #de
  * ^designation[=].value = "2+"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Gut durchgeführte Fall-Kontroll- oder Kohortenstudien (nicht-randomisierte Studien) mit niedrigem Risiko für Confounding oder Bias."

* #2minus "2-" "Case-control or cohort studies with a high risk of confounding or bias and a significant risk that the relationship is not causal."
  * ^designation[+].language = #de
  * ^designation[=].value = "2-"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Fall-Kontroll- oder Kohortenstudien mit hohem Risiko für Confounding oder Bias."

* #3 "3" "Non-analytic studies, e.g., case reports, case series."
  * ^designation[+].language = #de
  * ^designation[=].value = "3"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Nicht-analytische Studien, z. B. Fallberichte, Fallserien."

* #4 "4" "Expert opinion."
  * ^designation[+].language = #de
  * ^designation[=].value = "4"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Expertenmeinung."
