CodeSystem: SIGNGradeOfRecommendation
Id: cs-sign-grade-of-recommendation
Title: "SIGN Grade of Recommendation"
Description: "CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Grades of Recommendation."
* insert rs-codesystem-meta
* ^content = #complete

* #A "Grade A" "At least one meta-analysis, systematic review, or RCT rated as 1++, and directly applicable to the target population; or a body of evidence consisting principally of studies rated as 1+, directly applicable to the target population, and demonstrating overall consistency of results."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlungsgrad A"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Mindestens eine Metaanalyse, systematische Review oder RCT mit 1++ bewertet und direkt auf die Zielpopulation anwendbar; oder ein Evidenzkörper bestehend hauptsächlich aus Studien mit 1+ bewertet, direkt auf die Zielpopulation anwendbar und mit konsistenten Ergebnissen."

* #B "Grade B" "A body of evidence including studies rated as 2++, directly applicable to the target population, and demonstrating overall consistency of results; or extrapolated evidence from studies rated as 1++ or 1+."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlungsgrad B"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Evidenzkörper mit Studien bewertet als 2++, direkt auf die Zielpopulation anwendbar und mit konsistenten Ergebnissen; oder extrapolierte Evidenz aus Studien bewertet als 1++ oder 1+."

* #C "Grade C" "A body of evidence including studies rated as 2+, directly applicable to the target population and demonstrating overall consistency of results; or extrapolated evidence from studies rated as 2++."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlungsgrad C"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Evidenzkörper mit Studien bewertet als 2+, direkt auf die Zielpopulation anwendbar und mit konsistenten Ergebnissen; oder extrapolierte Evidenz aus Studien bewertet als 2++."

* #D "Grade D" "Evidence level 3 or 4; or extrapolated evidence from studies rated as 2+; or consensus-based recommendation."
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlungsgrad D"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Evidenzlevel 3 oder 4; oder extrapolierte Evidenz aus Studien bewertet als 2+; oder konsensbasierte Empfehlung."
