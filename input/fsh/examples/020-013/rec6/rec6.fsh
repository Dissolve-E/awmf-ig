Instance: RecommendationMultiplexPCRDiagnostic
InstanceOf: Recommendation
Usage: #example
Title: "Multiplex-PCR-Diagnostik"
Description: "Wird der Einsatz von Multiplex-PCR im Rahmen der mikrobiologischen Diagnostik bei Patienten 
mit Verdacht auf nosokomiale Pneumonie empfohlen?"

* insert narrative([[HAP Diagnose]])

* version = "3.0"
* status = #final
* author[+] = Reference(JessicaRademacherDGPFor020-013)
* date = "2024-12-05"
* title = "Multiplex-PCR-Diagnostik"

* relatesTo[partOf]
  * extension[targetCanonical].valueCanonical = Canonical(NosokomialePneumonie|3.0)

* section[recommendationSpecification]
  * section[recommendationStatement]
    * section[language]
      * extension[language].valueCode = #de
      * insert narrative([[Der regelhafte Einsatz von bakteriellen Multiplex-PCR-Systemen bei Patienten mit Verdacht 
auf eine nosokomiale Pneumonie kann nicht empfohlen werden.]])

* section[text]
  * code = $cs-ebm-ig#text "Text"
  * section[language]
    * extension[language].valueCode = #de
    * insert narrative([[Inwieweit  neue,  molekulare  Techniken,  die  einen  gleichzeitigen  Erregernachweis  und  die  Detektion  einiger  
Resistenzgene erlauben, die in sie gesetzten Erwartungen erfüllen können, bleibt abzuwarten.  Derzeit sind zwei gut untersuchte Multiplex-PCR-Systeme zum Nachweis von bakteriellen Pneumonieerregern 
(inklusive  Legionellen,  Mykoplasmen,  Chlamydien,  Pneumocystis  jirovecii)  und  einigen  Resistenzgenen  
kommerziell erhältlich (BioFire FilmArray Pneumonia (bioMerieux), Unyvero Pneumonia Pannel (Curetis)). Das Unyvero-Pannel umfasst 20 Bakterien und Pneumocystis jirovecii sowie 16 Resistenzgene, der FilmArray 18 
Bakterien und 8 Resistenzgene sowie 9 Viren.  Einige retrospektive Studien mit nur wenigen (&lt; 100) HAP-Patienten sind publiziert. In einer aktuellen Studie 
(112)  wurden  beide  Systeme  anhand  von  6523  tiefen  respiratorischen  Materialien  von  15  Krankenhäusern 
verglichen. Es konnten signifikant mehr Erregernachweise erbracht werden als durch die Kultur (Unyvero 60,4 
%, FilmArray 74,2 % vs. Kultur 44,2 %). Für typische HAP/VAP-Pathogene betrug die Sensitivität und Spezifität 
vom FilmArray 91,7 % bis 100 % und 87,5 % bis 99,5 %, für Unyvero 50 % bis 100 % und 89,4 % bis 99 %. 
Der Nachweis von Resistenzgenen scheint mit einer Fehlerquote zwischen 20 und 30 % nicht sicher zu sein 
(113).  Bislang liegen nur wenige Studien vor, die die klinischen Konsequenzen der molekularbiologischen Diagnostik 
hinsichtlich  z.B.  Antibiotikaverbrauch,  Beatmungs-/Liegedauer  und  Letalität  prospektiv  untersucht  haben.  In  
einer  monozentrischen,  prospektiven  Studie  wurde  bei  605  unselektierten  nicht-intubierten  Patienten  mit  
radiologisch  diagnostizierter  Pneumonie  die  Frage  untersucht,  ob  die  Ergebnisse  des  Curetis  unyvero  P50  
assay aus BALF einen Einfluss auf die Länge des Krankenhausaufenthaltes und auf den Einsatz von Antibiotika 
haben. 54 % der Patienten waren immunsupprimiert, die meisten davon mit Zustand nach 
Lungentransplantation.  Zwar  war  die  Nachweishäufigkeit  der  molekularbiologischen  Methode  deutlich  höher  
als die der kulturellen Analyse (82 % vs. 56 %, insbesondere H. influenzae, A. baumannii), dennoch hatten die 
molekularbiologischen Ergebnisse keinen Einfluss auf die Länge des Krankenhausaufenthaltes und die Gabe 
(Dauer  und  Anzahl)  von  Antibiotika.  Immunkompetente  Patienten  hatten  häufiger  positive  Resultate  in  der  
Molekularbiologie und Kultur als immuninkompetente. Insgesamt zeigte die molekularbiologische Methode eine 
Sensitivität von 81,3 % und eine Spezifität von 86,9 % (Referenz: Kultur) (111). Die  Daten  einer  großen  multizentrischen,  randomisierten  Studie,  die  den  Einfluss  der  Ergebnisse  des  
FilmArrays auf den klinischen Verlauf der Patienten zeigen soll, sind bislang nicht publiziert (114).  Obwohl  molekularbiologische  Befunde  innerhalb  von  wenigen  Stunden  vorliegen,  sind  Transportzeiten  zum  
Labor,  Möglichkeit  der  taggleichen  Abarbeitung  und  Analyse  der  Resultate  Faktoren,  die  dazu  führen,  dass  
nicht selten kulturelle Ergebnisse  vor molekularbiologischen Daten  auf Station  vorliegen.  Auf  Basis  von  drei  
randomisierten Studien mit nicht unerheblichen methodischen Schwächen kann der Schluss gezogen werden, 
dass  der  Einsatz  von  Multiplex-PCR-Methoden  nicht  zu  einer  Reduktion  der  Letalität  führt.  Ob  der  Einsatz  
dieser  Methoden  zu  einer  Reduktion  der  Therapiedauer  oder  der  Zeit  bis  zur  Deeskalation  führt,  lässt  sich  
derzeit nicht sagen. 
]])


Instance: RecommendationMultiplexPCRDiagnostic-Justification
InstanceOf: RecommendationJustification
Usage: #example
Title: "RecommendationMultiplexPCRDiagnostic-Justification"
Description: "Justification for Recommendation Multiplex-PCR-Diagnostik"
* insert narrative([[Justification for Recommendation Multiplex-PCR-Diagnostik]])
* artifactReference = Reference(RecommendationMultiplexPCRDiagnostic)
* content[recommendationRating]
  * component[strengthOfRecommendation]
    * classifier = cs-strength-of-recommendation#open "Open Recommendation"
    // TODO: missing "Empfehlungsgrad 0"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#against "Against"
  
  * component[levelOfConsensus]
    * classifier = cs-level-of-consensus#strong-consensus "Strong consensus"

* content[evidence][+]
  * relatedArtifact.resourceReference = Reference(CoE-MultiplexPCRDiagnostic-Mortality)

* content[evidence][+]
  * relatedArtifact.resourceReference = Reference(CoE-MultiplexPCRDiagnostic-AntibioticDays)

* content[evidence][+]
  * relatedArtifact.resourceReference = Reference(CoE-MultiplexPCRDiagnostic-TimeToDeescalation)

Instance: CoE-MultiplexPCRDiagnostic-Mortality
InstanceOf: CertaintyOfEvidenceRating
Usage: #example
Title: "Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Mortality"
Description: "Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on mortality"
* insert narrative([[Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on mortality]])
* artifactReference = Reference(Evidence-MultiplexPCRDiagnostic-Mortality)
* content[levelOfEvidence]
  * classifier = $cs-quality-of-evidence#very-low "Very low quality"

Instance: CoE-MultiplexPCRDiagnostic-AntibioticDays
InstanceOf: CertaintyOfEvidenceRating
Usage: #example
Title: "Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Antibiotic Days"
Description: "Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on antibiotic days"
* insert narrative([[Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on antibiotic days]])
* artifactReference = Reference(Evidence-MultiplexPCRDiagnostic-AntibioticDays)
* content[levelOfEvidence]
  * classifier = $cs-quality-of-evidence#very-low "Very low quality"

Instance: CoE-MultiplexPCRDiagnostic-TimeToDeescalation
InstanceOf: CertaintyOfEvidenceRating
Usage: #example
Title: "Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Time to Deescalation"
Description: "Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on time to deescalation"
* insert narrative([[Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on time to deescalation]])
* artifactReference = Reference(Evidence-MultiplexPCRDiagnostic-TimeToDeescalation)
* content[levelOfEvidence]
  * classifier = $cs-quality-of-evidence#very-low "Very low quality"

Instance: Evidence-MultiplexPCRDiagnostic-Mortality
InstanceOf: Evidence
Usage: #example
Title: "Evidence-Multiplex PCR Diagnostic-Mortality"
Description: "Evidence for the impact of Multiplex-PCR-Diagnostik on mortality"
* insert narrative([[Evidence for the impact of Multiplex-PCR-Diagnostik on mortality]])
* status = #active
* variableDefinition[+]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(OutcomeMortality)

Instance: Evidence-MultiplexPCRDiagnostic-AntibioticDays
InstanceOf: Evidence
Usage: #example
Title: "Evidence-Multiplex PCR Diagnostic-Antibiotic Days"
Description: "Evidence for the impact of Multiplex-PCR-Diagnostik on antibiotic days"
* insert narrative([[Evidence for the impact of Multiplex-PCR-Diagnostik on antibiotic days]])
* status = #active
* variableDefinition[+]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(OutcomeAntibioticDays)

Instance: Evidence-MultiplexPCRDiagnostic-TimeToDeescalation
InstanceOf: Evidence
Usage: #example
Title: "Evidence-Multiplex PCR Diagnostic-Time to Deescalation"
Description: "Evidence for the impact of Multiplex-PCR-Diagnostik on time to deescalation"
* insert narrative([[Evidence for the impact of Multiplex-PCR-Diagnostik on time to deescalation]])
* status = #active
* variableDefinition[+]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(OutcomeTimeToDeescalation)

Instance: OutcomeMortality
InstanceOf: EvidenceVariable
Usage: #example
Title: "Outcome Mortality"
Description: "Outcome Mortality"
* insert narrative([[Outcome Mortality]])
* status = #active
* characteristic.definitionCodeableConcept.text = "Mortality"

Instance: OutcomeAntibioticDays
InstanceOf: EvidenceVariable
Usage: #example
Title: "Outcome Antibiotic Days"
Description: "Outcome Antibiotic Days"
* insert narrative([[Outcome Antibiotic Days]])
* status = #active
* characteristic.definitionCodeableConcept.text = "Antibiotic Days"

Instance: OutcomeTimeToDeescalation
InstanceOf: EvidenceVariable
Usage: #example
Title: "Outcome Time to Deescalation"
Description: "Outcome Time to Deescalation"
* insert narrative([[Outcome Time to Deescalation]])
* status = #active
* characteristic.definitionCodeableConcept.text = "Time to Deescalation"
