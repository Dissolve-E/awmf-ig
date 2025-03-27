CodeSystem: AGREEIIDomains
Id: cs-agree-ii-domains
Title: "AGREE II Domains"
Description: "A CodeSystem representing the domains assessed by the AGREE II instrument for evaluating the quality of clinical practice guidelines."
* ^status = #active
* ^content = #complete

* #scope_and_purpose "Scope and Purpose" "Concerns the overall aim of the guideline, the specific health questions, and the target population."
* #stakeholder_involvement "Stakeholder Involvement" "Focuses on the extent to which the guideline was developed by the appropriate stakeholders and represents the views of its intended users."
* #rigour_of_development "Rigour of Development" "Relates to the process used to gather and synthesize the evidence, the methods to formulate the recommendations, and to update them."
* #clarity_of_presentation "Clarity of Presentation" "Deals with the language, structure, and format of the guideline."
* #applicability "Applicability" "Pertains to the likely barriers and facilitators to implementation, strategies to improve uptake, and resource implications of applying the guideline."
* #editorial_independence "Editorial Independence" "Is concerned with the formulation of recommendations not being unduly biased with competing interests."

ValueSet: AGREEIIDomainsVS
Id: vs-agree-ii-domains
Title: "AGREE II Domains Value Set"
Description: "A ValueSet encompassing all domains from the AGREE II instrument."
* ^status = #active
* include codes from system cs-agree-ii-domains
