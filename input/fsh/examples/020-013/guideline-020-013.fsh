Instance: NosokomialePneumonie
InstanceOf: AWMFGuideline
Usage: #example
Title: "S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
Description: "S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"

* insert narrative([[S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie]])

* identifier[awmf-register-number][+]
  * value = "020-013"
  * use = #official

// required by profile (ebm or so) -> TODO: define use in profile
* date = "2025-02-13"

* title = "Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
* version = "3.0"
* status = #final

* author[+] = Reference(JessicaRademacherDGPFor020-013)

* section[introduction]
  * section[text][+] // Übersicht der Empfehlungen und Statements
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Übersicht der Empfehlungen und Statements"
      * insert narrative([[Übersicht der Empfehlungen und Statements]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Overview of Recommendations and Statements"
      * insert narrative([[Overview of Recommendations and Statements]])
    * section[language][+]
      * extension[language].valueCode = #ar
      * title = "نظرة عامة على التوصيات والبيانات"
      * insert narrative-rtl([[نظرة عامة على التوصيات والبيانات]])  // #P2.3.2.26 (text direction)

  * section[text][+] // Geltungsbereich und Zweck
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Geltungsbereich und Zweck"
      * insert narrative([[Geltungsbereich und Zweck]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Scope and Purpose"
      * insert narrative([[Scope and Purpose]])

    * section[text][+] // Zielsetzung und Fragestellung
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Zielsetzung und Fragestellung"
        * insert narrative([[Zielsetzung und Fragestellung]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Objective and Research Question"
        * insert narrative([[Objective and Research Question]])

    * section[text][+] // Versorgungsbereich
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Versorgungsbereich"
        * insert narrative([[Versorgungsbereich]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Healthcare Sector"
        * insert narrative([[Healthcare Sector]])

    * section[text][+] // Patientenzielgruppe
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Patientenzielgruppe"
        * insert narrative([[Patientenzielgruppe]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Target Patient Group"
        * insert narrative([[Target Patient Group]])

    * section[text][+] // Adressaten
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Adressaten"
        * insert narrative([[Adressaten]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Audience"
        * insert narrative([[Audience]])

    * section[text][+] // Gültigkeitsdauer und Aktualisierungsverfahren
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Gültigkeitsdauer und Aktualisierungsverfahren"
        * insert narrative([[Gültigkeitsdauer und Aktualisierungsverfahren]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Validity Period and Update Procedure"
        * insert narrative([[Validity Period and Update Procedure]])

  * section[text][+] // Methodische Grundlagen
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Methodische Grundlagen"
      * insert narrative([[Methodische Grundlagen]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Methodological Foundations"
      * insert narrative([[Methodological Foundations]])

    * section[text][+] // Kritische Bewertung der Evidenz
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Kritische Bewertung der Evidenz"
        * insert narrative([[Kritische Bewertung der Evidenz]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Critical Appraisal of Evidence"
        * insert narrative([[Critical Appraisal of Evidence]])

    * section[text][+] // Strukturierte Konsensfindung
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Strukturierte Konsensfindung"
        * insert narrative([[Strukturierte Konsensfindung]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Structured Consensus Process"
        * insert narrative([[Structured Consensus Process]])

    * section[text][+] // Empfehlungsgraduierung und Feststellung der Konsensstärke
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Empfehlungsgraduierung und Feststellung der Konsensstärke"
        * insert narrative([[Empfehlungsgraduierung und Feststellung der Konsensstärke]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Recommendation Grading and Consensus Strength"
        * insert narrative([[Recommendation Grading and Consensus Strength]])

    * section[text][+] // Statements
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Statements"
        * insert narrative([[Statements]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Statements"
        * insert narrative([[Statements]])

    * section[text][+] // Expertenkonsens
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Expertenkonsens"
        * insert narrative([[Expertenkonsens]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Expert Consensus"
        * insert narrative([[Expert Consensus]])

  * section[text][+] // Umgang mit Interessenkonflikten
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Umgang mit Interessenkonflikten"
      * insert narrative([[Umgang mit Interessenkonflikten]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Handling Conflicts of Interest"
      * insert narrative([[Handling Conflicts of Interest]])

  * section[text][+] // Externe Begutachtung und Verabschiedung
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Externe Begutachtung und Verabschiedung"
      * insert narrative([[Externe Begutachtung und Verabschiedung]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "External Review and Approval"
      * insert narrative([[External Review and Approval]])

  * section[text][+] // Redaktionelle Hinweise
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Redaktionelle Hinweise"
      * insert narrative([[Redaktionelle Hinweise]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Editorial Notes"
      * insert narrative([[Editorial Notes]])

  * section[text][+] // Einführung und Epidemiologie
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Einführung und Epidemiologie"
      * insert narrative([[Einführung und Epidemiologie]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Introduction and Epidemiology"
      * insert narrative([[Introduction and Epidemiology]])

* section[text][+] // 6. Diagnostik
  * section[language][+]
    * extension[language].valueCode = #de
    * title = "Diagnostik"
    * insert narrative([[Diagnostik]])

  * section[text][+] // 6.1 Klinische Diagnose der nosokomialen Pneumonie
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Klinische Diagnose der nosokomialen Pneumonie"
      * emptyReason = $cs-list-empty-reason#unavailable
      * insert narrative([[]])

    * section[text]
      * entry[+] = Reference(RecommendationHAPDiagnosis) // recommendation 2

  * section[text][+] // 6.2 Biomarker
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Biomarker"
      * insert narrative([[Biomarker]])

  * section[text][+] // 6.3 Mikrobiologische Diagnostik
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Mikrobiologische Diagnostik"
      * insert narrative([[Mikrobiologische Diagnostik]])

    * section[text][+] // 6.3.1 Bakteriologische Diagnostik
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Bakteriologische Diagnostik"
        * insert narrative([[Bakteriologische Diagnostik]])

      * section[text]
        * entry[+] = Reference(RecommendationMultiplexPCRDiagnostic) // recommendation 6

    * section[text][+] // 6.3.2 Mykologische Diagnostik
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Mykologische Diagnostik"
        * insert narrative([[Mykologische Diagnostik]])

    * section[text][+] // 6.3.3 Virologische Diagnostik
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Virologische Diagnostik"
        * insert narrative([[Virologische Diagnostik]])

    * section[text][+] // 6.3.4 Materialgewinnung
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Materialgewinnung"
        * insert narrative([[Materialgewinnung]])

  * section[text][+] // 6.4 Bildgebung
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Bildgebung"
      * insert narrative([[Bildgebung]])
