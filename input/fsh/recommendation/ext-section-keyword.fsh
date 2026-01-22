Extension: SectionKeyword
Id: ext-section-keyword
Title: "Section Keyword"
Description: "This extension allows for the indication of keywords associated with the section"
Context: Element
* ^purpose = "The SectionKeyword extension is used to capture keywords associated with the section."
* . 0..*
* . ^short = "Keyword"
* . ^definition = "Keywords associated with the section"
* . ^comment = "Keywords associated with the section"
* value[x] 1..
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
  * coding 1.. MS
  * coding ^slicing.discriminator.type = #value
  * coding ^slicing.discriminator.path = "$this"
  * coding ^slicing.rules = #open
  * coding contains // #P2.3.2.11
      icd10-gm 0..1 MS and
      sct 0..1 MS and
      loinc 0..1 MS and
      ops 0..1 MS and
      atc 0..1 MS and 
      atcde 0..1 MS
  * coding[icd10-gm]
    * system 1..1
    * system = $icd10-gm
  * coding[sct]
    * system 1..1
    * system = $sct
  * coding[loinc]
    * system 1..1
    * system = $loinc
  * coding[ops]
    * system 1..1
    * system = $ops
  * coding[atc]
    * system 1..1
    * system = $atc
  * coding[atcde]
    * system 1..1
    * system = $atcde
