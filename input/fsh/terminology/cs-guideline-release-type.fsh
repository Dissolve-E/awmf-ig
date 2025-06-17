CodeSystem: GuidelineReleaseType
Id: cs-guideline-release-type
Title: "Guideline Release Type"
Description: "CodeSystem defining different guideline release types"
* insert rs-codesystem-meta

* #new-registration "New Registration" "New Registration"
  * ^designation[+].language = #de
  * ^designation[=].value = "Neuanmeldung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Neuanmeldung"

* #update "Update" "Update"
  * ^designation[+].language = #de
  * ^designation[=].value = "Aktualisierung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Aktualisierung"

* #class-upgrade "Class Upgrade" "Upgrade to a higher guideline class"
  * ^designation[+].language = #de
  * ^designation[=].value = "Klassen-Upgrade"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Klassen-Upgrade"

* #class-downgrade "Class Downgrade" "Downgrade to a lower guideline class"
  * ^designation[+].language = #de
  * ^designation[=].value = "Klassen-Downgrade"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Herabstufung in eine niedrigere Leitlinienklasse."

* #living-guideline "Living Guideline" "A guideline designated as a continuously updated living guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Living Guideline"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Leitlinie mit dem Status einer Living Guideline (kontinuierlich aktualisiert)."
  