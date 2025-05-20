// Author: Gregor Lichtner @glichtner
CodeSystem: EvidenceToDecisionCertaintyType
Id: cs-evidence-to-decision-certainty-type
Title: "Evidence To Decision Certainty type"
Description: "CodeSystem defining values to represent the GRADE Evidence to Decision (EtD) Framework Certainty Type"
* insert rs-codesystem-meta
* #benefits-and-harms "Benefits and Harms" "Summary of most important benefits and harms"
  * ^designation[+].language = #de
  * ^designation[=].value = "Nutzen und Schaden"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zusammenfassung der wichtigsten Nutzen und Schäden."

* #preference-and-values "Preference and values" "Typical patient preferences and values? Common issues or expected variability?"
  * ^designation[+].language = #de
  * ^designation[=].value = "Wertvorstellungen und Präferenzen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Typische Wertvorstellungen und Präferenzen der/des Patient*in? Geläufige Probleme oder erwartete Variabilität?"

* #resources "Resources" "Issues with costs or resource use? For whom? Cost-benefit analysis? Implementation or other issues?"
  * ^designation[+].language = #de
  * ^designation[=].value = "Ressourcen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Probleme bezogen auf Kosten oder Ressourcenverbrauch? Für wen? Kosten-Nutzen-Analyse? Umsetzung oder andere Probleme?"

* #equity "Equity" "How do the different alternatives affect equity?"
  * ^designation[+].language = #de
  * ^designation[=].value = "Gerechtigkeit"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Wie wirken sich die verschiedenen Alternativen auf die Gerechtigkeit aus?"

* #acceptability "Acceptability" "Are the alternatives acceptable for the target population and its implementors?"
  * ^designation[+].language = #de
  * ^designation[=].value = "Akzeptanz"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Sind die Alternativen für die Zielpopulatino und die Durchführenden akzeptabel?"

* #feasibility "Feasibility" "How feasible will it be to implement the different alternatives? Any issues?"
  * ^designation[+].language = #de
  * ^designation[=].value = "Durchführbarkeit"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Wie praktikabel ist die Umsetzung der verschiedenen Alternativen? Gibt es Probleme?"