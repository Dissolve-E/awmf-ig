Instance: DiffuseLargeBCellLymphomaGuideline
InstanceOf: AWMFGuideline
Usage: #example
Title: "S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten"
Description: "S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom (DLBCL) und verwandten Entitäten"

* identifier[awmf-register-number][+]
  * value = "018-038"
  * use = #official

* insert narrative([[S3-Leitlinie Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten]])

* date = "2022-10-01"

* title = "Diagnostik, Therapie und Nachsorge für erwachsene Patient*innen mit einem diffusen großzelligen B-Zell-Lymphom und verwandten Entitäten"
* version = "1.0"
* status = #final

// AWMF member organizations
* author[+] = Reference(DGHO)

* section[text][+] // 5. Diagnostik II – Staging und andere prätherapeutische Maßnahmen
  * section[language][+]
    * extension[language].valueCode = #de
    * title = "5. Diagnostik II – Staging und andere prätherapeutische Maßnahmen"
    * insert narrative([[5. Diagnostik II – Staging und andere prätherapeutische Maßnahmen]])

  * section[text][+] // 5.2. Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "5.2. Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
      * insert narrative([[Knochenmarkbiopsie]])

    * section[text][+] // 5.2.2. Knochenmarkbiopsie
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "5.2.2. Knochenmarkbiopsie"
        * emptyReason = $cs-list-empty-reason#unavailable
        * insert narrative([[]])

      * section[text][+] // 5.2.2.1. Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie
        * section[language][+]
          * extension[language].valueCode = #de
          * title = "5.2.2.1. Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie"
          * emptyReason = $cs-list-empty-reason#unavailable
          * insert narrative([[]])

        * section[text]
          * entry[+] = Reference(RecommendationAgainstBoneMarrowBiopsy) // Empfehlung 5.13
