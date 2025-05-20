CodeSystem: RoB2OverallJudment
Id: cs-rob-2-overall-judgment
Title: "RoB2 Overall Judgment"
Description: "CodeSystem representing the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials."
* insert rs-codesystem-meta
* ^content = #complete

* #low_risk_of_bias "Low risk of bias" "The study is judged to be at low risk of bias for all domains for this result."
  * ^designation[+].language = #de
  * ^designation[=].value = "Geringes Risiko für Bias"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Das Biasrisiko der Studie wurde in Bezug auf das Ergebnis in allen Domänen als niedrig eingeschätzt."

* #some_concerns "Some concerns" "The study is judged to raise some concerns in at least one domain for this result, but not to be at high risk of bias for any domain."
  * ^designation[+].language = #de
  * ^designation[=].value = "Einige Bedenken"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Studie wurde hinsichtlich des Biasrisikos in Bezug auf das Ergebnis in mindestens einer Domäne als „mit einigen Bedenken“ behaftet eingeschätzt, das Biasrisiko wurde jedoch in keiner Domäne als „hoch“ eingeschätzt."

* #high_risk_of_bias "High risk of bias" """The study is judged to be at high risk of bias in at least one domain for this result.
                     Or 
                     The study is judged to have some concerns for multiple domains in a way that substantially lowers confidence in the result."""
  * ^designation[+].language = #de
  * ^designation[=].value = "Hohes Risiko für Bias"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = """Das Biasrisiko der Studie wurde in Bezug auf das Ergebnis in mindestens einer Domäne als hoch eingeschätzt; 
                                                                             oder 
                                                                             Die Studie wurde hinsichtlich des Biasrisikos in Bezug auf das Ergebnis in mehreren Domänen als „mit einigen Bedenken“ behaftet eingeschätzt, in einer Weise, die das Vertrauen in das Ergebnis substantiell verringert."""
