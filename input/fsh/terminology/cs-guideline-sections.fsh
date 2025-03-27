CodeSystem: GuidelineSections
Id: cs-guideline-sections
Title: "Guideline Sections"
Description: "Sections of a guideline, describing various aspects such as its intention, target patient group, care setting, and other relevant contextual information."
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
