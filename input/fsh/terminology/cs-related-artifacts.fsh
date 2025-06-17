CodeSystem: RelatedArtifactTypes
Id: cs-related-artifact-types
Title: "Related Artifact Types"
Description: "CodeSystem defining types of related artifacts that can be part of a guideline."
* insert rs-codesystem-meta
* ^hierarchyMeaning = #is-a
* #related-guideline "Related Guideline"
  * ^designation[+].language = #de
  * ^designation[=].value = "Verwandte Leitlinie"
* #app "Mobile App"
  * ^designation[+].language = #de
  * ^designation[=].value = "Mobile App"
* #update-registration "Registration of an Update of the Guideline"
  * ^designation[+].language = #de
  * ^designation[=].value = "Anmeldung eines Leitlinien-Updates"
* #scientific-publication "Scientific Publication"
  * ^designation[+].language = #de
  * ^designation[=].value = "Wissenschaftliche Veröffentlichung"
* #dissemination-website "Dissemination Website" "A website that disseminates the guideline in a human readable format."
  * ^designation[+].language = #de
  * ^designation[=].value = "Webseite zur Verbreitung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Eine Website, die die Leitlinie in einem für Menschen lesbaren Format verbreitet."
  * #awmf-detail-page "Detail Page on AWMF Website"
  * ^designation[+].language = #de
  * ^designation[=].value = "Detailseite auf der AWMF Webseite"
  * #medical-society-page "Page of the Medical Society"
  * ^designation[+].language = #de
  * ^designation[=].value = "Seite der Medizinischen Fachgesellschaft"
* #patient-information "Patient-Facing Information" "Supplementary material targeted at patients, derived from or related to the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Patientenorientierte Information"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Zusätzliche Materialien, die sich an Patient*innen richten und auf der Leitlinie basieren oder mit ihr in Zusammenhang stehen."
