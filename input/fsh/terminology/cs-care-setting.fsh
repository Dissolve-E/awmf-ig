CodeSystem: CareSetting
Id: cs-care-setting
Title: "Care Setting"
Description: "Defines different care settings, including levels of care, healthcare services, and treatment contexts."
// TODO: add descriptions
// Präventation, Früherkennung, Diagnose, Therapie, Rehabilitation
// primärärztliche Vesorgung, spezialärztliche Versorgung
// ambulant, stationär, teilstationär
* #prevention "Prevention" "Activities aimed at preventing diseases or injuries before they occur."
* #early-detection "Early Detection" "The identification of diseases or conditions at an early stage, often before symptoms appear."
* #diagnosis "Diagnosis" "The process of determining the nature and cause of a disease or injury through evaluation of patient history, examination, and tests."
* #therapy "Therapy" "The treatment of a disease or condition, including medical, surgical, or psychological interventions."
* #rehabilitation "Rehabilitation" "The process of restoring physical, mental, or social abilities lost due to illness or injury."
* #primary-care "Primary Care" "First-contact healthcare provided by general practitioners or family physicians."
* #specialized-care "Specialized Care" "Healthcare provided by medical specialists with advanced training in specific fields."
* #outpatient "Outpatient" "Healthcare services provided to patients who are not admitted to a hospital or other facility."
* #inpatient "Inpatient" "Healthcare services provided to patients who are admitted to a hospital or other facility for at least one night."
* #partial-hospitalization "Partial Hospitalization" "Healthcare services provided in a hospital or facility during the day, with patients returning home at night."


// TODO: move to separate files, add descriptions
ValueSet: CareStageVS
Id: vs-care-stage
Title: "CareStage"
Description: "Includes stages of care from prevention to rehabilitation."
* cs-care-setting#prevention
* cs-care-setting#early-detection
* cs-care-setting#diagnosis
* cs-care-setting#therapy
* cs-care-setting#rehabilitation

ValueSet: CareLevelVS
Id: vs-care-level
Title: "Care Level"
Description: "Includes levels of care."
* cs-care-setting#primary-care
* cs-care-setting#specialized-care

ValueSet: EncounterTypeVS
Id: vs-encounter-type
Title: "Encounter Type"
Description: "Includes types of patient encounters based on hospitalization status."
* cs-care-setting#outpatient
* cs-care-setting#inpatient
* cs-care-setting#partial-hospitalization
