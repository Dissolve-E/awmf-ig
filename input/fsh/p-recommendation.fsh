Profile: Recommendation
Parent: ebm-recommendation
Id: Recommendation
Title: "Recommendation"
Description: "Clinical Practice Guideline Recommendation"
* section
  * orderedBy = cs-awmf#ordered-by-authors "Ordered by authors"
* section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code.coding"
  * section ^slicing.rules = #open
  * section contains 
    introduction 0..1 MS 
		and longVersion 
  * section[introduction].code.coding 1..1
  * section[introduction].code.coding = https://fevir.net/resources/CodeSystem/179423#introduction "Introduction"  

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




/*


Guideline
---------
- section[Therapie]
  - section[Antimikrobielle Therapie]
	  - section[Antibakterielle Substanzen]
		  - section[introduction]
			- section[recommendations]
			- section[introduction]  	 // NICHT MÖGLICH wegen cardinality 0..1
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
- section[recommendations] 					// 7
	- section[introduction] 					// 7.1
  - section[therapy] 								// 7.2
	  - section[antimicrobialTherapy] // 7.2.1.
		  - section[introduction] 			// Allgemeine Einleitung für antimikrobielle Therapie (mehrere Empfehlungen)
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
