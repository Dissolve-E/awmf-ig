CodeSystem: ContactPoint
Id: cs-contact-point
Title: "Contact Point"
Description: "CodeSystem defining types of contact points for a guideline"
* insert rs-codesystem-meta
* #registrant "Registrant" "The contact is the registrant of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Anmelder*in"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Kontakt ist die anmeldende Person oder Organisation der Leitlinie."
* #contact "Contact" "The main contact for the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Kontakt"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Kontakt ist der/die Hauptansprechpartner*in für die Leitlinie."
* #coordinator "Coordinator" "The contact is the coordinator of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Koordination"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Der Kontakt ist der/die Koordinator*in der Leitlinie."