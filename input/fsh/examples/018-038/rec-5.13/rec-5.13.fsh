Instance: RecommendationAgainstBoneMarrowBiopsy
InstanceOf: Recommendation
Usage: #example
Title: "Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie"
Description: "Empfehlung 5.13: Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie beim PET/CT-gestützten Staging des DLBCL."

* insert narrative([[Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie]])

* version = "2022"
* status = #final
* date = "2022-10-01"
* title = "Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie"

* identifier[+]
  * system = "http://fhir.awmf.org/examples"
  * value = "RecommendationAgainstBoneMarrowBiopsy"
  * use = #official

* category[synthesisType] = cs-recommendation-synthesis-type#evidence-based "Evidence-based"

* relatesTo[partOf]
  * targetCanonical = Canonical(DiffuseLargeBCellLymphomaGuideline|2022)

* author[+] = Reference(DGHO)
// section 5.2 person authors
* author[+] = Reference(UlrichDuehrsenDGIMFor018-038)
* author[+] = Reference(DirkHellwigDGNFor018-038)
* author[+] = Reference(ThorstenPersigehlDRGFor018-038)
* author[+] = Reference(LaleUmutluDRGFor018-038)

* section[recommendationStatement]
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[<div>\n<p>Bei Einsatz der PET/CT zur Stadieneinteilung soll bei kurativem Konzept in folgenden Situationen auf eine Knochenmarkbiopsie verzichtet werden:</p>\n<ul>\n<li>Nachweis einer Knochenmarkbeteiligung durch die PET/CT</li>\n<li>Fortgeschrittenes Ausbreitungsstadium (Ann Arbor-Stadium III oder IV; <a data-linktype=\"chapter\" data-val=\"763b0e9defa448049388e36f66688bff\">s. 5.2.3.1</a>)</li>\n<li>Limitiertes Ausbreitungsstadium (Ann Arbor-Stadium I oder II) mit \u201abulky disease\u2018 (<a data-linktype=\"chapter\" data-val=\"d422b7e3b4614c4a88005ac19b211f30\">s. 5.3.2.1.</a>) und/oder \u2265\u00a01 ung\u00fcnstigem Faktor des altersadjustierten \u201aInternationalen Prognostischen Index\u2018 (IPI) (s. <a data-linktype=\"chapter\" data-val=\"05dd8ffc0bca4aeeb13b0ce5b24896c0\">5.3.1.2</a>).</li>\n</ul>\n</div>]])
