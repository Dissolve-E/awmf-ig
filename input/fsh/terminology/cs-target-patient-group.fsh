CodeSystem: TargetPatientGroup
Id: cs-target-patient-group
Title: "Target Patient Group"
Description: "Defines the intended patient population for whom the guideline is applicable."
* insert rs-codesystem-meta
// TODO: german translations, description
* #adults "Adults" "Guideline specifically targeted at adult patients."
* #children-adolescents "Children/Adolescents" "Guideline specifically targeted at children and adolescents." 

ValueSet: TargetPatientGroupVS
Id: vs-target-patient-group
Title: "Target Patient Group"
Description: "Includes patient population categories for guidelines, such as adults and children/adolescents."
* include codes from system cs-target-patient-group