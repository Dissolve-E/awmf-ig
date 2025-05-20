CodeSystem: RemarkType
Id: cs-remark-type
Title: "Remark Type"
Description: "CodeSystem defining different types of remarks that can be associated with guidelines, including restrictions, warnings, and additional notes."
* #block "Block" "A restriction or prohibition that prevents certain actions or decisions in accordance with guidelines."
  * ^designation[+].language = #de
  * ^designation[=].value = "Block"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Einschränkung oder Untersagung, die bestimmte Handlungen oder Entscheidungen in Übereinstimmung mit Leitlinien verhindert."
* #warning "Warning" "A cautionary note indicating potential risks or issues that need to be considered."
  * ^designation[+].language = #de
  * ^designation[=].value = "Warnung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Ein Warnhinweis, der auf mögliche Risiken oder Probleme hinweist, die beachtet werden müssen."
* #note "Note" "An informative remark or additional context provided for clarification."  // #P2.3.1.1
  * ^designation[+].language = #de
  * ^designation[=].value = "Hinweis"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Eine informative Bemerkung oder zusätzliche Kontextinformationen, die der Klärung dient/dienen."
* #revision-note "Revision Note" "Guideline is currently being revised." // #P2.3.1.6
  * ^designation[+].language = #de
  * ^designation[=].value = "Überarbeitungshinweis"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Leitlinie wird derzeit überarbeitet."