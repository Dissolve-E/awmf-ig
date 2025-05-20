CodeSystem: AWMFGuidelineClass
Id: cs-awmf-guideline-class
Title: "AWMF Guideline Class"
Description: "CodeSystem representing the guideline classes according to the AWMF."
* insert rs-codesystem-meta
* ^status = #active
* ^publisher = "Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF) e.V"
* ^description = "As part of the project planning for the creation or updating of a guideline,
    a decision should be made at an early stage about the planned level classification (\"S classification\") according to the AWMF's system of rules (1-3).
    The S-classification scheme of the AWMF differentiates between the classes S1 treatment recommendation as well as S2e, S2k and S3 guideline.
    The \"S\" stands for the extent of the applied systematic approach in the development process of a guideline.
    Each class thus stands for a specific methodological concept that must be presented in a way that is comprehensible to the users.
    The choice of class is based on the question of how much effort is appropriate and feasible.
    The need for legitimacy for the implementation of the guideline (convincing the target group) must be taken into account.
    When choosing a higher S-classification in the context of updating a guideline, the adaptation to the corresponding methodology has to be considered."
* ^content = #complete
* #S3 "Evidence- and consensus-based guideline" "Representative panel, Systematic search, selection, evaluation of literature, Structured consensus building."
  * ^designation[+].language = #de
  * ^designation[=].value = "Evidenz- und Konsensusbasierte Leitlinie"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Repräsentatives Gremium, Systematische Recherche, Auswahl, Bewertung der Literatur, Strukturierte Konsensfindung"
* #S2e "Evidence-based Guideline" "Systematic search, selection, evaluation of literature"
  * ^designation[+].language = #de
  * ^designation[=].value = "Evidenzbasierte Leitlinie"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Systematische Recherche, Auswahl, Bewertung der Literatur"
* #S2k "Consensus-based Guideline" "Representative body, structured consensus building"
  * ^designation[+].language = #de
  * ^designation[=].value = "Konsensusbasierte Leitlinie"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Repräsentatives Gremium, Strukturierte Konsensfindung"
* #S1 "Action recommendations from expert groups" "Consensus building in an informal process"
  * ^designation[+].language = #de
  * ^designation[=].value = "Handlungsempfehlungen von Expertengruppen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Konsensfindung in einem informellen Verfahren"