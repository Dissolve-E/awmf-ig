Instance: NosokomialePneuomnie
InstanceOf: AWMFGuideline
Usage: #example
Title: "S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
Description: "S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
* identifier[awmf-register-number][+]
  * value = "020-013"
  * use = #official
* meta
//	* tag[guideline-releaseType] = $cs-guideline-releaseType#update // just an example, this guideline has no release type

// required by profile (ebm or so) -> TODO: define use in profile
* date = "2025-02-13"

// AWMF member organizations
* author[+] = Reference(DGP)
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#leading
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


* title = "Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie"
* version = "3.0"
* status = #final
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

* section[summary]
  * section[intention]
    * text
      * status = #additional
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Darstellung und Standardisierung der Diagnostik und Therapie der nosokomialen Pneumonie auf der Basis des aktuellen wissen-schaftlichen Kenntnisstandes für die Sicherstellung einer Evidenz-basierten und optimalen Versorgung von Patienten.</div>"
  * section[targetPatientGroup]
    * text
      * status = #additional
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Erwachsene</div>"
  * section[careSetting]
    * section[careSetting]
      * extension[value].valueCodeableConcept = cs-care-setting#inpatient
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">stationär</div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"
    
    * section[careStage]
      * extension[value][+].valueCodeableConcept = cs-care-setting#diagnosis
      * extension[value][+].valueCodeableConcept = cs-care-setting#therapy
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Diagnostik, Therapie</div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"
    
    * section[careLevel]
      * extension[value][+].valueCodeableConcept = cs-care-setting#specialized-care
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">spezialärztliche Versorgung </div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"

  * section[topicSelectionReason]
    * text
      * status = #additional
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Die nosokomiale Pneumonie ist in Deutschland eine häufige hospitalerworbene Infektion, die mit einer hohen Morbidität und Mortalität einhergeht. Diagnostik und Therapie stellen hohe Ansprüche an die behandelnden Ärzte, die häufig interdisziplinär gelöst werden müssen. Das therapeutische Vorgehen hat erheblichen Einfluss auf die Entwicklung von Antibiotikaresistenzen bei den ursächlichen Erregern. Revision der bestehenden Leitlinie wurde erforderlich, da die Empfehlungen zur Standardisierung und Qualitätssicherung der Diagnostik und Therapie bei erwachsenen Patienten mit nosokomialen Pneumonien auf den aktuellsten Forschungsergebnissen angepasst werden müssen.</div>"
  
  * section[targetPatientGroup]
    * extension[value][+].valueCodeableConcept = cs-target-patient-group#adults "Adults"
    * text
      * status = #additional
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Erwachsene</div>" // "cmp-1: 'A section must contain at least one of text, entries, or sub-sections'"
  
  * section[targetAudience]
    * text
      * status = #additional
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Die Leitlinie wendet sich an alle im Krankenhaus tätigen Ärzte, die mit der Diagnostik und Therapie nosokomialer Pneumonien konfrontiert sind. Hierzu gehören Fachärzte für Anästhesiologie, Chirurgie, Innere Medizin, Intensivmedizin, Klinische Infektiologie, Klinische Mikrobiologie, Hygiene, Pneumologie, Virologie, und Radiologie, aber auch Ärzten anderer Fachgebiete, die Patienten mit nosokomialen Infektionen betreuen. Zugleich soll sie als Orientierung für Personen, Organisationen, Kostenträger sowie medizinisch-wissenschaftliche Fachgesellschaften und Berufsverbände dienen, die direkt oder indirekt mit diesem Thema in Verbindung stehen.</div>"

  * section[keywords]
    * text
      * status = #additional
      * div =  "<div xmlns=\"http://www.w3.org/1999/xhtml\">Pneumonie, nosokomial, hospital-acquired pneumonia, HAP, Ventilator-assoziierten Pneumonie, VAP, im Krankenhaus erworbene Lungenentzündung, Epidemiology, diagnosis and treatment of adult patients with nosocomial pneumonia</div>"
