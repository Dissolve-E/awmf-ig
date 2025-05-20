Profile: CertaintyOfEvidenceRatingGRADE
Parent: CertaintyOfEvidenceRating
Id: certainty-of-evidence-rating-grade
Title: "Evidence Assessment GRADE"
Description: "A structured assessment of the certainty of evidence for a specific outcome, including GRADE rating."

* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains 
  riskOfBias 0..1
  and inconsistency 0..1
  and indirectness 0..1
  and imprecision 0..1
  and publicationBias 0..1
  and doseResponseGradient 0..1
  and plausibleConfounding 0..1
  and largeEffect 0..1

* content[ratingSystem] 1..1
  * type 1..1
  * type = $cs-ebm-ig#rating-system "Rating System"
  * classifier 1..1
  * classifier = cs-evidence-rating-system#GRADE

* content[levelOfEvidence]
  * type 1..1
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 1..1
  * classifier from $vs-rating-certainty-of-evidence (required)
* content[riskOfBias]
  * type 1..1
  * type = $cs-certainty-type#RiskOfBias "Risk of bias"
* content[inconsistency]
  * type 1..1
  * type = $cs-certainty-type#Inconsistency "Inconsistency"
* content[indirectness]
  * type 1..1
  * type = $cs-certainty-type#Indirectness "Indirectness"
* content[imprecision]
  * type 1..1
  * type = $cs-certainty-type#Imprecision "Imprecision"
* content[publicationBias]
  * type 1..1
  * type = $cs-certainty-type#PublicationBias "Publication bias"
* content[doseResponseGradient]
  * type 1..1
  * type = $cs-certainty-type#DoseResponseGradient "Dose response gradient"
* content[plausibleConfounding]
  * type 1..1
  * type = $cs-certainty-type#PlausibleConfounding "Plausible confounding"
* content[largeEffect]
  * type 1..1
  * type = $cs-certainty-type#LargeEffect "Large effect"
