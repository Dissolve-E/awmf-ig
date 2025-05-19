CodeSystem: GuidelineSections
Id: cs-guideline-sections
Title: "Guideline Sections"
Description: "Sections of a guideline, describing various aspects such as its intention, target patient group, care setting, and other relevant contextual information."
* insert rs-codesystem-meta
// TODO: add german translations
* #intention "Intention" "The section describes the intention of the guideline."

// Patientenzielgruppe
* #target-patient-group "Target Patient Group" "The section describes the target patient group of the guideline."

// Versorgungsbereich
* #care-setting "Care Setting" "The section describes the care setting of the guideline."

// Gründe für die Themenwahl
* #topic-selection-reason "Topic Selection Reason" "The section describes the reason for selecting the topic of the guideline."

// Adressaten
* #target-audience "Target Audience" "The section describes the target audience of the guideline."

// versorgungssektor, versorgungsabschnitt, versorgungsebene
* #encounter-type "Encounter Type" "The section describes the encounter type of the guideline."
* #care-stage "Care Stage" "The section describes the care stage of the guideline."
* #care-level "Care Level" "The section describes the care level of the guideline."

* #keywords "Keywords" "The section describes the keywords of the guideline."

* #language "Language" "The language of the content"
* #default-section "Default section" "The default slice for a section" // this is just a work-around because the FHIR validator is not able to handle @default slices currently (25-03-06)

* #attachments "Attachments"

* #consensus-protocol "Consensus Protocol" "The section describes the consensus protocol of the guideline."

// TODO: add german translations
* #long-version "Long Version" // required for all, "Langversion"
* #short-version "Short Version" // optional, "Kurzversion"
* #guideline-report "Guideline Report" // required for all guideline classes from 2026-03
* #evidence-report "Evidence Report" // required for S3, S2e
* #implementation-guidance "Implementation Guidance" // Implementierungshilfe
* #decision-support "Decision Support" // Entscheidungshilfe
* #patient-version "Patient Version" // Patientenversion
* #choosing-wisely "Choosing Wisely" // Gemeinsam Klug Entscheiden
* #quality-indicators "Quality Indicators" // Qualitätsindikatoren
* #declaration-of-interests "Declaration of Interests" // optional, Interessenserklärung
* #short-patient-version "Short Version for Patients"
* #update-info "Short Information About an Update" // "What's new"
* #slide-deck	"Slide Deck"
* #visual-abstract "Visual Abstract"
* #document "Document"
* #image "Image"
* #video "Video"
* #podcast "Podcast"
* #other "Other"
