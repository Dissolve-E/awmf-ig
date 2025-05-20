CodeSystem: ROBISRiskOfBiasDomains
Id: cs-robis-risk-of-bias-domains
Title: "ROBIS Risk of Bias Domains"
Description: "A CodeSystem representing the domains assessed by the ROBIS tool for evaluating risk of bias in systematic reviews."
* insert rs-codesystem-meta
* ^content = #complete

* #study_eligibility_criteria "Study Eligibility Criteria" "Concerns regarding the specification of study eligibility criteria."
* #identification_selection_studies "Identification and Selection of Studies" "Concerns regarding methods used to identify and/or select studies."
* #data_collection_study_appraisal "Data Collection and Study Appraisal" "Concerns regarding methods used to collect data and appraise studies."
* #synthesis_findings "Synthesis and Findings" "Concerns regarding the synthesis and findings of the review."

ValueSet: ROBISRiskOfBiasDomainsVS
Id: vs-robis-risk-of-bias-domains
Title: "ROBIS Risk of Bias Domains Value Set"
Description: "A ValueSet encompassing all risk of bias domains from the ROBIS tool."
* ^status = #active
* include codes from system cs-robis-risk-of-bias-domains
