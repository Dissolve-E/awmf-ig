// Author: Gregor Lichtner @glichtner
CodeSystem: EvidenceToDecisionCertaintyRating
Id: cs-evidence-to-decision-certainty-rating
Title: "Evidence To Decision Certainty Rating"
Description: "CodeSystem defining GRADE Evidence to Decision (EtD) Framework Certainty Ratings"
* insert rs-codesystem-meta
* #small-net-benefit "Small net benefit" "Small net benefit, or little difference between alternatives"
  * ^designation[+].language = #de
  * ^designation[=].value = "Geringer Netto-Nutzen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Geringer Netto-Nutzen, oder geringer Unterschied zwischen den Alternativen."
* #substantial-net-benefit "Substantial net benefit" "Substantial net benefits of the recommended alternative"
  * ^designation[+].language = #de
  * ^designation[=].value = "Erheblicher Netto-Nutzen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Erheblicher Netto-Nutzen der empfohlenen Alternative."
* #important-harms "Important harms" "Important harms"
  * ^designation[+].language = #de
  * ^designation[=].value = "Wesentliche Schäden"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Wesentliche Schäden"
* #substantial-variability "Substantial variability" "Substantial variability is expected or uncertain"
  * ^designation[+].language = #de
  * ^designation[=].value = "Erhebliche Variabilität"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Erhebliche Variabilität ist zu erwarten oder ungewiss."
* #no-substantial-variability "No substantial variability" "No substantial variability expected"
  * ^designation[+].language = #de
  * ^designation[=].value = "Keine erhebliche Variabilität"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Keine erhebliche Variabilität erwartet."
* #few-want-intervention "Few want intervention" "We expect few to want the intervention"
  * ^designation[+].language = #de
  * ^designation[=].value = "Wenige wünschen Intervention"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Wir erwarten, dass nur wenige die Intervention wünschen."
* #factor-not-considered "Factor not considered" "Factor not considered"
  * ^designation[+].language = #de
  * ^designation[=].value = "Unberücksichtigter Faktor"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Unberücksichtigter Faktor"
* #important-issues-or-not-investigated "Important issues" "Important issues, or potential issues not investigated"
  * ^designation[+].language = #de
  * ^designation[=].value = "Wesentliche Probleme"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Wesentliche Probleme oder potenzielle Probleme, die nicht untersucht worden sind."
* #no-important-issues "No important issues" "No important issues with the recommended alternative"
  * ^designation[+].language = #de
  * ^designation[=].value = "Keine wesentlichen Probleme"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Keine wesentlichen Probleme mit der empfohlenen Alternative"
* #important-negative-issues "Important negative issues" "Important negative issues"
  * ^designation[+].language = #de
  * ^designation[=].value = "Wesentliche negative Aspekte"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Wesentliche negative Aspekte"
* #intervention-increases-inequity "Intervention increases inequity" "Intervention likely increases inequity"
  * ^designation[+].language = #de
  * ^designation[=].value = "Intervention erhöht Ungerechtigkeit"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Intervention erhöht wahrscheinlich die Ungerechtigkeit."
* #intervention-poorly-accepted "Intervention poorly accepted" "Intervention is likely poorly accepted"
  * ^designation[+].language = #de
  * ^designation[=].value = "Intervention schlecht angenommen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Intervention wird voraussichtlich schlecht angenommen."
* #intervention-difficult-to-implement "Intervention difficult to implement" "Intervention is likely difficult to implement"
  * ^designation[+].language = #de
  * ^designation[=].value = "Internvention schwer umzusetzen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Intervention ist voraussichtlich schwer umzusetzen."
