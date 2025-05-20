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
* #class-upgrade "Class Upgrade" "Class Upgrade"
  * ^designation[+].language = #de
  * ^designation[=].value = "Klassen-Upgrade"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Klassen-Upgrade"