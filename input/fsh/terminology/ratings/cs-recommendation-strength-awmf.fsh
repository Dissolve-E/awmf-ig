CodeSystem: RecommendationStrengthAWMF
Id: cs-recommendation-strength-awmf
Title: "Recommendation Strength (AWMF)"
Description: "CodeSystem defining the grading of recommendations according to German guideline methodology as used in AWMF S3 guidelines."
* insert rs-codesystem-meta
* ^content = #complete

* #A "Strong Recommendation" "Uses wording such as 'shall' / 'shall not' (original: 'soll' / 'soll nicht')."
  * ^designation[+].language = #de
  * ^designation[=].value = "Starke Empfehlung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Nutzung von Formulierungen mit 'soll' / 'soll nicht'"
* #B "Recommendation" "Uses wording such as 'should' / 'should not' (original: 'sollte' / 'sollte nicht')."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Nutzung von Formulierungen mit 'sollte' / 'sollte nicht'"
* #0 "Open Recommendation" "Uses wording such as 'may be considered' / 'may be omitted' (original: 'kann erwogen werden' / 'kann verzichtet werden')."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlung offen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Nutzung von Formulierungen mit 'kann erwogen werden' / 'kann verzichtet werden'"
