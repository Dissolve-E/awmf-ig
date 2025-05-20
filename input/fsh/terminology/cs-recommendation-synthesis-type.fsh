CodeSystem: RecommendationSynthesisTypeCS
Id: cs-recommendation-synthesis-type
Title: "Recommendation Synthesis Type"
Description: "CodeSystem defining values representing the synthesis type of a recommendation"
* insert rs-codesystem-meta
* #evidence-based "Evidence-based" "Evidence-based recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Evidenzbasiert"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Evidenzbasierte Empfehlung"
* #expert-consensus "Expert Consensus" "Expert consensus recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsensbasiert"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Konsensbasierte Empfehlung"