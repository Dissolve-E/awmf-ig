CodeSystem: GuidelineSections
Id: cs-guideline-sections
Title: "Guideline Sections"
Description: "Sections of a guideline, describing various aspects such as its intention, target patient group, care setting, and other relevant contextual information."
* insert rs-codesystem-meta
// TODO: add german translations
* #intention "Intention" "The section describes the intention of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Zielorientierung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt die Zielorientierung der Leitlinie."
// Patientenzielgruppe
* #target-patient-group "Target Patient Group" "The section describes the target patient group of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Patientenzielgruppe"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt die Patientenzielgruppe der Leitlinie."
// Versorgungsbereich
* #care-setting "Care Setting" "The section describes the care setting of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Versorgungsbereich"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt den Versorgungsbereich dieser Leitlinie."
// Gründe für die Themenwahl
* #topic-selection-reason "Topic Selection Reason" "The section describes the reason for selecting the topic of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Gründe für die Themenwahl"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt die Gründe für die Themenwahl der Leitlinie."
// Adressaten
* #target-audience "Target Audience" "The section describes the target audience of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Adressaten"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt die Adressaten der Leitlinie."
// versorgungssektor, versorgungsabschnitt, versorgungsebene
* #encounter-type "Encounter Type" "The section describes the encounter type of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Versorgungssektor" //Versorgungsbereich?
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt den oder die Versorgungssektor(en) auf die sich die Leitlinie bezieht."
* #care-stage "Care Stage" "The section describes the care stage of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Versorgungsbereich"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt den Versorgungsbereich dieser Leitlinie."
* #care-level "Care Level" "The section describes the care level of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Versorgungsebene"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt die Versorgungsebene(n) auf die sich die Leitlinie bezieht."

* #keywords "Keywords" "The section describes the keywords of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Schlüsselwörter"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt die Schlüsselwörter der Leitlinie."
* #language "Language" "The language of the content"
  * ^designation[+].language = #de
  * ^designation[=].value = "Sprache"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Sprache des Inhalts"
* #default-section "Default section" "The default slice for a section" // this is just a work-around because the FHIR validator is not able to handle @default slices currently (25-03-06)
  * ^designation[+].language = #de
  * ^designation[=].value = "Standardabschnitt"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Default ('standard') slice für einen Abschnitt."
* #attachments "Attachments"
  * ^designation[+].language = #de
  * ^designation[=].value = "Anhänge"
* #consensus-protocol "Consensus Protocol" "The section describes the consensus protocol of the guideline."
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsensprotokoll"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Dieser Abschnitt beschreibt den Konsensprotokoll einer Leitlinie."
* #long-version "Long Version" // required for all, "Langversion"
  * ^designation[+].language = #de
  * ^designation[=].value = "Langfassung"
* #short-version "Short Version" // optional, "Kurzversion"
  * ^designation[+].language = #de
  * ^designation[=].value = "Kurzfassung"
* #guideline-report "Guideline Report" // required for all guideline classes from 2026-03
  * ^designation[+].language = #de
  * ^designation[=].value = "Leitlinienreport"
* #evidence-report "Evidence Report" // required for S3, S2e
  * ^designation[+].language = #de
  * ^designation[=].value = "Evidenzbericht"
* #implementation-guidance "Implementation Guidance" // Implementierungshilfe
  * ^designation[+].language = #de
  * ^designation[=].value = "Implementierungshilfe"
* #decision-support "Decision Support" // Entscheidungshilfe
  * ^designation[+].language = #de
  * ^designation[=].value = "Entscheidungshilfe"
* #patient-version "Patient Version" // Patientenversion
  * ^designation[+].language = #de
  * ^designation[=].value = "Patientenleitlinie"
* #choosing-wisely "Choosing Wisely" // Gemeinsam Klug Entscheiden
  * ^designation[+].language = #de
  * ^designation[=].value = "Gemeinsam Klug Entscheiden"
* #quality-indicators "Quality Indicators" // Qualitätsindikatoren
  * ^designation[+].language = #de
  * ^designation[=].value = "Qualitätsindikatoren"
* #declaration-of-interests "Declaration of Interests" // optional, Interessenserklärung
  * ^designation[+].language = #de
  * ^designation[=].value = "Interessenserklärung"
* #short-patient-version "Short Version for Patients"
  * ^designation[+].language = #de
  * ^designation[=].value = "Kurzfassung für Patient*innen"
* #update-info "Short Information About an Update" // "What's new"
  * ^designation[+].language = #de
  * ^designation[=].value = "Kurzinformationen zu einer Aktualisierung"
* #slide-deck "Slide Deck"
  * ^designation[+].language = #de
  * ^designation[=].value = "Foliensatz"
* #visual-abstract "Visual Abstract"
  * ^designation[+].language = #de
  * ^designation[=].value = "Graphischer Abstrakt"
* #document "Document"
  * ^designation[+].language = #de
  * ^designation[=].value = "Dokument"
* #image "Image"
  * ^designation[+].language = #de
  * ^designation[=].value = "Bild"
* #video "Video"
  * ^designation[+].language = #de
  * ^designation[=].value = "Video"
* #podcast "Podcast"
  * ^designation[+].language = #de
  * ^designation[=].value = "Podcast"
* #other "Other"
  * ^designation[+].language = #de
  * ^designation[=].value = "Sonstiges"