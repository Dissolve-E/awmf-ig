CodeSystem: LevelOfConsensusCS
Id: cs-level-of-consensus
Title: "Level of Consensus"
Description: "Level of consensus for a recommendation."
* ^status = #active
* ^content = #complete

* #strong-consensus "Strong consensus" "Agreement by >95% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Starker Konsens"
  * ^designation[=].use = $cs-designation-usage#display "Display"
* #consensus "Consensus" "Agreement by >75-95% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsens"
  * ^designation[=].use = $cs-designation-usage#display "Display"
* #majority-agreement "Majority agreement" "Agreement by >50-75% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Mehrheitliche Zustimmung"
  * ^designation[=].use = $cs-designation-usage#display "Display"
* #no-majority-agreement "No majority agreement" "Agreement by ≤50% of participants."
  * ^designation[+].language = #de
  * ^designation[=].value = "Keine mehrheitliche Zustimmung"
  * ^designation[=].use = $cs-designation-usage#display "Display"
