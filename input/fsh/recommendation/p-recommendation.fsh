Profile: Recommendation // #P2.2.5 -- each recommendation is a separate resource
Parent: $ebm-recommendation // #P2.1.2
Id: recommendation
Title: "Recommendation"
Description: "Clinical Practice Guideline Recommendation"
* identifier obeys inv-require-official-identifier // #P2.2.2

* version 1..1 // #P2.2.6, #P2.2.7
* version obeys inv-version-major-minor // #P2.2.1
* extension[versionAlgorithm].valueCoding = $cs-awmf#major-minor "Major-Minor Versioning" // TODO: is there an existing code for this?

// #P2.1.8
* relatesTo contains 
  specificationOfPreceedingRecommendation 0..*
  and specificationOfSucceedingRecommendation 0..*
* relatesTo[specificationOfPreceedingRecommendation]
  * type 1..1
  * type = #predecessor
  * resourceReference 1..1
  * resourceReference only Reference(Recommendation)
* relatesTo[specificationOfSucceedingRecommendation]
  * type 1..1
  * type = #successor
  * resourceReference 1..1
  * resourceReference only Reference(Recommendation)

* relatesTo[partOf] 1..* // each recommendation must be part of at least one guideline

* category 0..*
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "coding"
  * ^slicing.rules = #open
* category contains recommendationType 0..1
* category[recommendationType]
  * coding from vs-recommendation-type (required) 
    * system 1.. MS
    * code 1.. MS
// TODO: implement terminology; vs-recommendation-type = #expert-consensus, #evidence-based


// doesn't work :(
// // unset valueset binding from second level
// * section.section.code ^binding.valueSet = "http://hl7.org/fhir/ValueSet/doc-section-codesX"
// * section.section.code ^binding.strength = #example

// add some more codes for the sections (not only the ones defined by the EBM IG)
* section.code from vs-guideline-sections (extensible)

* section[recommendationSpecification] // note: this is a slice defined in the EBM IG Profile and has a cardinality of 1..1 !!
  * section[recommendationStatement]
    * insert rs-language-section

// close the slicing for section and add @default section
* section ^slicing.rules = #closed
* section contains 
  text 0..* MS
  and @default 0..* 
* section[@default]
// fixme: actually, the default slice must not fix the discriminator, but as of 25-03-06 the validator is not able to handle default slices. therefore, we fix the discriminator here.
  * code 1..1
  * code.coding 1..1
  * code.coding = cs-guideline-sections#default-section
  * insert rs-language-section-nested
* section[text]
  * code 1..1
  * code = $cs-ebm-ig-section-code#text "Text"
  * code.coding 1..1
  * code.coding = $cs-ebm-ig-section-code#text "Text"
  * insert rs-language-section

// lines below are just used to force sushi to add the correct code when refering to the slices
* section[summary].code 1..1
* section[summary].code = $cs-ebm-ig-section-code#summary "Summary"
* section[introduction].code 1..1
* section[introduction].code = $cs-ebm-ig-section-code#introduction "Introduction"
* section[discussion].code 1..1
* section[discussion].code = $cs-ebm-ig-section-code#discussion "Discussion"
* section[methods].code 1..1
* section[methods].code = $cs-ebm-ig-section-code#methods "Methods"
* section[references].code 1..1
* section[references].code = $cs-ebm-ig-section-code#references "References"
* section[competingInterests].code 1..1
* section[competingInterests].code = $cs-ebm-ig-section-code#competing-interests "Competing Interests"
* section[acknowledgements].code 1..1
* section[acknowledgements].code = $cs-ebm-ig-section-code#acknowledgements "Acknowledgements"
* section[appendices].code 1..1
* section[appendices].code = $cs-ebm-ig-section-code#appendices "Appendices"
* section[recommendationSpecification].code 1..1
* section[recommendationSpecification].code = $cs-ebm-ig-section-code#recommendation-specification "Recommendation Specification"
* section[recommendationSpecification]
  * section[recommendationStatement].code 1..1
  * section[recommendationStatement].code = $cs-ebm-ig-section-code#recommendation-statement "Recommendation Statement"
  * section[ratings].code 1..1
  * section[ratings].code = $cs-ebm-ig-section-code#ratings "Ratings"
  * section[population].code 1..1
  * section[population].code = $cs-ebm-ig-section-code#population "Population"
  * section[action].code 1..1
  * section[action].code = $cs-ebm-ig-section-code#action "Action"
  * section[oppositeAction].code 1..1
  * section[oppositeAction].code = $cs-ebm-ig-section-code#opposite-action "Opposite Action"
* section[evidence].code 1..1
* section[evidence].code = $cs-ebm-ig-section-code#evidence "Evidence"
* section[justification].code 1..1
* section[justification].code = $cs-ebm-ig-section-code#justification "Justification"
* section[considerations].code 1..1
* section[considerations].code = $cs-ebm-ig-section-code#considerations "Considerations"


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
* section[@default][+]
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[Example Recommendation]])
* section[recommendationSpecification]
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

/*
Instance: Recommendation-Composition-example
InstanceOf: Recommendation
// #P2.1.8
// Preceeding Recommendations (in clinical workflow)
* version = "1.0"
* status = #final
* date = "2024-12-05"
* author = Reference(Practitioner-example)
* title = "Recommendation 1"
* relatesTo[specificationOfPreceedingRecommendation][+]
  * type = #specification-of
  * label = "preceeding-recommendation"
  * resourceReference = Reference(RecommendationPreceeding-Composition-example)
* relatesTo[specificationOfPreceedingRecommendation][+]
  * type = #specification-of
  * label = "preceeding-recommendation"
  * resourceReference = Reference(RecommendationPreceedingOther-Composition-example)
// Succeeding Recommendations (in clinical workflow)
* relatesTo[specificationOfSucceedingRecommendation][+]
  * type = #specification-of
  * label = "succeeding-recommendation"
  * resourceReference = Reference(RecommendationSucceeding-Composition-example)
* relatesTo[specificationOfSucceedingRecommendation][+]
  * type = #specification-of
  * label = "succeeding-recommendation"
  * resourceReference = Reference(RecommendationSucceedingOther-Composition-example)
*/

/* EBM IG structure -> we won't use this because of the unsolvable todos below, instead we directly use a PlanDefinition instance
* section[recommendationSpecification] // slice defined in EBM IG Profile
  // TODO: how to add other languages?
  * section[recommendationStatement] // slice defined in EBM IG Profile
    // recommendation text (human readable from guideline) goes here
    * text = "Bei Patienten mit Krankheit A soll Medikament B statt Medikament C gegeben werden. Patienten mit Krankheit A, die auch noch Krankheit D haben,
     darf keinesfalls Medikament B gegeben, sondern müssen Medikament C erhalten."
  * section[population] // Problem: population has cardinality 0..1, but the recommendationStatement has multiple populations
    // TODO: how to specify multiple (sub-)populations?
    // TODO: how to represent codes instead of text?
    // may also contain just "tags"/keywords (e.g. a collection of SNOMED CT codes)
    * text = "Patienten mit Krankheit A mit oder ohne Krankheit D" // Patienten mit Krankheit A unter Berücksichtigung von Krankheit D
    // but multiple entries (0..*) are possible
  * section[action]
    * text = "Medikament B geben oder Medikament C geben"
  * section[oppositeAction]
    * text = "Medikament C geben oder Medikament B geben"
  * section[computableRecommendationSpecification] // instead of sections population / action
    * entry = Reference(RecommendationPlanDefinition)
*/

// * section[recommendationSpecification] // slice defined in EBM IG Profile
//   // TODO: how to add other languages?
//   * entry = Reference(RecommendationPlanDefinition)



/*


Guideline
---------
- section[Therapie]
  - section[Antimikrobielle Therapie]
    - section[Antibakterielle Substanzen]
      - section[introduction]
      - section[recommendations]
      - section[introduction]     // NICHT MÖGLICH wegen cardinality 0..1
      - section[recommendations]  // NICHT MÖGLICH wegen cardinality 0..1
  - 



- section[recommendations]
  - section[therapy]
    - section[antimicrobialTherapy]
      - entry 0..*
      

Recommendation
--------------
- rationale
- PICO 0..*
  - population
  - intervention
  - comparison
  - outcome
- recommendation statement
  - fachpublikum
    - video
    - bild
  - patienten
    - video
    - bild
- level of evidence -> pro outcome
- strength of recommendation
- level of consensus
- annotation


Guideline Profile
- section[generic-chapter]
- section[introduction]
  - section[kapitel1]
    - section[kapitel1.1]
    - kapitel[kapitel1.2]
- section[awmf-spezifisch]
- section[generic-chapter] // kapitel diagnostic
  // - KEINE RECOMMENDATIONS MÖGLICH
- section[methods]
- section[recommendations]           // 7
  - section[introduction]           // 7.1
  - section[therapy]                 // 7.2
    - section[antimicrobialTherapy] // 7.2.1.
      - section[introduction]       // Allgemeine Einleitung für antimikrobielle Therapie (mehrere Empfehlungen)
        - text = ...
      - entry[0] = Reference(Recommendation12) // können empfehungs-spezifische Einleitungen (etc.) enthalten
      - entry[1] = Reference(Recommendation13) // können empfehungs-spezifische Einleitungen (etc.) enthalten
      - section[irgendeine-komische-untersektion]
        - entry[0] = Reference(Recommendation14)
    - section[...]
     ... 
- section[...]
- section[recommendations] // geht nicht wegen cardinality 0..1

1. Generisches Kapitel
2. Einleitung
3. AWMF-spezifisches Kapitel
4. Generisches Kapitel
5. Methodik      
6. ...
7. Empfehlungen
7.1 Einleitung
  intro
7.2 Therapie
7.2.1 Antimikrobielle Therapie
  einleitung
  - empfehlung 1
  - empfehlung 2


*/

/*
# Therapie

## Antimikrobielle Therapie
Das ist meine Einleitung zur antimikrobiellen Therapie
{{%include recommmendation[0] %}}
*/
