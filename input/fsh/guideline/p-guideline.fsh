Profile: AWMFGuideline
Parent: $ebm-guideline // #P2.1.2
Id: awmf-guideline
Title: "Guideline"
Description: "Clinical Practice Guideline"

// TODO: Decide whether to make another AWMF profile that contains all AWMF-specific logic [all, after workshop]

* language 0..1 MS

* title 1..1
* title ^definition = "Title of the Guideline"
// TODO: add description of this status in HTML page of the profile [@glichtner]
* status 1..1 // used for: anmeldung, konsultationsfassung, amendment, final // #P2.2.9
* status ^definition = "Workflow status of the guideline from registration to publication or deprecation. Please note that the ValueSet 'http://hl7.org/fhir/ValueSet/composition-status' is required; We therefore created the ConceptMap 'FHIRStatusToAWMFStatus' to store the mapping to the AWMF status values."



* extension contains 
  ext-first-publication-date named firstPublicationDate 0..1 MS
  and ext-submission-date named submissionDate 0..1 MS
  and ext-consultation-period named consultationPeriod 0..1 MS
  and ext-planned-completion-date named plannedCompletionDate 0..1 MS
  and ext-registration-date named registrationDate 0..1 MS
// NOTE: We avoid re-slicing the existing 'extendedContactDetail' slice from the EBM IG here,
// as the IG Publisher currently throws a "named items are out of order in the slice" error
// when attempting to do so. 
//
// As a workaround, we redefine the 'extendedContactDetail' extension under a new slice name
// ('extContactDetail') and apply slicing there. This avoids the snapshot generation error
// and preserves the intended semantics.
//
// It's unclear whether this restriction is intended behavior or a limitation in the IG Publisher.
  //and $ext-extended-contact-detail named extContactDetail 0..* MS
* date // #P2.3.1.9
  * ^definition = "Modification date of the Composition contents. Does not represent the publication, last review or approval date."
  * ^short = "Modification Date"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open // #P2.2.1
* identifier contains awmf-register-number 0..1
* identifier[awmf-register-number]
  * system 1..1
  * system = "http://fhir.awmf.org/guidelines"
  * value 1..1
* identifier 1..*
* obeys inv-require-official-identifier // #P2.2.1, #P2.2.3

* version 1..1 // #P2.2.1, #P2.2.7
* version obeys inv-version-major-minor // #P2.2.1, #P2.2.8
* extension[versionAlgorithm].valueCoding = cs-awmf#major-minor "Major-Minor Versioning"

// add some more codes for the sections (not only the ones defined by the EBM IG)
* section.code from vs-guideline-sections (extensible)

// close the slicing for section and add text section
* section ^slicing.rules = #closed
* section contains 
  consensusProtocol 0..*
  and text 0..* 
* section[text]
  * code 1..1
  * code.coding 1..1
  * code.coding = $cs-ebm-ig#text "Text"

* section[consensusProtocol]
  * code 1..1
  * code.coding 1..1
  * code = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * code.coding = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * insert rs-language-section-nested

// Language for each section and nested sections until level 6 (#P2.3.2.21, #P2.1.9)
* section[text]
  * insert rs-language-section-nested
* section[summary]
  * insert rs-language-section-nested
* section[introduction]
  * insert rs-language-section-nested
* section[methods]
  * insert rs-language-section-nested
* section[discussion]
  * insert rs-language-section-nested
* section[references]
  * insert rs-language-section-nested
* section[competingInterests]
  * insert rs-language-section-nested
* section[acknowledgements]
  * insert rs-language-section-nested
* section[appendices]
  * insert rs-language-section-nested
* section[recommendations] 
  // TODO: disallow text here because all recommendation-related text should be in the Composition instance of the recommendation profile. [@gregor]
  // TODO: explain this in the IG [@Gregor]

// lines below are just used to force sushi to add the correct code when refering to the slices
* section[summary].code 1..1
* section[summary].code = $cs-ebm-ig#summary "Summary"
* section[introduction].code 1..1
* section[introduction].code = $cs-ebm-ig#introduction "Introduction"
* section[discussion].code 1..1
* section[discussion].code = $cs-ebm-ig#discussion "Discussion"
* section[methods].code 1..1
* section[methods].code = $cs-ebm-ig#methods "Methods"
* section[references].code 1..1
* section[references].code = $cs-ebm-ig#references "References"
* section[competingInterests].code 1..1
* section[competingInterests].code = $cs-ebm-ig#competing-interests "Competing Interests"
* section[acknowledgements].code 1..1
* section[acknowledgements].code = $cs-ebm-ig#acknowledgements "Acknowledgements"
* section[appendices].code 1..1
* section[appendices].code = $cs-ebm-ig#appendices "Appendices"



Instance: GuidelineExample
InstanceOf: awmf-guideline
Usage: #example
Title: "Guideline Example"
Description: "An example of a guideline."
* insert narrative([[Guideline Example]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "Example Guideline"
* author = Reference(GuidelineAuthorExample)
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: G-TestTestInvRequireOfficialIdentifier-NoOfficialId-SHOULD-FAIL
InstanceOf: awmf-guideline
Usage: #example
Title: "Test: No Official Identifier (Should Fail)"
Description: "Tests that inv-require-official-identifier fails when no official identifier is present."
* insert narrative([[Test: No Official Identifier]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "Example Guideline"
* author = Reference(GuidelineAuthorExample)
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #secondary


Instance: G-TestTestInvRequireOfficialIdentifier-TwoOfficialId-SHOULD-FAIL
InstanceOf: awmf-guideline
Usage: #example
Title: "Test: Two Official Identifiers (Should Fail)"
Description: "Tests that inv-require-official-identifier fails when two official identifiers are present."
* insert narrative([[Test: Two Official Identifiers]])
* version = "2.0"
* status = #final
* date = "2025-03-06"
* title = "Example Guideline"
* author = Reference(GuidelineAuthorExample)
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example2"
  * use = #official


Instance: G-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL
InstanceOf: awmf-guideline
Usage: #example
Title: "Test: Version Major.Minor.Patch (Should Fail)"
Description: "Tests that inv-version-major-minor fails when version has three parts."
* insert narrative([[Test: Version Major.Minor.Patch]])
* version = "2.0.0"
* status = #final
* date = "2025-03-06"
* title = "Example Guideline"
* author = Reference(GuidelineAuthorExample)
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: G-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL
InstanceOf: awmf-guideline
Usage: #example
Title: "Test: Version with Prefix (Should Fail)"
Description: "Tests that inv-version-major-minor fails when version has 'v' prefix."
* insert narrative([[Test: Version with Prefix]])
* version = "v2.0"
* status = #final
* date = "2025-03-06"
* title = "Example Guideline"
* author = Reference(GuidelineAuthorExample)
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official


Instance: G-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL
InstanceOf: awmf-guideline
Usage: #example
Title: "Test: Version as Text (Should Fail)"
Description: "Tests that inv-version-major-minor fails when version is text."
* insert narrative([[Test: Version as Text]])
* version = "zweiteVersion"
* status = #final
* date = "2025-03-06"
* title = "Example Guideline"
* author = Reference(GuidelineAuthorExample)
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "AWMF-Guideline-Example"
  * use = #official

