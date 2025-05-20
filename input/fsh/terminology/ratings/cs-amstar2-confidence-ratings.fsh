CodeSystem: AMSTAR2ConfidenceRatings
Id: cs-amstar2-confidence-ratings
Title: "AMSTAR 2 Overall Confidence Ratings"
Description: "CodeSystem representing the overall confidence ratings from the AMSTAR 2 critical appraisal tool."
* ^status = #active
* ^content = #complete

* #high "High" "Zero or one non-critical weakness: The systematic review provides an accurate and comprehensive summary of the results of the available studies that address the question of interest."
  * ^designation[+].language = #de
  * ^designation[=].value = "Hoch"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Keine oder eine nicht kritische Schwäche: Der systematische Review bietet eine verlässliche und
    umfassende Zusammenfassung der Ergebnisse der verfügbaren Studien zu der interessierenden
    Frage."
* #moderate "Moderate" "More than one non-critical weakness: The systematic review has more than one weakness but no critical flaws. It may provide an accurate summary of the results of the available studies that were included in the review."
  * ^designation[+].language = #de
  * ^designation[=].value = "Moderat"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Mehr als eine nicht kritische Schwäche*: Der systematische Review hat mehr als eine Schwäche,
    aber keine kritischen Schwächen. Möglicherweise bietet es eine akkurate Zusammenfassung der
    Ergebnisse der verfügbaren, in den Review eingeschlossenen Studien. *Mehrere nicht kritische Schwächen können das Vertrauen in den Review mindern, und es kann angemessen
    sein, das Gesamturteil von moderat auf niedrig herabzustufen."
* #low "Low" "One critical flaw with or without non-critical weaknesses: The review has a critical flaw and may not provide an accurate and comprehensive summary of the available studies that address the question of interest."
  * ^designation[+].language = #de
  * ^designation[=].value = "Niedrig"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Eine kritische Schwäche mit oder ohne nicht kritische Schwächen: Der Review hat eine kritische
    Schwäche und bietet möglicherweise keine akkurate und umfassende Zusammenfassung der
    verfügbaren Studien zu der interessierenden Frage."
* #critically_low "Critically Low" "More than one critical flaw with or without non-critical weaknesses: The review has more than one critical flaw and should not be relied on to provide an accurate and comprehensive summary of the available studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Kritisch niedrig"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Mehr als eine kritische Schwäche mit oder ohne nicht kritische Schwächen: Der Review hat mehr als
    eine kritische Schwäche. Es sollte nicht darauf vertraut werden, dass er eine akkurate und
    umfassende Zusammenfassung der verfügbaren Studien bietet."