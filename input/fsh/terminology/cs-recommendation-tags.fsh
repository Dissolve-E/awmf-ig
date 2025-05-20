CodeSystem: RecommendationTagsCS
Id: cs-recommendation-tags
Title: "Recommendation Tags"
Description: "CodeSystem defining codes to represent tags for recommendations"
* insert rs-codesystem-meta
* #quality-indicators-derivable "Derivable as Quality Indicator" "This recommendation can be operationalized into a measurable quality indicator"
  * ^designation[+].language = #de
  * ^designation[=].value = "Als Qualitätsindikator ableitbar"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung kann in einem messbaren Qualitätsindikator operationalisiert werden."
// #P2.3.2.32
* #highly-care-relevant "Highly Relevant for Care Delivery" "This recommendation is considered particularly relevant for clinical care"
  * ^designation[+].language = #de
  * ^designation[=].value = "Hochrelevant für die Gesundheitsversorgung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung wird als besonders relevant für die klinische Versorgung angesehen."
* #student-relevant "Relevant for Medical Education" "This recommendation is considered relevant for students in medical or healthcare education"
  * ^designation[+].language = #de
  * ^designation[=].value = "Relevant für die medizinische Ausbildung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung wird als relevant für Studierende der Medizin oder weiterer Fächer im Gesundheitswesen angesehen."
* #choosing-wisely "Choosing Wisely Recommendation" "This recommendation is part of a 'Choosing Wisely' campaign or follows similar principles"
  * ^designation[+].language = #de
  * ^designation[=].value = "Gemeinsam Klug Entscheiden-Empfehlungen"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung ist Teil der Gemeinsam Klug Entscheiden-Initiative oder folgt ähnlichen Prinzipien."
* #off-label "Off-Label Use" "This recommendation involves off-label use of a medication or device" // #P2.3.2.40
  * ^designation[+].language = #de
  * ^designation[=].value = "Off-Label-Anwendung"
  * ^definition.extension[$ext-translation].extension[lang].valueCode = #de
  * ^definition.extension[$ext-translation].extension[content].valueString = "Diese Empfehlung beinhaltet die Off-Label-Anwendung eines Arzneitmittels oder Geräts."