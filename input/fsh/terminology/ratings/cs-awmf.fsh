CodeSystem: RecommendationStrengthAWMF
Id: cs-recommendation-strength-awmf
Title: "Recommendation Strength (AWMF)"
Description: "Grading of recommendations according to German guideline methodology as used in AWMF S3 guidelines."
* ^content = #complete

* #A "Strong Recommendation" "Uses wording such as 'shall' / 'shall not' (original: 'soll' / 'soll nicht')."
  * ^designation[+].language = #de
  * ^designation[=].value = "Starke Empfehlung"

* #B "Recommendation" "Uses wording such as 'should' / 'should not' (original: 'sollte' / 'sollte nicht')."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlung"

* #0 "Open Recommendation" "Uses wording such as 'may be considered' / 'may be omitted' (original: 'kann erwogen werden' / 'kann verzichtet werden')."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlung offen"
