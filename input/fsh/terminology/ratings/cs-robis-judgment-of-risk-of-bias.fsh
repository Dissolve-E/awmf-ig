CodeSystem: ROBISJudgmentOfRiskOfBias
Id: cs-robis-judgment-of-risk-of-bias
Title: "ROBIS Judgment of Risk of Bias"
Description: "CodeSystem representing the judgment of risk of bias assessed by the ROBIS tool for evaluating risk of bias in systematic reviews."
* insert rs-codesystem-meta
* ^content = #complete

* #low_risk_of_bias "Low risk of bias" "The findings of the review are likely to be reliable. Phase 2 did not raise any concerns with the review process or concerns were appropriately considered in the review conclusions. The conclusions were supported by the evidence and included consideration of the relevance of included studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Geringes Risiko für Bias"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Ergebnisse des Reviews sind wahrscheinlich zuverlässig. In Phase 2 der Bewertung wurden keine Bedenken bezüglich des Reviewprozesses identifiziert oder die identifizierten Bedenken wurden in den Schlussfolgerungen des Reviews angemessen berücksichtigt. Die Schlussfolgerungen werden durch die Evidenz gestützt und beinhalten die Berücksichtigung der Relevanz der eingeschlossenen Studien für die Fragestellung des Reviews."

* #high_risk_of_bias "High risk of bias" "One or more of the concerns raised during the Phase 2 assessment was not addressed in the review conclusions, the review conclusions were not supported by the evidence, or the conclusions did not consider the relevance of the included studies to the review question."
  * ^designation[+].language = #de
  * ^designation[=].value = "Hohes Risiko für Bias"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bedenken, die in Phase 2 der Bewertung identifiziert wurden, sind in den Schlussfolgerungen des Reviews nicht berücksichtigt oder die Schlussfolgerungen werden durch die Evidenz nicht gestützt oder in den Schlussfolgerungen ist die Relevanz der eingeschlossenen Studien für die Fragestellung des Reviews nicht berücksichtigt."

* #unclear_risk_of_bias "Unclear risk of bias" "There is insufficient information reported to make a judgement on risk of bias."
  * ^designation[+].language = #de
  * ^designation[=].value = "Unklares Risiko für Bias"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die verfügbaren Informationen sind unzureichend für ein Urteil über das Biasrisiko."