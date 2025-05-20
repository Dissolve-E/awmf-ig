CodeSystem: AGREEIIDomains
Id: cs-agree-ii-domains
Title: "AGREE II Domains"
Description: "CodeSystem representing the domains assessed by the AGREE II instrument for evaluating the quality of clinical practice guidelines."
* ^status = #active
* ^content = #complete

* #scope_and_purpose "Scope and Purpose" "Concerns the overall aim of the guideline, the specific health questions, and the target population."
  * ^designation[+].language = #de
  * ^designation[=].value = "Geltungsbereich und Zweck"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bezieht sich auf das Gesamtziel einer Leitlinie, die in der Leitlinie behandelten gesundheitsrelevanten Fragen und die Zielpopulation der Leitlinie."
* #stakeholder_involvement "Stakeholder Involvement" "Focuses on the extent to which the guideline was developed by the appropriate stakeholders and represents the views of its intended users."
  * ^designation[+].language = #de
  * ^designation[=].value = "Beteiligung von Interessengruppen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Fragt, inwieweit alle relevanten Berufsgruppen an der Erstellung der Leitlinie beteiligt waren und diese die Ansichten der Anwenderzielgruppe repräsentieren."
* #rigour_of_development "Rigour of Development" "Relates to the process used to gather and synthesize the evidence, the methods to formulate the recommendations, and to update them."
  * ^designation[+].language = #de
  * ^designation[=].value = "Genauigkeit der Leitlinienentwicklung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bezieht sich auf das Verfahren, mit dem die Evidenz gesucht und zusammengefasst wurde, sowie auf die Methoden zur Formulierung und zur Aktualisierung der Empfehlungen"
* #clarity_of_presentation "Clarity of Presentation" "Deals with the language, structure, and format of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Klarheit der Gestaltung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Befasst sich mit der Sprache, der Struktur und dem Format der Leitlinie"
* #applicability "Applicability" "Pertains to the likely barriers and facilitators to implementation, strategies to improve uptake, and resource implications of applying the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Anwendbarkeit"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Betrifft mögliche förderliche und hinderliche Faktoren für die Anwendung der Leitlinie, Strategien zur Förderung der Leitlinienanwendung und Auswirkungen der Anwendung der Leitlinie auf den Ressourcenverbrauch "
* #editorial_independence "Editorial Independence" "Is concerned with the formulation of recommendations not being unduly biased with competing interests."
  * ^designation[+].language = #de
  * ^designation[=].value = "Redaktionelle Unabhängigkeit"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Befasst sich mit dem Einfluss möglicher Interessenkonflikte auf die Formulierung der Empfehlungen."