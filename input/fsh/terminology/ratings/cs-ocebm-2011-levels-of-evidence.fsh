CodeSystem: OCEBM2011LevelsOfEvidence
Id: cs-ocebm-2011-levels-of-evidence
Title: "OCEBM 2011 Levels of Evidence"
Description: "A CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence."
* insert rs-codesystem-meta
* ^content = #complete

* #level1 "Systematic Reviews and Randomized Trials" "Includes systematic reviews of randomized trials or n-of-1 trials."
* #level2 "Cohort Studies" "Includes systematic reviews of cohort studies or individual cohort studies and low-quality randomized trials."
* #level3 "Case-Control Studies" "Includes systematic reviews of case-control studies or individual case-control studies."
* #level4 "Case Series" "Includes case series and poor-quality cohort and case-control studies."
* #level5 "Expert Opinion" "Includes expert opinion without explicit critical appraisal, or based on physiology, bench research, or 'first principles'."

ValueSet: OCEBM2011LevelsOfEvidenceVS
Id: ocebm-2011-levels-of-evidence-vs
Title: "OCEBM 2011 Levels of Evidence Value Set"
Description: "A ValueSet encompassing all levels from the OCEBM 2011 Levels of Evidence."
* include codes from system cs-ocebm-2011-levels-of-evidence