Instance: NosokomialePneumonie
InstanceOf: AWMFGuideline
Usage: #example
Title: "S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
Description: "S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
* identifier[awmf-register-number][+]
  * value = "020-013"
  * use = #official

* insert narrative([[S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie]])

* meta
//	* tag[guideline-releaseType] = $cs-guideline-releaseType#update // just an example, this guideline has no release type

// required by profile (ebm or so) -> TODO: define use in profile
* date = "2025-02-13"

// AWMF member organizations
* author[+] = Reference(DGP)
* author[=].extension[ext-guideline-author-role][+].valueCodeableConcept = cs-guideline-author-role#leading
* author[=].extension[ext-guideline-author-role][+].valueCodeableConcept = cs-guideline-author-role#registrant
* author[+] = Reference(DGAI)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGI)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGHM)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(PEG)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DRG)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(GFV)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGCH)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGIM)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGIIN)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DSG)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing

// other organizations
* author[+] = Reference(CPAnet)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(RKI)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#contributing

// person authors
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#content-author

* relatesTo[+]
  * type = #similar-to
  * extension[classifier][+].valueCodeableConcept = cs-related-artifact-types#related-guideline
  * extension[label].valueString = "Behandlung von erwachsenen Patienten mit ambulant erworbener Pneumonie"
  // * targetReference = Reference(Guideline_020_020) // other guideline not yet defined in FHIR
  * targetUri = "https://www.awmf.org/leitlinien/detail/ll/020-020.html"
* relatesTo[+]
  * type = #similar-to
  * extension[classifier][+].valueCodeableConcept = cs-related-artifact-types#related-guideline
  * extension[label].valueString = "Diagnostik und Therapie von erwachsenen Patienten mit Husten"
  // * targetReference = Reference(Guideline_020_003) // other guideline not yet defined in FHIR
  * targetUri = "https://www.awmf.org/leitlinien/detail/ll/020-003.html"
* relatesTo[+]
  * type = #similar-to
  * extension[classifier][+].valueCodeableConcept = cs-related-artifact-types#related-guideline
  * extension[label].valueString = "Prolongiertes Weaning"
  // * targetReference = Reference(Guideline_020_015) // other guideline not yet defined in FHIR
  * targetUri = "https://www.awmf.org/leitlinien/detail/ll/020-015.html"
* relatesTo[+]
  * type = #similar-to
  * extension[classifier][+].valueCodeableConcept = cs-related-artifact-types#related-guideline
  * extension[label].valueString = "Management der ambulant erworbenen Pneumonie bei Kindern und Jugendlichen (pCAP)"
  // * targetReference = Reference(Guideline_048_013) // other guideline not yet defined in FHIR
  * targetUri = "https://www.awmf.org/leitlinien/detail/ll/048-013.html"

* relatesTo[+]
  * type = #documentation
  * extension[classifier][+].valueCodeableConcept = cs-related-artifact-types#awmf-detail-page
  * targetUri = "https://register.awmf.org/de/leitlinien/detail/020-013"

* title = "Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
* version = "3.0"
* status = #final

* category[awmfGuidelineClass] = cs-awmf-guideline-class#S3 "Evidence- and consensus-based guideline"

* extension[contact][mainContact].valueExtendedContactDetail
  * name.text = "PD Dr. med. Jessica Rademacher"
  * telecom[+]
    * system = #email
    * value = "Rademacher.Jessica@mh-hannover.de"
  * telecom[+]
    * system = #phone
    * value = "0511-532 9735"
  // * telecom[+]
  // 	* system = #url
  // 	* value = ""
  * address[+]
    * use = #work
    * line[+] = "Klinik für Pneumologie"
    * line[+] = "Medizinische Hochschule Hannover"
    * postalCode = "30625"
    * city = "Hannover"
* extension[contact][coordinator][+].valueExtendedContactDetail
  * name.text = "PD Dr. med. Jessica Rademacher"
  * telecom[+]
    * system = #email
    * value = "Rademacher.Jessica@mh-hannover.de"
  * telecom[+]
    * system = #phone
    * value = "0511-532 9735"
  // * telecom[+]
  // 	* system = #url
  // 	* value = ""
  * address[+]
    * use = #work
    * line[+] = "Klinik für Pneumologie"
    * line[+] = "Medizinische Hochschule Hannover"
    * postalCode = "30625"
    * city = "Hannover"

* note[remark]
  * extension[annotationType].valueCodeableConcept = cs-remark-type#note "Note"
  * text = "Das dieser Veröffentlichung zugrundliegende Projekt wurde mit Mitteln des Innovationsausschusses beim Gemeinsamen Bundesausschuss unter dem Förderkennzeichen gefördert: 01VSF22007"

* extension[lastReviewDate].valueDate = "2024-03-01"
* extension[publicationDate].valueDate = "2024-03-22"
* extension[firstPublicationDate].valueDate = "2012-11-16"
* extension[effectivePeriod].valuePeriod.end = "2029-02-28"

* attester[AWMF]

* section[summary]
  * section[intention]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Darstellung und Standardisierung der Diagnostik und Therapie der nosokomialen Pneumonie auf der Basis des aktuellen wissen-schaftlichen Kenntnisstandes für die Sicherstellung einer Evidenz-basierten und optimalen Versorgung von Patienten.</div>"
  * section[targetPatientGroup]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Erwachsene</div>"
  * section[careSetting]
    * section[careSetting]
      * extension[value].valueCodeableConcept = cs-care-setting#inpatient
      * section[language]
        * extension[language].valueCode = #de
        * text
          * status = #additional
          * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">stationär</div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"
    
    * section[careStage]
      * extension[value][+].valueCodeableConcept = cs-care-setting#diagnosis
      * extension[value][+].valueCodeableConcept = cs-care-setting#therapy
      * section[language]
        * extension[language].valueCode = #de
        * text
          * status = #additional
          * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Diagnostik, Therapie</div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"
    
    * section[careLevel]
      * extension[value][+].valueCodeableConcept = cs-care-setting#specialized-care
      * section[language]
        * extension[language].valueCode = #de
        * text
          * status = #additional
          * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">spezialärztliche Versorgung </div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"

  * section[topicSelectionReason]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Die nosokomiale Pneumonie ist in Deutschland eine häufige hospitalerworbene Infektion, die mit einer hohen Morbidität und Mortalität einhergeht. Diagnostik und Therapie stellen hohe Ansprüche an die behandelnden Ärzte, die häufig interdisziplinär gelöst werden müssen. Das therapeutische Vorgehen hat erheblichen Einfluss auf die Entwicklung von Antibiotikaresistenzen bei den ursächlichen Erregern. Revision der bestehenden Leitlinie wurde erforderlich, da die Empfehlungen zur Standardisierung und Qualitätssicherung der Diagnostik und Therapie bei erwachsenen Patienten mit nosokomialen Pneumonien auf den aktuellsten Forschungsergebnissen angepasst werden müssen.</div>"
  
  * section[targetPatientGroup]
    * extension[value][+].valueCodeableConcept = cs-target-patient-group#adults "Adults"
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Erwachsene</div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"
  
  * section[targetAudience]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Die Leitlinie wendet sich an alle im Krankenhaus tätigen Ärzte, die mit der Diagnostik und Therapie nosokomialer Pneumonien konfrontiert sind. Hierzu gehören Fachärzte für Anästhesiologie, Chirurgie, Innere Medizin, Intensivmedizin, Klinische Infektiologie, Klinische Mikrobiologie, Hygiene, Pneumologie, Virologie, und Radiologie, aber auch Ärzten anderer Fachgebiete, die Patienten mit nosokomialen Infektionen betreuen. Zugleich soll sie als Orientierung für Personen, Organisationen, Kostenträger sowie medizinisch-wissenschaftliche Fachgesellschaften und Berufsverbände dienen, die direkt oder indirekt mit diesem Thema in Verbindung stehen.</div>"

  * section[keywords]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div =  "<div xmlns=\"http://www.w3.org/1999/xhtml\">Pneumonie, nosokomial, hospital-acquired pneumonia, HAP, Ventilator-assoziierten Pneumonie, VAP, im Krankenhaus erworbene Lungenentzündung, Epidemiology, diagnosis and treatment of adult patients with nosocomial pneumonia</div>"

* section[attachments]
  * section[longVersion]
    * entry = Reference(Guideline-020-013-LongVersion)
  * section[shortVersion]
    * entry = Reference(Guideline-020-013-ShortVersion)
  * section[guidelineReport]
    * entry = Reference(Guideline-020-013-GuidelineReport)
  * section[patientVersion]
    * entry = Reference(Guideline-020-013-PatientVersion)
  * section[+]
    * code = cs-guideline-sections#slide-deck
    * entry = Reference(Guideline-020-013-SlideDeck)
  * section[+]
    * code = cs-guideline-sections#implementation-guidance
    * entry = Reference(Guideline-020-013-ImplementationGuidance)

* section[introduction]
  * section[@default][+] // Übersicht der Empfehlungen und Statements
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

  * section[@default][+] // Geltungsbereich und Zweck
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Geltungsbereich und Zweck"
      * insert narrative([[Geltungsbereich und Zweck]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Scope and Purpose"
      * insert narrative([[Scope and Purpose]])

    * section[@default][+] // Zielsetzung und Fragestellung
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Zielsetzung und Fragestellung"
        * insert narrative([[Zielsetzung und Fragestellung]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Objective and Research Question"
        * insert narrative([[Objective and Research Question]])

    * section[@default][+] // Versorgungsbereich
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Versorgungsbereich"
        * insert narrative([[Versorgungsbereich]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Healthcare Sector"
        * insert narrative([[Healthcare Sector]])

    * section[@default][+] // Patientenzielgruppe
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Patientenzielgruppe"
        * insert narrative([[Patientenzielgruppe]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Target Patient Group"
        * insert narrative([[Target Patient Group]])

    * section[@default][+] // Adressaten
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Adressaten"
        * insert narrative([[Adressaten]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Audience"
        * insert narrative([[Audience]])

    * section[@default][+] // Gültigkeitsdauer und Aktualisierungsverfahren
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Gültigkeitsdauer und Aktualisierungsverfahren"
        * insert narrative([[Gültigkeitsdauer und Aktualisierungsverfahren]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Validity Period and Update Procedure"
        * insert narrative([[Validity Period and Update Procedure]])

  * section[@default][+] // Methodische Grundlagen
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Methodische Grundlagen"
      * insert narrative([[Methodische Grundlagen]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Methodological Foundations"
      * insert narrative([[Methodological Foundations]])

    * section[@default][+] // Kritische Bewertung der Evidenz
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Kritische Bewertung der Evidenz"
        * insert narrative([[Kritische Bewertung der Evidenz]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Critical Appraisal of Evidence"
        * insert narrative([[Critical Appraisal of Evidence]])

    * section[@default][+] // Strukturierte Konsensfindung
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Strukturierte Konsensfindung"
        * insert narrative([[Strukturierte Konsensfindung]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Structured Consensus Process"
        * insert narrative([[Structured Consensus Process]])

    * section[@default][+] // Empfehlungsgraduierung und Feststellung der Konsensstärke
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Empfehlungsgraduierung und Feststellung der Konsensstärke"
        * insert narrative([[Empfehlungsgraduierung und Feststellung der Konsensstärke]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Recommendation Grading and Consensus Strength"
        * insert narrative([[Recommendation Grading and Consensus Strength]])

    * section[@default][+] // Statements
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Statements"
        * insert narrative([[Statements]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Statements"
        * insert narrative([[Statements]])

    * section[@default][+] // Expertenkonsens
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Expertenkonsens"
        * insert narrative([[Expertenkonsens]])
      * section[language][+]
        * extension[language].valueCode = #en
        * title = "Expert Consensus"
        * insert narrative([[Expert Consensus]])

  * section[@default][+] // Umgang mit Interessenkonflikten
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Umgang mit Interessenkonflikten"
      * insert narrative([[Umgang mit Interessenkonflikten]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Handling Conflicts of Interest"
      * insert narrative([[Handling Conflicts of Interest]])

  * section[@default][+] // Externe Begutachtung und Verabschiedung
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Externe Begutachtung und Verabschiedung"
      * insert narrative([[Externe Begutachtung und Verabschiedung]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "External Review and Approval"
      * insert narrative([[External Review and Approval]])

  * section[@default][+] // Redaktionelle Hinweise
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Redaktionelle Hinweise"
      * insert narrative([[Redaktionelle Hinweise]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Editorial Notes"
      * insert narrative([[Editorial Notes]])

  * section[@default][+] // Einführung und Epidemiologie
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Einführung und Epidemiologie"
      * insert narrative([[Einführung und Epidemiologie]])
    * section[language][+]
      * extension[language].valueCode = #en
      * title = "Introduction and Epidemiology"
      * insert narrative([[Introduction and Epidemiology]])

* section[@default][+] // 6. Diagnostik
  * section[language][+]
    * extension[language].valueCode = #de
    * title = "Diagnostik"
    * insert narrative([[Diagnostik]])

  * section[@default][+] // 6.1 Klinische Diagnose der nosokomialen Pneumonie
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Klinische Diagnose der nosokomialen Pneumonie"
      * emptyReason = $cs-list-empty-reason#unavailable
      * insert narrative([[]])

    // TODO: connect recommendations here
    //* section[recommendations]
    //  * 

  * section[@default][+] // 6.2 Biomarker
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Biomarker"
      * insert narrative([[Biomarker]])

  * section[@default][+] // 6.3 Mikrobiologische Diagnostik
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Mikrobiologische Diagnostik"
      * insert narrative([[Mikrobiologische Diagnostik]])

    * section[@default][+] // 6.3.1 Bakteriologische Diagnostik
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Bakteriologische Diagnostik"
        * insert narrative([[Bakteriologische Diagnostik]])

    * section[@default][+] // 6.3.2 Mykologische Diagnostik
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Mykologische Diagnostik"
        * insert narrative([[Mykologische Diagnostik]])

    * section[@default][+] // 6.3.3 Virologische Diagnostik
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Virologische Diagnostik"
        * insert narrative([[Virologische Diagnostik]])

    * section[@default][+] // 6.3.4 Materialgewinnung
      * section[language][+]
        * extension[language].valueCode = #de
        * title = "Materialgewinnung"
        * insert narrative([[Materialgewinnung]])

  * section[@default][+] // 6.4 Bildgebung
    * section[language][+]
      * extension[language].valueCode = #de
      * title = "Bildgebung"
      * insert narrative([[Bildgebung]])
