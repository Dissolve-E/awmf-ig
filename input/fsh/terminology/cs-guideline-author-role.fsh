CodeSystem: GuidelineAuthorRoleCS // #P2.3.1.4
Id: cs-guideline-author-role
Title: "Guideline Author Role"
Description: "CodeSystem defining roles for the author of the guideline."
* insert rs-codesystem-meta
* #leading "Leading Author" "The primary author of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Federführend"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der oder die federführende Autor*in oder Organisation."
* #contributing "Contributing Author" "An author who contributed to the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Beteiligt"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Ein*e Autor*in, der oder die an der Leitlinie mitgewirkt hat."
* #registrant "Registrant" "The organization that registered the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Anmelder*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Organisation, die die Leitlinie angemeldet hat."
* #technical-formatter "Technical Format Author" "The organization or person that created the technical format of the guideline." // #P2.3.1.5
  * ^designation[+].language = #de
  * ^designation[=].value = "Technische*r Redakteur*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Organisation oder Person, die das technische Format der Leitlinie erstellt hat."
* #content-author "Content Author" "The author of the content of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Author"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der oder die Autor*in der Leitlinieninhalte."
* #coding-author "Coding Author" "The author of the coding of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Kodier*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Person, die Leitlinieninhalte (bspw. mittels Terminologien und Ontologien) kodiert hat."
