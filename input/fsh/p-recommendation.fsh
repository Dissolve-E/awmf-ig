Profile: Recommendation
Parent: ebm-recommendation
Id: Recommendation
Title: "Recommendation"
Description: "Clinical Practice Guideline Recommendation"
* identifier ^slicing.discriminator.type = #value
  * identifier ^slicing.discriminator.path = "type"
  * identifier ^slicing.rules = #open
* identifier contains 
  awmf-register-number 0..1
* identifier[awmf-register-number]
  * system 1..1
  * system = "https://www.awmf.org/fhir/"
  * value 1..1
* identifier obeys inv-require-official-identifier // P2.2.1


* version 1..1 // P2.2.1
* version obeys inv-version-major-minor // P2.2.1
* extension[versionAlgorithm].valueCoding = $cs-awmf#major-minor "Major-Minor Versioning" // TODO: is there an existing code for this?

* section
  * orderedBy = cs-awmf#ordered-by-authors "Ordered by authors"
* section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code.coding"
  * section ^slicing.rules = #open
  * section contains 
    introduction 0..1 MS 
    and longVersion 0..1 MS
  * section[introduction].code.coding 1..1
  * section[introduction].code.coding = https://fevir.net/resources/CodeSystem/179423#introduction "Introduction"  

Invariant: inv-require-official-identifier // TODO: Test this invariant
Description: "Every Recommendation must have exactly one official identifier (with use = #official)"
Expression: "$this.where(use='official').count() = 1"
Severity: #error

Invariant: inv-version-major-minor // TODO: Test this invariant
Description: "Version must be a major-minor version (e.g. 5.1)"
Expression: "$this.matches('\\d+\\.\\d+')"
Severity: #warning




Instance: Recommendation-PlanDefinition-example
InstanceOf: PlanDefinition
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

* identifier[+]
  * system = "https//my.org"
  * value = "my guideline, version/2.1"

* identifier[+]
  * system = "https//my.org/guideline"
  * value = "my guideline"
* identifier[+]
  * system = "https//my.org/guidelineVersion"
  * value = "2.1"

* identifier[+]
  * system = "https//my.org/guideline"
  * value = "my guideline"
  * extension[version].valueString = "2.1"



Instance: Recommendation-Composition-example
InstanceOf: Composition
// P2.1.8
// Preceeding Recommendations (in clinical workflow)
* relatesTo[specificationOfPreceedingRecommendation][+]
  * code = #specification-of
  * label = "preceeding-recommendation"
  * resourceReference = Reference(RecommendationPreceeding-Composition-example)
* relatesTo[specificationOfPreceedingRecommendation][+]
  * code = #specification-of
  * label = "preceeding-recommendation"
  * resourceReference = Reference(RecommendationPreceedingOther-Composition-example)
// Succeeding Recommendations (in clinical workflow)
* relatesTo[specificationOfsucceedingRecommendation][+]
  * code = #specification-of
  * label = "succeeding-recommendation"
  * resourceReference = Reference(RecommendationSucceeding-Composition-example)
* relatesTo[specificationOfSucceedingRecommendation][+]
  * code = #specification-of
  * label = "succeeding-recommendation"
  * resourceReference = Reference(RecommendationSucceedingOther-Composition-example)

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

* section[recommendationSpecification] // slice defined in EBM IG Profile
  // TODO: how to add other languages?
  * entry = Reference(RecommendationPlanDefinition)




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
