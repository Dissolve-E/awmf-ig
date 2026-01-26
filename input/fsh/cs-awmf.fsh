CodeSystem: AWMFCS
Id: cs-awmf
Title: "awmf"
Description: "CodeSystem representing different codes of interest for the Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF)"
* insert rs-codesystem-meta
* #ordered-by-authors "Ordered by authors" "The guideline is ordered by authors and SHALL be adhered to in the order specified."
  * ^designation[+].language = #de
  * ^designation[=].value = "Durch Autor*innen geordnet"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Leitlinie wurde von den Autor*innen geordnet und MUSS in der angegebenen Reihenfolge befolgt werden."
* #major-minor "Major-Minor Versioning" "A versioning scheme using major and minor version numbers (e.g., 1.0, 2.1)."
  * ^designation[+].language = #de
  * ^designation[=].value = "Major-Minor Versionierungsschema"
* #year-month-versioning "Year-Month Versioning" "A versioning scheme based on year and month (e.g., 2024/06)."
  * ^designation[+].language = #de
  * ^designation[=].value = "Jahr-Monat Versionierungsschema"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Versionierungsschema im Format Jahr-Monat (z.B. 2024/06)"
* #medical-society "Medical Society" "A medical society."
  * ^designation[+].language = #de
  * ^designation[=].value = "Medizinische Fachgesellschaft"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Eine medizinische Fachgesellschaft."
* #awmf-member-organization "AWMF Member Organization" "An organization that is a member of the AWMF"
  * ^designation[+].language = #de
  * ^designation[=].value = "Mitgliedsorganisation der AWMF"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Eine Organisation oder Fachgesellschaft, die Mitglied der AWMF ist."
* #recommendation-rating "Recommendation Rating" "The rating of a recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Empfehlungsgraduierung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Graduierung der Empfehlung"
* #level-of-consensus "Level of Consensus" "The level of consensus for a recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsensusstärke"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Stärke des Konsens einer Empfehlung"
* #guideline-registry-record "Guideline Registry Record" "A registry record for a clinical practice guideline in the AWMF guideline registry"
  * ^designation[+].language = #de
  * ^designation[=].value = "Leitlinien-Registrierungseintrag"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Ein Registrierungseintrag für eine klinische Praxisleitlinie im AWMF-Leitlinienregister"
* #patient-organization "Patient Organization" "An organization that represents patients"
  * ^designation[+].language = #de
  * ^designation[=].value = "Patientenorganisation"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Eine Organisation, die Patienten vertritt."
* #OCEBM2009 "Oxford 2009 (OCEBM)" //TODO: ask Brian to include this code in $cs-evidence-rating-system
* #outcome "Outcome" "An outcome used in the evidence assessment of a recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Ergebnis"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Ein Ergebnis, das in der Evidenzbewertung einer Empfehlung verwendet wird."
* #overall-quality-of-evidence "Overall Quality of Evidence" "The overall quality of evidence for a recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Gesamtqualität der Evidenz"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Gesamtqualität der Evidenz für eine Empfehlung."
* #evidence-rating "Evidence Rating" "The evidence rating for a recommendation"
  * ^designation[+].language = #de
  * ^designation[=].value = "Evidenzbewertung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Die Evidenzbewertung für eine Empfehlung." 
