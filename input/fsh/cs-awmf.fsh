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
* #major-minor "Major-Minor Versioning"
  * ^designation[+].language = #de
  * ^designation[=].value = "Major-Minor Versionierungsschema"
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