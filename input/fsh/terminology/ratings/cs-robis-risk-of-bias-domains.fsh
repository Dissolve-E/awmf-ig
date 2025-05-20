CodeSystem: ROBISRiskOfBiasDomains
Id: cs-robis-risk-of-bias-domains
Title: "ROBIS Risk of Bias Domains"
Description: "CodeSystem representing the domains assessed by the ROBIS tool for evaluating risk of bias in systematic reviews."
* insert rs-codesystem-meta
* ^content = #complete

* #study_eligibility_criteria "Study Eligibility Criteria" "Concerns regarding the specification of study eligibility criteria."
  * ^designation[+].language = #de
  * ^designation[=].value = "Studienauswahlkriterien"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bedenken im Hinblick auf die Einschlusskriterien"
* #identification_selection_studies "Identification and Selection of Studies" "Concerns regarding methods used to identify and/or select studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Identifizierung und Auswahl der Studien"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bedenken im Hinblick auf die Identifikation und Auswahl der Studien"
* #data_collection_study_appraisal "Data Collection and Study Appraisal" "Concerns regarding methods used to collect data and appraise studies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Datenextraktion und kritische Bewertung der Studien"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bedenken im Hinblick auf die Datenextraktion und Bewertung der Studien"
* #synthesis_findings "Synthesis and Findings" "Concerns regarding the synthesis and findings of the review."
  * ^designation[+].language = #de
  * ^designation[=].value = "Synthese und Ergebnisse"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bedenken im Hinblick auf die Datensynthese und Ergebnisse"
