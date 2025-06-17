CodeSystem: GuidelineAuthorRoleCS // #P2.3.1.4
Id: cs-guideline-author-role
Title: "Guideline Author Role"
Description: "CodeSystem defining roles for the author of the guideline."
* insert rs-codesystem-meta
// Federführend (Organisation oder Person)
* #leading "Leading" "Main party responsible for the development of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Federführend"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Federführende Organisation oder Person für die Leitlinie."
* #contributing "Contributing" "Party involved in the development of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Beteiligt"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Organisation oder Person, die an der Leitlinie mitgewirkt hat."
* #registrant "Registrant" "Person responsible for registering the guideline in the registry."
  * ^designation[+].language = #de
  * ^designation[=].value = "Anmelder*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Person, die das Leitlinienprojekt im Register angemeldet hat."
* #technical-editor "Technical Editor" "Responsible for preparing the technical or machine-readable format of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Technische Redaktion"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Verantwortlich für die technische oder maschinenlesbare Formatierung der Leitlinie."
* #content-author "Content Author" "Authored or co-authored the content of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Inhaltliche*r Autor*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Autor*in der Inhalte der Leitlinie."
* #coding-author "Coding Author" "Responsible for semantic encoding of guideline content using terminologies or ontologies."
  * ^designation[+].language = #de
  * ^designation[=].value = "Kodierer*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Verantwortlich für die semantische Kodierung der Leitlinie mittels Terminologien oder Ontologien."
* #moderator "Moderator" "Person moderating consensus-building sessions in guideline development."
  * ^designation[+].language = #de
  * ^designation[=].value = "Moderator*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Moderiert den Konsensprozess während der Leitlinienentwicklung."
* #method-advisor "Methodological Advisor" "Supports the development team with methodological expertise."
  * ^designation[+].language = #de
  * ^designation[=].value = "Methodische*r Berater*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Bietet methodische Beratung zur Leitlinienentwicklung."
* #evidence-analyst "Evidence Analyst" "Conducts or oversees evidence synthesis and appraisal."
  * ^designation[+].language = #de
  * ^designation[=].value = "Evidenzaufbereitung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Verantwortlich für die Recherche, Bewertung und Aufbereitung der Evidenz."
