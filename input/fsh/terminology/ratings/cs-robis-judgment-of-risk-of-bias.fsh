CodeSystem: ROBISJudgmentOfRiskOfBias
Id: cs-robis-judgment-of-risk-of-bias
Title: "ROBIS Judgment of Risk of Bias"
Description: "A CodeSystem representing the judgment of risk of bias assessed by the ROBIS tool for evaluating risk of bias in systematic reviews."
* ^status = #active
* ^content = #complete

* #low_risk_of_bias "Low risk of bias" "The findings of the review are likely to be reliable. Phase 2 did not raise any concerns with the review process or concerns were appropriately considered in the review conclusions. The conclusions were supported by the evidence and included consideration of the relevance of included studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Geringes Risiko für Bias"
* #high_risk_of_bias "High risk of bias" "One or more of the concerns raised during the Phase 2 assessment was not addressed in the review conclusions, the review conclusions were not supported by the evidence, or the conclusions did not consider the relevance of the included studies to the review question."
  * ^designation[+].language = #de
  * ^designation[=].value = "Hohes Risiko für Bias"
* #unclear_risk_of_bias "Unclear risk of bias" "There is insufficient information reported to make a judgement on risk of bias."
  * ^designation[+].language = #de
  * ^designation[=].value = "Unklares Risiko für Bias"