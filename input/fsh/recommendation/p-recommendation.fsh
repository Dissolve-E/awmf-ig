// bug: the IG publisher doesn't build this correctly. there seems to be (again) a problem with inheriting from the EBM IG
//      and re-slicing or redefining the already defined slices
Profile: Recommendation // #P2.2.5 -- each recommendation is a separate resource
Parent: $ebm-recommendation // #P2.1.2
Id: recommendation
Title: "Recommendation"
Description: "Clinical Practice Guideline Recommendation"
* obeys inv-require-official-identifier // #P2.2.2

* version 1..1 // #P2.2.6, #P2.2.7 //TO DO @Gregor: Write invariant to match the versioning schema "YYYY.MM" + check if the already existing inv-version-major-minor is still relevant.
* version obeys inv-version-major-minor // #P2.2.1
* extension[versionAlgorithm].valueCoding = cs-awmf#major-minor "Major-Minor Versioning"

* extension contains 
    ext-recommendation-version-status named versionStatus 0..1 // #P2.3.2.29

* meta.tag from vs-recommendation-tags (preferred)

// #P2.1.8
* relatesTo contains 
  specificationOfPreceedingRecommendation 0..*
  and specificationOfSucceedingRecommendation 0..*
  and replacesRecommendation 0..* // #P2.3.2.30, #P2.3.2.31
* relatesTo[specificationOfPreceedingRecommendation]
  * type 1..1
  * type = #predecessor
  * targetReference 1..1
  * targetReference only Reference(Recommendation)
* relatesTo[specificationOfSucceedingRecommendation]
  * type 1..1
  * type = #successor
  * targetReference 1..1
  * targetReference only Reference(Recommendation)
* relatesTo[replacesRecommendation]
  * type 1..1
  * type = #replaces
  * targetReference 1..1
  * targetReference only Reference(Recommendation)


* relatesTo[partOf] 1..* // each recommendation must be part of at least one guideline

* category 0..*
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "coding"
  * ^slicing.rules = #open
* category contains 
    synthesisType 1..1
    and clinicalApplicationType 0..*
* category[synthesisType]
  * coding from vs-recommendation-synthesis-type (required) 
    * system 1.. MS
    * code 1.. MS
* category[clinicalApplicationType] // #P2.3.2.15
  * coding from vs-clinical-application-type (required)
    * system 1.. MS
    * code 1.. MS

* section.extension contains 
  ext-section-intended-audience named intendedAudience 0..*

// add some more codes for the sections (not only the ones defined by the EBM IG)
* section.code from vs-guideline-sections (extensible)

* section[recommendationStatement]
  * insert rs-language-section

// close the slicing for section and add text section
* section ^slicing.rules = #closed
* section contains 
  text 0..* MS
  and consensusProtocol 0..*
  and patientVersion 0..*
  and otherContent 0..*
  and outcome 0..1
  //and text 0..* 
/** section[text] // TODO: we'll use [text] as default slice for now, until SUSHI and the FHIR validator supports default slices properly
// fixme: actually, the default slice must not fix the discriminator, but as of 25-03-06 the validator is not able to handle default slices. therefore, we fix the discriminator here.
  * code 1..1
  * code.coding 1..1
  * code.coding = cs-guideline-sections#default-section
  * insert rs-language-section-nested*/

* section[text]
  * code 1..1
  * code.coding 1..1
  * code = $cs-ebm-ig#text "Text"
  * code.coding = $cs-ebm-ig#text "Text"
  * insert rs-language-section
* section[consensusProtocol]
  * code 1..1
  * code.coding 1..1
  * code = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * code.coding = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * insert rs-language-section-nested
* section[patientVersion]
  * code 1..1
  * code.coding 1..1
  * code = cs-guideline-sections#patient-version "Patient Version"
  * code.coding = cs-guideline-sections#patient-version "Patient Version"
* section[otherContent]
  * code 1..1
  * code.coding  1..1
  * code from vs-content-types (required) // todo: restrict to reasonable elements (e.g. long version is not applicable for recommendation, only for guideline)
  * code.coding from vs-content-types (required)
  * insert rs-language-section-nested


// lines below are just used to force sushi to add the correct code when refering to the slices
* section[summary]
  * code 1..1
  * code = $cs-ebm-ig#summary "Summary"
* section[introduction]
  * code 1..1
  * code = $cs-ebm-ig#introduction "Introduction"
* section[discussion]
  * code 1..1
  * code = $cs-ebm-ig#discussion "Discussion"
* section[methods]
  * code 1..1
  * code = $cs-ebm-ig#methods "Methods"
* section[references]
  * code 1..1
  * code = $cs-ebm-ig#references "References"
* section[competingInterests]
  * code 1..1
  * code = $cs-ebm-ig#competing-interests "Competing Interests"
* section[acknowledgements]
  * code 1..1
  * code = $cs-ebm-ig#acknowledgements "Acknowledgements"
* section[appendices]
  * code 1..1
  * code = $cs-ebm-ig#appendices "Appendices"
* section[evidence]
  * code 1..1
  * code = $cs-ebm-ig#evidence "Evidence"
* section[justification]
  * code 1..1
  * code = $cs-ebm-ig#justification "Justification"
* section[considerations]
  * code 1..1
  * code = $cs-ebm-ig#considerations "Considerations"


* section[recommendationStatement]
  * code 1..1
  * code = $cs-ebm-ig#recommendation-statement "Recommendation Statement"
  * code.coding = $cs-ebm-ig#recommendation-statement "Recommendation Statement"

* section[population] // #P2.3.2.1
  * code 1..1
  * code = $cs-ebm-ig#population "Population"
  * code.coding = $cs-ebm-ig#population "Population"
  * insert rs-language-section
  * section[language]
    * extension contains ext-section-keyword named keyword 0..* // #P2.3.2.8
    * entry only Reference(EvidenceVariable or Group)  // #P2.3.2.9 // actually, EvidenceVariable is only for R5 while group is for R6    

* section[action] // #P2.3.2.1
  * code 1..1
  * code = $cs-ebm-ig#action "Action"
  * insert rs-language-section
  * section[language]
    * extension contains ext-section-keyword named keyword 0..*
    * entry only Reference(PlanDefinition) // #P2.3.2.6, #P2.3.2.9

// used to specify actions that are unpreferred in comparison to the intervention(=action), e.g. 
// in a comparison of two drugs, the intervention is the preferred drug and the comparator is the unpreferred drug
// ("in case X, drug A should be preferred over drug B")
* section[oppositeAction] // #P2.3.2.1
  * code 1..1
  * code = $cs-ebm-ig#opposite-action "Opposite Action"
  * insert rs-language-section
  * section[language]
    * extension contains ext-section-keyword named keyword 0..*
    * entry only Reference(PlanDefinition) // #P2.3.2.9

// used to specify clinical outcomes that are relevant for the recommendation (e.g. mortality, morbidity, quality of life, ...)
* section[outcome] // #P2.3.2.1
  * code 1..1
  * code = $cs-ebm-ig#outcome "Outcome"
  // * code.coding 1..1
  // * code.coding = $cs-ebm-ig#outcome "Outcome"
  * insert rs-language-section
  * section[language]
    * extension contains ext-section-keyword named keyword 0..*
    * entry only Reference(EvidenceVariable or Group) // actually, EvidenceVariable is only for R5 while group is for R6

* section[ratings]
  * code 1..1
  * code = $cs-ebm-ig#ratings "Ratings"
  * entry only Reference(RecommendationJustification)


Instance: RecommendationExample
InstanceOf: recommendation
Usage: #example
Title: "Recommendation Example"
Description: "An example of a recommendation."
* insert narrative([[Recommendation Example]])
* version = "2.0"
* status = #final
* author[+] = Reference(GuidelineAuthorRoleExample)
* date = "2025-03-06"
* title = "Example Recommendation"
* category[synthesisType] = cs-recommendation-synthesis-type#expert-consensus
* relatesTo[partOf][+]
  * targetCanonical = Canonical(GuidelineExample)
* section[text][+]
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[Example Recommendation]])
  * extension[intendedAudience].valueCodeableConcept = cs-intended-audience#physician
* section[recommendationStatement]
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[Bei Patienten mit Krankheit A soll Medikament B statt Medikament C gegeben werden. Patienten mit Krankheit A, die auch noch Krankheit D haben, darf keinesfalls Medikament B gegeben, sondern müssen Medikament C erhalten.]])








Instance: Recommendation-PlanDefinition-example
InstanceOf: PlanDefinition
* status = #draft
* action[0]
  * title = "Recommendation 1"
  * description = "Mach Diagnose"
  * id = "diagnose"
  * relatedAction
    * targetId = "therapie"
    * relationship = #after
* action[1]
  * title = "Recommendation 2"
  * description = "Mach Therapie"
  * id = "therapie"
  * relatedAction
    * targetId = "diagnose"
    * relationship = #before
