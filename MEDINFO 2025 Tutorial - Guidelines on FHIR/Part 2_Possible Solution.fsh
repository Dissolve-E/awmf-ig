Instance: RecommendationNoChemopreventioninHNPCCpatients
InstanceOf: Recommendation
Usage: #example
Title: "No Chemoprevention in HNPCC patients"
Description: "Is Chemoprevention recommended in HNPCC patients?"

* status = #final
* version = "2013"
* title = "No Chemoprevention in HNPCC patients"

* relatesTo[partOf] = Reference(GuidelineColorectalCarcinoma)

* category[synthesisType] = cs-recommendation-synthesis-type#evidence-based "Evidence-based"

* section[recommendationStatement]
  * section[language]
    * extension[language].valueCode = #en
    * insert narrative([[Chemoprevention in HNPCC patients should not be performed.]])

* section[population]
  * section[language]
    * extension[language].valueCode = #en
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patients with Hereditary nonpolyposis colon cancer (HNPCC).</div>"
    * extension[ext-section-keyword].valueCoding[sct][+] =  $sct#315058005 "Hereditary nonpolyposis colon cancer (disorder)"
    //* entry only Reference(EvidenceVariable or Group) // actually, EvidenceVariable is only for R5 while group is for R6    

* section[action]
  * section[language]
    * extension[language].valueCode = #en
      * text
        * status = #additional
        * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Chemoprevention.</div>"
    * extension[ext-section-keyword].valueCoding[sct][+] =  $sct#1137696006 "Chemoprevention (procedure)"
    //* entry only Reference(PlanDefinition)

* section[text]
  * code = $cs-ebm-ig#text "Text"
  * section[language]
    * extension[language].valueCode = #en
    * insert narrative([[So far, only data from one prospective randomized study exist on chemoprevention of
HNPCC. The CAPP2-study tested the use of 600 mg acetylsalicylic acid and resistant
starch in a 2x2 design. The primary analysis of the defined endpoints showed no
significant effect of ASS [287]. After longer follow-up of 55.7 months, a significant
reduction of colorectal cancer incidence (hazard ratio 0.41 (95%CI 0.19-0.86), p=0.02)
as well as a non-significant reduction of other HNPCC-associated cancer (hazard ratio
0.47 (95%CI 0.21-1.06), p=0.07) was found in the subgroup of HNPCC patients who had
taken 600 mg ASS for at least 2 years [288]. The study dose of 600 mg with its expected
side effects seems high. The efficacy of low ASS doses for HNPCC-patients is currently
not known and will be studied in a subsequent study (CAPP-3). The aim is to include as
many HNPCC-patients as possible. In general, HNPCC-patients should not undergo
chemoprevention with ASS until the results of this study are available.]])



Instance: RecommendationNoChemopreventioninHNPCCpatients-Justification
InstanceOf: RecommendationJustificationAWMF
Usage: #example
Title: "RecommendationNoChemopreventioninHNPCCpatients-Justification"
Description: "Justification for Recommendation No Chemoprevention in HNPCC patients"
//* insert narrative([[Justification for Recommendation No Chemoprevention in HNPCC patients]])
* artifactReference = Reference(RecommendationNoChemopreventioninHNPCCpatients)
* content[recommendationRating]

  * component[strengthOfRecommendation]
    * classifier = $cs-recommendation-strength-awmf#B "Recommendation"
  
  * component[directionOfRecommendation]
    * classifier = $cs-direction-of-recommendation#against "Against"
  
  * component[levelOfConsensus]
    * classifier = $cs-level-of-consensus#consensus "Consensus"

//Note that the Level of Evidence (2b) is based on "Scheme of Evidence Level According to Oxford (Version 2009)" but not provided yet in our IG. The closest modelling would be with CertaintyOfEvidenceRatingOXFORD2011

