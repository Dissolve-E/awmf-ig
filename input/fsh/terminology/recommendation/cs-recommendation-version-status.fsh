CodeSystem: RecommendationVersionStatusCS // #P2.3.2.29
Id: cs-recommendation-version-status
Title: "Recommendation Version Status Code System"
Description: "CodeSystem defining values indicating how a recommendation relates to a new version of the guideline"
* insert rs-codesystem-meta
* ^content = #complete
* #added "Added" "Recommendation was newly added in this version of the guideline"
  * ^designation[+].language = #de
  * ^designation[=].value = "Hinzugefügt"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung ist in dieser Version der Leitlinie neu dazugekommen."
* #updated "Updated" "Recommendation was modified or updated"
  * ^designation[+].language = #de
  * ^designation[=].value = "Aktualisiert"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung wurde geändert oder aktualisiert."
* #reaffirmed "Reaffirmed" "Recommendation was reviewed and explicitly confirmed to still be valid"
  * ^designation[+].language = #de
  * ^designation[=].value = "Bestätigt."
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung wurde geprüft und ihre Gültigkeit explizit bestätigt."