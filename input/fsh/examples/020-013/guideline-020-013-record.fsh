Instance: NosokomialePneumonieRecord
InstanceOf: AWMFGuidelineRegistryRecord
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
* author[=].extension[role][+].valueCodeableConcept = cs-guideline-author-role#leading
* author[=].extension[role][+].valueCodeableConcept = cs-guideline-author-role#registrant
* author[+] = Reference(DGAI)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGI)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGHM)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(PEG)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DRG)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(GFV)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGCH)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGIM)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DGIIN)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(DSG)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing

// other organizations
* author[+] = Reference(CPAnet)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing
* author[+] = Reference(RKI)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#contributing

// person authors
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* author[=].extension[role].valueCodeableConcept = cs-guideline-author-role#content-author

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

* extension[extendedContactDetail][mainContact].valueExtendedContactDetail
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
* extension[extendedContactDetail][coordinator][+].valueExtendedContactDetail
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
