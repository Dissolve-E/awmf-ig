///Inst Tab to initiate the Metadata
Instance: GuidelineColorectalCarcinoma
InstanceOf: awmf-guideline-s3
Usage: #example
Title: "S3-Leitlinie Kolorektales Karzinom"
Description: "S3-Leitlinie Kolorektales Karzinom"
* insert narrative([[S3-Leitlinie Kolorektales Karzinom]])
* version = "2.0"
* status = #deprecated
* date = "2017-11-30"
* identifier[+]
  * system = "https://example.org/identifiers"
  * value = "021 - 007OL"
  * use = #official
* author[+] = Reference(PetraLynenJansenFor021-007OL) // The PractitionerRole refers to the Practitioner
* author[=].extension[ext-guideline-author-role].valueCodeableConcept = cs-guideline-author-role#registrant
//alternatively use the extension of extendedContactDetail
//* extension[extContactDetail][registrant].valueExtendedContactDetail
//  * purpose = cs-contact-point#registrant
//  * purpose 1..1
//  * name 1..1
//  * telecom 1..*
//    * value 1..1
//  * address 0..1
* extension[plannedCompletionDate].valueDate = "2025-12-31"
* section[summary]
  * section[targetAudience]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Diese Leitlinie richtet sich vorrangig an Ärztinnen und Ärzte, die in der Prävention und Behandlung des KRK im ambulanten und stationären Sektor tätig sind. Darüber hinaus soll sie Kooperationspartner der Ärzteschaft (Fachbereiche im Gesundheitswesen), Berufsverbänden, Patienten- und Selbsthilfeorganisationen, Qualitätssicherungseinrichtungen und -projekte auf Bundes- und Länderebene (z.B. KoQK, ADT, IQWiG, GEKID, IQTIG), gesundheitspolitische Einrichtungen und Entscheidungsträger auf Bundes- und Länderebene, Zertifizierungseinrichtungen (z.B. OnkoZert), Kostenträger, sowie die (Fach-) Öffentlichkeit zur Information über gute medizinische Vorgehensweise dienen.</div>"
  * section[keywords]
    * section[language]
      * extension[language].valueCode = #de
      * text
        * status = #additional
        * div =  "<div xmlns=\"http://www.w3.org/1999/xhtml\">Krebs, Karzinom, karzinomatös, Tumor, Diagnostik, Therapie, Epidemiologie, Klassifizierung, S3-Leitlinie, Definition, Malignom, Onkologie, Leitlinie, Leitlinienprogramm Onkologie, Deutsche Krebsgesellschaft, DKG, Qualitätsindikator, Kolorektales Karzinom</div>"
    * section[language][+]
      * extension[language].valueCode = #en
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">cancer, carcinoma, cancerous, carcinomatous, tumor, diagnosis, therapy, epidemiology, classification, S3-guideline, definition, malignancy, oncology, guideline, German Guideline Programm in Oncology, GGPO, German Cancer Society, quality indicator, colorectal carcinoma</div>"
      * extension[ext-section-keyword][+].valueCoding[sct][+] = $sct#363346000 "Malignant neoplastic disease (disorder)"

Instance: PetraLynenJansen
InstanceOf: GuidelineAuthor
Usage: #example
Title: "Petra Lynen Jansen"
Description: "Petra Lynen Jansen"
* name
  * prefix = "PD Dr. med."
  * given[+] = "Petra"
  * given[+] = "Lynen"
  * family = "Jansen"
* address 
  * line[+] = "Olivaer Platz 7, 10707 Berlin"
  * postalCode = "10707"
  * city = "Berlin"
  * use = #work


Instance: PetraLynenJansenFor021-007OL
InstanceOf: GuidelineAuthorRole
Usage: #example
Title: "Petra Lynen Jansen in the context of 021-007OL"
Description: "Petra Lynen Jansen in the context of 021-007OL"
* practitioner = Reference(PetraLynenJansen)
* period // the period was not indicated properly in the registry
  * start = "2022-10-14"
  * end = "2025-12-31"
* code.text = "Registration"