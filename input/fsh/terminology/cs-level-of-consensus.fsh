CodeSystem: LevelOfConsensusCS
Id: cs-level-of-consensus
Title: "Level of Consensus"
Description: "CodeSystem defining the values representing the level of consensus for a recommendation."
* insert rs-codesystem-meta
* ^content = #complete

* #strong-consensus "Strong consensus" "Agreement by >95% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Starker Konsens"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zustimmung von > 95 % der Teilnehmenden"
* #consensus "Consensus" "Agreement by >75-95% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsens"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zustimmung von > 75 - 95 % der Teilnehmenden"
* #majority-agreement "Majority agreement" "Agreement by >50-75% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Mehrheitliche Zustimmung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zustimmung von > 50 - 75 % der Teilnehmenden"
* #no-majority-agreement "No majority agreement" "Agreement by ≤50% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Keine mehrheitliche Zustimmung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zustimmung von ≤ 50 % der Teilnehmenden"
