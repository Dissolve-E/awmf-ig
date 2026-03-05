Instance: RecommendationAgainstBoneMarrowBiopsy-Justification
InstanceOf: RecommendationJustification
Usage: #example
Title: "RecommendationAgainstBoneMarrowBiopsy-Justification"
Description: "Begründung für Empfehlung 5.13: Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie"
* insert narrative([[Begründung für Empfehlung 5.13: Situationen mit Empfehlungen gegen eine Knochenmarkbiopsie]])
* artifactReference = Reference(RecommendationAgainstBoneMarrowBiopsy)
* content[recommendationRating]

  * component[strengthOfRecommendation]
    * classifier = cs-recommendation-strength-awmf#A "Strong Recommendation"

  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#against "Against"

  * component[levelOfConsensus]
    * classifier = cs-level-of-consensus#strong-consensus "Strong consensus"


// Overall survival
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#moderate "Moderate quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-OverallSurvival)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-OS)


// Progression-free survival
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#moderate "Moderate quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-ProgressionFreeSurvival)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-PFS)


// Event-free survival
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#moderate "Moderate quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-EventFreeSurvival)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-EFS)


// Sensitivity (Staging)
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#moderate "Moderate quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-Staging-Sensitivity)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-Sensitivity)


// Specificity (Staging)
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#moderate "Moderate quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-Staging-Specificity)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-Specificity)


// Positive predictive value (Staging)
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#low "Low quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-Staging-PPV)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-PPV)


// Negative predictive value (Staging)
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#high "High quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-Staging-NPV)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-NPV)


// Staging
* content[evidenceRating][+]
  * component[ratingSystem]
    * classifier = $cs-evidence-rating-system#grade "GRADE"
  * component[levelOfEvidence]
    * classifier = $cs-certainty-rating#moderate "Moderate quality"
  * component[outcome]
    * relatesTo.targetReference = Reference(Outcome-Staging)
  * component[overallQualityOfEvidence][+]
    * relatesTo.targetReference = Reference(EvA-BoneMarrowBiopsy-Staging)



Instance: EvA-BoneMarrowBiopsy-OS
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Gesamt\u00fcberleben"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Gesamtüberleben"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Gesamtüberleben]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-OS)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#moderate "Moderate quality"


Instance: EvA-BoneMarrowBiopsy-PFS
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Progressionsfreies \u00dcberleben"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Progressionsfreies Überleben"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Progressionsfreies Überleben]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-PFS)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#moderate "Moderate quality"


Instance: EvA-BoneMarrowBiopsy-EFS
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Ereignisfreies \u00dcberleben"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Ereignisfreies Überleben"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Ereignisfreies Überleben]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-EFS)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#moderate "Moderate quality"


Instance: EvA-BoneMarrowBiopsy-Sensitivity
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Sensitivit\u00e4t (Stadieneinteilung)"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Sensitivität (Stadieneinteilung)"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Sensitivität (Stadieneinteilung)]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-Sensitivity)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#moderate "Moderate quality"


Instance: EvA-BoneMarrowBiopsy-Specificity
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Spezifit\u00e4t (Stadieneinteilung)"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Spezifität (Stadieneinteilung)"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Spezifität (Stadieneinteilung)]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-Specificity)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#moderate "Moderate quality"


Instance: EvA-BoneMarrowBiopsy-PPV
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Positiver Vorhersagewert (Stadieneinteilung)"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Positiver Vorhersagewert (Stadieneinteilung)"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Positiver Vorhersagewert (Stadieneinteilung)]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-PPV)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#low "Low quality"


Instance: EvA-BoneMarrowBiopsy-NPV
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Negativer Vorhersagewert (Stadieneinteilung)"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Negativer Vorhersagewert (Stadieneinteilung)"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Negativer Vorhersagewert (Stadieneinteilung)]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-NPV)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#high "High quality"


Instance: EvA-BoneMarrowBiopsy-Staging
InstanceOf: EvidenceOverallAssessmentGRADE
Usage: #example
Title: "Evidence Assessment: Knochenmarkbiopsie - Stadieneinteilung"
Description: "Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Stadieneinteilung"
* insert narrative([[Evidenzsicherheit für Knochenmarkbiopsie vs. PET/CT-Staging: Stadieneinteilung]])
* artifactReference = Reference(Evidence-BoneMarrowBiopsy-Staging)
* content[levelOfEvidence]
  * classifier = $cs-certainty-rating#moderate "Moderate quality"


Instance: Evidence-BoneMarrowBiopsy-OS
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Gesamt\u00fcberleben"
Description: "Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das Gesamtüberleben"
* insert narrative([[Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das Gesamtüberleben]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-OverallSurvival)
  * observed = Reference(Outcome-OverallSurvival)


Instance: Evidence-BoneMarrowBiopsy-PFS
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Progressionsfreies \u00dcberleben"
Description: "Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das progressionsfreie Überleben"
* insert narrative([[Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das progressionsfreie Überleben]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-ProgressionFreeSurvival)
  * observed = Reference(Outcome-ProgressionFreeSurvival)


Instance: Evidence-BoneMarrowBiopsy-EFS
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Ereignisfreies \u00dcberleben"
Description: "Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das ereignisfreie Überleben"
* insert narrative([[Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das ereignisfreie Überleben]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-EventFreeSurvival)
  * observed = Reference(Outcome-EventFreeSurvival)


Instance: Evidence-BoneMarrowBiopsy-Sensitivity
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Sensitivit\u00e4t (Stadieneinteilung)"
Description: "Evidenz zur Sensitivität von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung"
* insert narrative([[Evidenz zur Sensitivität von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-Staging-Sensitivity)
  * observed = Reference(Outcome-Staging-Sensitivity)


Instance: Evidence-BoneMarrowBiopsy-Specificity
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Spezifit\u00e4t (Stadieneinteilung)"
Description: "Evidenz zur Spezifität von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung"
* insert narrative([[Evidenz zur Spezifität von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-Staging-Specificity)
  * observed = Reference(Outcome-Staging-Specificity)


Instance: Evidence-BoneMarrowBiopsy-PPV
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Positiver Vorhersagewert (Stadieneinteilung)"
Description: "Evidenz zum positiven Vorhersagewert von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung"
* insert narrative([[Evidenz zum positiven Vorhersagewert von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-Staging-PPV)
  * observed = Reference(Outcome-Staging-PPV)


Instance: Evidence-BoneMarrowBiopsy-NPV
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Negativer Vorhersagewert (Stadieneinteilung)"
Description: "Evidenz zum negativen Vorhersagewert von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung"
* insert narrative([[Evidenz zum negativen Vorhersagewert von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-Staging-NPV)
  * observed = Reference(Outcome-Staging-NPV)


Instance: Evidence-BoneMarrowBiopsy-Staging
InstanceOf: OutcomeEvidence
Usage: #example
Title: "Evidence: Knochenmarkbiopsie - Stadieneinteilung"
Description: "Evidenz zur Genauigkeit von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung"
* insert narrative([[Evidenz zur Genauigkeit von PET/CT vs. Knochenmarkbiopsie für die Stadieneinteilung]])
* status = #active
* variableDefinition[outcome]
  * variableRole = $cs-variable-role#outcome
  * intended = Reference(Outcome-Staging)
  * observed = Reference(Outcome-Staging)

