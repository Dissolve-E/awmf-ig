# Artifacts Summary - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [AWMF Member Organization](StructureDefinition-awmf-member-organization.md) | An organization that is a member of the AWMF |
| [AWMF S1 Guideline Registry Record](StructureDefinition-awmf-guideline-record-s1.md) | AWMF S1 guideline representing expert recommendations developed through informal consensus. |
| [AWMF S2e Guideline Registry Record](StructureDefinition-awmf-guideline-record-s2e.md) | AWMF S2e guideline based on systematic literature search and evaluation. |
| [AWMF S2k Guideline Registry Record](StructureDefinition-awmf-guideline-record-s2k.md) | AWMF S2k guideline based on structured consensus by a representative panel. |
| [AWMF S3 Guideline Registry Record](StructureDefinition-awmf-guideline-record-s3.md) | AWMF S3 guideline based on systematic evidence review and structured consensus by a representative panel. |
| [Citation List](StructureDefinition-citation-list.md) | List of citations. |
| [Conceptual Cohort Definition Comparator](StructureDefinition-conceptual-cohort-definition-comparator.md) | A structured definition of the comparator as defined for a PICO question. |
| [Conceptual Cohort Definition Intervention](StructureDefinition-conceptual-cohort-definition-intervention.md) | A structured definition of the intervention as defined for a PICO question. |
| [Conceptual Cohort Definition Outcome](StructureDefinition-conceptual-cohort-definition-outcome.md) | A structured definition of the outcome as defined for a PICO question. |
| [Conceptual Cohort Definition Population](StructureDefinition-conceptual-cohort-definition-population.md) | A structured definition of the population as defined for a PICO question. |
| [Evidence Assessment](StructureDefinition-evidence-assessment.md) | A structured assessment of the certainty of evidence for a specific outcome. |
| [Evidence Internal Assessment AGREE II](StructureDefinition-evidence-internal-assessment-agreeii.md) | A structured assessment of the quality of guidelines using the AGREE II instrument. |
| [Evidence Internal Assessment AMSTAR 2](StructureDefinition-evidence-internal-assessment-amstar2.md) | A structured assessment of the certainty of evidence using AMSTAR 2. |
| [Evidence Internal Assessment Cochrane Risk of Bias](StructureDefinition-evidence-internal-assessment-cochrane-rob.md) | Structured assessment of risk of bias using Cochrane RoB tool. |
| [Evidence Internal Assessment ROBIS](StructureDefinition-evidence-internal-assessment-robis.md) | Structured assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews). |
| [Evidence Internal Validity Assessment](StructureDefinition-evidence-internal-validity-assessment.md) | A structured assessment of the internal validity of evidence. |
| [Evidence Overall Assessment GRADE](StructureDefinition-evidence-overall-assessment-grade.md) | A structured assessment of the certainty of evidence for a specific outcome, including GRADE rating. |
| [Evidence Overall Assessment Oxford 2011](StructureDefinition-evidence-overall-assessment-oxford2011.md) | A structured assessment of the certainty of evidence for a specific outcome, including Oxford 2011 rating. |
| [Evidence Overall Quality Assessment](StructureDefinition-evidence-overall-quality-assessment.md) | A structured assessment of the overall evidence for a specific outcome. |
| [Evidence Report with Contact Slices](StructureDefinition-evidence-report-with-contact-slices.md) | Intermediate profile that re-slices the extendedContactDetail extension from EvidenceReport. This workaround profile isolates the re-slicing to avoid 'Named items are out of order in the slice' errors in derived profiles. See profile comments for detailed explanation. |
| [Guideline](StructureDefinition-awmf-guideline.md) | Clinical Practice Guideline |
| [Guideline Attachment](StructureDefinition-guideline-attachment.md) | Attachment to a Clinical Practice Guideline |
| [Guideline Author](StructureDefinition-guideline-author.md) | A person that authored a guideline. |
| [Guideline Author Role](StructureDefinition-guideline-author-role.md) | The role of the author of the guideline. |
| [Guideline Registry Record](StructureDefinition-guideline-registry-record.md) | Guideline Registry Record containing metadata and registry-specific information for a clinical practice guideline. |
| [Medical Society](StructureDefinition-medical-society.md) | A profile for medical societies. |
| [Outcome Evidence](StructureDefinition-outcome-evidence.md) | Represents evidence supporting a specific outcome within a body of clinical or scientific evidence. |
| [PICO Question](StructureDefinition-pico-question.md) | A structured definition of the PICO question in the context of guidelines and recommendations. |
| [Patient Organization](StructureDefinition-patient-organization.md) | An organization that represents patients |
| [Recommendation](StructureDefinition-recommendation.md) | Clinical Practice Guideline Recommendation |
| [Recommendation Justification](StructureDefinition-recommendation-justification.md) | A structured assessment of the evidence and consensus that underpins a recommendation. |
| [Recommendation Justification AWMF](StructureDefinition-recommendation-justification-awmf.md) | A structured assessment of the evidence and consensus that underpins a recommendation, including AWMF rating. |
| [Recommendation Justification Expert Consensus](StructureDefinition-recommendation-justification-expert-consensus.md) | A structured assessment of the evidence and consensus that underpins a recommendation based on expert consensus. |
| [Recommendation Justification GRADE](StructureDefinition-recommendation-justification-grade.md) | A structured assessment of the evidence and consensus that underpins a recommendation using the GRADE evidence rating system. |
| [Recommendation Justification OXFORD 2009](StructureDefinition-recommendation-justification-oxford-2009.md) | A structured assessment of the evidence and consensus that underpins a recommendation using the OXFORD 2009 evidence rating system. |
| [Recommendation Justification OXFORD 2011](StructureDefinition-recommendation-justification-oxford-2011.md) | A structured assessment of the evidence and consensus that underpins a recommendation using the OXFORD 2011 evidence rating system. |
| [Recommendation Justification SIGN](StructureDefinition-recommendation-justification-sign.md) | A structured assessment of the evidence and consensus that underpins a recommendation using the SIGN evidence rating system. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Artifact Contact (Extended)](StructureDefinition-ext-artifact-extended-contact.md) | This extension provides additional contact details for individuals or organizations associated with an artifact (e.g., a clinical document, guideline, or other composition). |
| [Author Language](StructureDefinition-ext-author-language.md) | This extension allows for the specification of the language(s) the author contributed to a section in a FHIR Composition. |
| [Consultation Period](StructureDefinition-ext-consultation-period.md) | This extension allows for the indication of the period during which the guideline is open for consultation. |
| [First Publication Date](StructureDefinition-ext-first-publication-date.md) | This extension allows for the indication of the date when the guideline was first published. |
| [Guideline Author Role](StructureDefinition-ext-guideline-author-role.md) | This extension allows for the indication of the role of the author of the guideline. |
| [Medical Subject](StructureDefinition-ext-medical-subject.md) | An extension to specify medical subjects related to an organization. |
| [Medical Subject Category](StructureDefinition-ext-medical-subject-category.md) | An extension to specify medical subject category related to an organization. |
| [Planned Completion Date](StructureDefinition-ext-planned-completion-date.md) | This extension allows for the indication of the date when the guideline is planned to be completed. |
| [Publication Date](StructureDefinition-ext-publication-date.md) | This extensions allows for the indication of the date when the guideline was published. |
| [Recommendation Review Status](StructureDefinition-ext-recommendation-review-status.md) | This extension allows for the indication of the status of a recommendation in the context of an updated guideline version along with an optional explanatory text |
| [Registration Date](StructureDefinition-ext-registration-date.md) | This extensions allows for the indication of the date the guideline project was registered. |
| [RelatesTo Classifier](StructureDefinition-ext-relates-to-classifier.md) | This extension defines a classification for the 'relatesTo' relationship using a CodeableConcept. |
| [RelatesTo Label](StructureDefinition-ext-relates-to-label.md) | This extension defines a label for the 'relatesTo' relationship using a CodeableConcept. |
| [Section Coding](StructureDefinition-ext-section-coding.md) | This extension allows for the assignment of a specific code to a section within a Composition resource. The code provides a standardized way to categorize or identify the content of the section, enabling better organization, searchability, and interoperability of clinical documents or other structured artifacts. |
| [Section Intended Audience](StructureDefinition-ext-section-intended-audience.md) | This extension allows for the indication of the target audience for the section |
| [Section Keyword](StructureDefinition-ext-section-keyword.md) | This extension allows for the indication of keywords associated with the section |
| [Section Language](StructureDefinition-ext-section-language.md) | This extension allows for the indication of the Language of the Section. |
| [Submission Date](StructureDefinition-ext-submission-date.md) | This extension allows for the indication of the date when the guideline was submitted to the system. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [AGREE II Domains Value Set](ValueSet-vs-agree-ii-domains.md) | ValueSet encompassing all domains from the AGREE II instrument. |
| [AMSTAR 2 Confidence Ratings Value Set](ValueSet-vs-amstar2-confidence-ratings.md) | ValueSet encompassing all overall confidence ratings from the AMSTAR 2 critical appraisal tool. |
| [AWMF Guideline Class](ValueSet-vs-awmf-guideline-class.md) | ValueSet listing values representing guideline classes according to the AWMF. |
| [AWMF Guideline Status](ValueSet-vs-awmf-guideline-status.md) | ValueSet listing values to define the guideline status according to the AWMF. |
| [Body System Conditions](ValueSet-vs-body-system-conditions.md) | ValueSet listing various body system conditions |
| [Care Level](ValueSet-vs-care-level.md) | ValueSet listing levels of care. |
| [Care Stage](ValueSet-vs-care-stage.md) | ValueSet listing stages of care from prevention to rehabilitation. |
| [Clinical Application Type](ValueSet-vs-clinical-application-type.md) | ValueSet listing different clinical application types |
| [Content Types](ValueSet-vs-content-types.md) | ValueSet listing types of content that can be part of a guideline or recommendation. |
| [Dissemination Website](ValueSet-vs-dissemination-website.md) | ValueSet listing types of dissemination websites |
| [Encounter Type](ValueSet-vs-encounter-type.md) | ValueSet listing types of patient encounters based on hospitalization status. |
| [Guideline Author Role](ValueSet-vs-guideline-author-role.md) | ValueSet listing roles that a author can have in a guideline. |
| [Guideline Contact Point VS](ValueSet-vs-guideline-contact-point.md) | ValueSet listing contact points relevant to guidelines, such as registrants, coordinators, and main contacts. |
| [Guideline Release Type](ValueSet-vs-guideline-release-type.md) | ValueSet listing different guideline release types |
| [Guideline Sections](ValueSet-vs-guideline-sections.md) | ValueSet listing values to use to define guideline sections |
| [Intended Audience Value Set](ValueSet-vs-intended-audience.md) | ValueSet listing codes representing intended audiences for a section |
| [Level Of Consensus](ValueSet-vs-level-of-consensus.md) | ValueSet listing values to define the level of consensus for a recommendation. |
| [Medical Subject Categories](ValueSet-vs-medical-subject-categories.md) | ValueSet listing values to classify medical subjects into different categories. |
| [OCEBM 2009 Levels of Evidence Value Set](ValueSet-vs-ocebm-2009-levels-of-evidence.md) | ValueSet encompassing all levels from the Oxford Centre for Evidence-Based Medicine 2009 Levels of Evidence. |
| [OCEBM 2011 Levels of Evidence Value Set](ValueSet-ocebm-2011-levels-of-evidence-vs.md) | ValueSet encompassing all levels from the OCEBM 2011 Levels of Evidence. |
| [PICO related terms](ValueSet-vs-pico.md) | ValueSet listing different terms related to PICO question and objects |
| [ROBIS Judgment of Risk of Bias Value Set](ValueSet-vs-robis-judgment-of-risk-of-bias.md) | ValueSet encompassing all risk of bias judgment values from the ROBIS tool. |
| [ROBIS Risk of Bias Domains Value Set](ValueSet-vs-robis-risk-of-bias-domains.md) | ValueSet encompassing all risk of bias domains from the ROBIS tool. |
| [Rating Acceptability](ValueSet-vs-rating-acceptability.md) | ValueSet defining if the alternatives are acceptable for the target population and its implementors? |
| [Rating Benefits And Harms](ValueSet-vs-rating-benefits-and-harms.md) | ValueSet listing values to represent the summary of the most important benefits and harms |
| [Rating Certainty Of Evidence](ValueSet-vs-rating-certainty-of-evidence.md) | Codes from EvidenceCertaintyRating related to certainty of evidence |
| [Rating Concern Degree](ValueSet-vs-rating-concern-degree.md) | ValueSet listing codes from EvidenceCertaintyRating related to degree of concern |
| [Rating Equity](ValueSet-vs-rating-equity.md) | ValueSet listing values to represent how the different alternatives affect equity |
| [Rating Feasibility](ValueSet-vs-rating-feasibility.md) | ValueSet listing values to reprensent how feasible will it be to implement the different alternatives and if there are any issues |
| [Rating Preference And Values](ValueSet-vs-rating-preference-and-values.md) | ValueSet listing typical patient preferences and values as well as common issues or expected variability |
| [Rating Resources](ValueSet-vs-rating-resources.md) | ValueSet listing values to indicate if there are issues related to costs or resource use. |
| [Recommendation Direction](ValueSet-vs-recommendation-direction.md) | ValueSet defining the direction of a clinical recommendation. |
| [Recommendation Review Status Value Set](ValueSet-vs-recommendation-review-status.md) | ValueSet representing the review-related status of a recommendation in a new guideline version |
| [Recommendation Strength (AWMF) ValueSet](ValueSet-vs-recommendation-strength-awmf.md) | ValueSet of strength of recommendations as defined in AWMF guideline methodology. |
| [Recommendation Synthesis Type](ValueSet-vs-recommendation-synthesis-type.md) | ValueSet listing different synthesis Types of recommendations |
| [Recommendation Tags](ValueSet-vs-recommendation-tags.md) | ValueSet listing different tags to use for recommendations |
| [Remark Type](ValueSet-vs-remark-type.md) | ValueSet listing types of remarks that can be associated with guidelines, including restrictions, warnings, and additional notes. |
| [RoB2 Overall Judgment ValueSet](ValueSet-vs-rob-2-overall-judgment.md) | ValueSet listing values to represent the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials. |
| [SIGN Grade of Recommendation Value Set](ValueSet-vs-sign-grade-of-recommendation.md) | ValueSet encompassing all grades of recommendation from the SIGN (Scottish Intercollegiate Guidelines Network) Grades of Recommendation. |
| [SIGN Level of Evidence Value Set](ValueSet-vs-sign-level-of-evidence.md) | ValueSet encompassing all levels from the SIGN (Scottish Intercollegiate Guidelines Network) Levels of Evidence. |
| [Target Patient Group](ValueSet-vs-target-patient-group.md) | ValueSet listing patient population categories for guidelines, such as adults and children/adolescents. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [AGREE II Domains](CodeSystem-cs-agree-ii-domains.md) | CodeSystem representing the domains assessed by the AGREE II instrument for evaluating the quality of clinical practice guidelines. |
| [AMSTAR 2 Overall Confidence Ratings](CodeSystem-cs-amstar2-confidence-ratings.md) | CodeSystem representing the overall confidence ratings from the AMSTAR 2 critical appraisal tool. |
| [AWMF Guideline Class](CodeSystem-cs-awmf-guideline-class.md) | As part of the project planning for the creation or updating of a guideline, a decision should be made at an early stage about the planned level classification ("S classification") according to the AWMF's system of rules (1-3). The S-classification scheme of the AWMF differentiates between the classes S1 treatment recommendation as well as S2e, S2k and S3 guideline. The "S" stands for the extent of the applied systematic approach in the development process of a guideline. Each class thus stands for a specific methodological concept that must be presented in a way that is comprehensible to the users. The choice of class is based on the question of how much effort is appropriate and feasible. The need for legitimacy for the implementation of the guideline (convincing the target group) must be taken into account. When choosing a higher S-classification in the context of updating a guideline, the adaptation to the corresponding methodology has to be considered. |
| [AWMF Guideline Status](CodeSystem-cs-awmf-guideline-status.md) | CodeSystem representing the guideline status according to the AWMF. |
| [Body System Conditions](CodeSystem-cs-body-systems-conditions.md) | CodeSystem representing various body system conditions. |
| [Care Setting](CodeSystem-cs-care-setting.md) | CodeSystem defining different care settings, including levels of care, healthcare services, and treatment contexts. |
| [Clinical Application Type](CodeSystem-cs-clinical-application-type.md) | CodeSystem defining different clinical application types |
| [Contact Point](CodeSystem-cs-contact-point.md) | CodeSystem defining types of contact points for a guideline |
| [Evidence To Decision Certainty Rating](CodeSystem-cs-evidence-to-decision-certainty-rating.md) | CodeSystem defining GRADE Evidence to Decision (EtD) Framework Certainty Ratings |
| [Evidence To Decision Certainty type](CodeSystem-cs-evidence-to-decision-certainty-type.md) | CodeSystem defining values to represent the GRADE Evidence to Decision (EtD) Framework Certainty Type |
| [Guideline Author Role](CodeSystem-cs-guideline-author-role.md) | CodeSystem defining roles for the author of the guideline. |
| [Guideline Release Type](CodeSystem-cs-guideline-release-type.md) | CodeSystem defining different guideline release types |
| [Guideline Sections](CodeSystem-cs-guideline-sections.md) | Sections of a guideline, describing various aspects such as its intention, target patient group, care setting, and other relevant contextual information. |
| [Intended Audience Code System](CodeSystem-cs-intended-audience.md) | CodeSystem defining possible intended audiences for a section |
| [Level of Consensus](CodeSystem-cs-level-of-consensus.md) | CodeSystem defining the values representing the level of consensus for a recommendation. |
| [Medical Subject Categories](CodeSystem-cs-medical-subject-categories.md) | CodeSystem defining values to classify medical subjects into different categories. |
| [OCEBM 2009 Levels of Evidence](CodeSystem-cs-ocebm-2009-levels-of-evidence.md) | CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2009 CEBM Levels of Evidence |
| [OCEBM 2011 Levels of Evidence](CodeSystem-cs-ocebm-2011-levels-of-evidence.md) | CodeSystem representing the Oxford Centre for Evidence-Based Medicine 2011 Levels of Evidence. |
| [PICO Related Terms](CodeSystem-cs-pico.md) | CodeSystem defining different terms related to PICO question and objects |
| [ROBIS Judgment of Risk of Bias](CodeSystem-cs-robis-judgment-of-risk-of-bias.md) | CodeSystem representing the judgment of risk of bias assessed by the ROBIS tool for evaluating risk of bias in systematic reviews. |
| [ROBIS Risk of Bias Domains](CodeSystem-cs-robis-risk-of-bias-domains.md) | CodeSystem representing the domains assessed by the ROBIS tool for evaluating risk of bias in systematic reviews. |
| [Recommendation Direction](CodeSystem-cs-recommendation-direction.md) | CodeSystem defining the direction of a clinical recommendation. |
| [Recommendation Review Status Code System](CodeSystem-cs-recommendation-review-status.md) | CodeSystem defining values indicating how a recommendation relates to a new revision of a recommendation |
| [Recommendation Strength (AWMF)](CodeSystem-cs-recommendation-strength-awmf.md) | CodeSystem defining the grading of recommendations according to German guideline methodology as used in AWMF S3 guidelines. |
| [Recommendation Synthesis Type](CodeSystem-cs-recommendation-synthesis-type.md) | CodeSystem defining values representing the synthesis type of a recommendation |
| [Recommendation Tags](CodeSystem-cs-recommendation-tags.md) | CodeSystem defining codes to represent tags for recommendations |
| [Related Artifact Types](CodeSystem-cs-related-artifact-types.md) | CodeSystem defining types of related artifacts that can be part of a guideline. |
| [Remark Type](CodeSystem-cs-remark-type.md) | CodeSystem defining different types of remarks that can be associated with guidelines, including restrictions, warnings, and additional notes. |
| [RoB2 Overall Judgment](CodeSystem-cs-rob-2-overall-judgment.md) | CodeSystem representing the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials. |
| [SIGN Grade of Recommendation](CodeSystem-cs-sign-grade-of-recommendation.md) | CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Grades of Recommendation. |
| [SIGN Level of Evidence](CodeSystem-cs-sign-level-of-evidence.md) | CodeSystem representing the Scottish Intercollegiate Guidelines Network (SIGN) Levels of Evidence. |
| [Target Patient Group](CodeSystem-cs-target-patient-group.md) | CodeSystem defining the intended patient population for whom the guideline is applicable. |
| [awmf](CodeSystem-cs-awmf.md) | CodeSystem representing different codes of interest for the Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF) |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [AWMF Guideline Record S3 Example](Composition-AWMFGuidelineRecordS3Example.md) | An example of an AWMF S3 guideline. |
| [AWMF Guideline S1 Example](Composition-AWMFGuidelineS1Example.md) | An example of an AWMF S1 guideline. |
| [AWMF Guideline S2e Example](Composition-AWMFGuidelineS2eExample.md) | An example of an AWMF S2e guideline. |
| [AWMF Guideline S2k Example](Composition-AWMFGuidelineRecordS2kExample.md) | An example of an AWMF S2k guideline. |
| [AWMF Member Organization Example](Organization-AWMFMemberOrganizationExample.md) | An example of an AWMF member organization. |
| [Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF)](Organization-AWMF.md) | Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften (AWMF) |
| [Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia - Sensitivity](ArtifactAssessment-RoB-CognitiveTestsWhenSuspectingDementia-Sensitivity.md) | Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia on Sensitivity |
| [Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia - Specificity](ArtifactAssessment-RoB-CognitiveTestsWhenSuspectingDementia-Specificity.md) | Certainty of Evidence Rating Ris of Bias for Cognitive Tests When Suspecting Dementia on Specificity |
| [Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Antibiotic Days](ArtifactAssessment-EvA-MultiplexPCRDiagnostic-AntibioticDays.md) | Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on antibiotic days |
| [Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Mortality](ArtifactAssessment-EvA-MultiplexPCRDiagnostic-Mortality.md) | Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on mortality |
| [Certainty of Evidence Rating for Multiplex-PCR-Diagnostik - Time to Deescalation](ArtifactAssessment-EvA-MultiplexPCRDiagnostic-TimeToDeescalation.md) | Certainty of evidence rating for the impact of Multiplex-PCR-Diagnostik on time to deescalation |
| [Citation Systematic Review](Citation-CitationSystematicReviewTsoi2015.md) | Citation for the Systematic Review by Tsoi et al. 2015 |
| [Concept map from concepts from standardized vocabularies (that are not standard OMOP concepts) to Concept IDs of OMOP standard Concepts](ConceptMap-FHIRStatusToAWMFStatus.md) | Concept map from concepts from standardized vocabularies that are not labelled as 'standard' in Athena – OHDSI Vocabularies Repository to Concept IDs from 'standard' concepts |
| [DGAI](Organization-DGAI.md) | Deutsche Gesellschaft für Anästhesiologie und Intensivmedizin e.V. (DGAI) |
| [DGCH](Organization-DGCH.md) | Deutsche Gesellschaft für Chirurgie e.V. (DGCH) |
| [DGHM](Organization-DGHM.md) | Deutsche Gesellschaft für Hygiene und Mikrobiologie e.V. (DGHM) |
| [DGI](Organization-DGI.md) | Deutsche Gesellschaft für Infektiologie e.V. (DGI) |
| [DGIIN](Organization-DGIIN.md) | Deutsche Gesellschaft für Internistische Intensivmedizin und Notfallmedizin e.V. (DGIIN) |
| [DGIM](Organization-DGIM.md) | Deutsche Gesellschaft für Innere Medizin e.V. (DGIM) |
| [DGP](Organization-DGP.md) | Deutsche Gesellschaft für Pneumologie und Beatmungsmedizin e.V. (DGP) |
| [DGPPN](Organization-DGPPN.md) | Deutsche Gesellschaft für Psychiatrie und Psychotherapie, Psychosomatik und Nervenheilkunde e. V. (DGPPN) |
| [DRG](Organization-DRG.md) | Deutsche Röntgengesellschaft, Gesellschaft für Medizinische Radiologie e.V. (DRG) |
| [DSG](Organization-DSG.md) | Deutsche Sepsis-Gesellschaft e.V. (DSG) |
| [Evidence-Multiplex PCR Diagnostic-Antibiotic Days](Evidence-Evidence-MultiplexPCRDiagnostic-AntibioticDays.md) | Evidence for the impact of Multiplex-PCR-Diagnostik on antibiotic days |
| [Evidence-Multiplex PCR Diagnostic-Mortality](Evidence-Evidence-MultiplexPCRDiagnostic-Mortality.md) | Evidence for the impact of Multiplex-PCR-Diagnostik on mortality |
| [Evidence-Multiplex PCR Diagnostic-Time to Deescalation](Evidence-Evidence-MultiplexPCRDiagnostic-TimeToDeescalation.md) | Evidence for the impact of Multiplex-PCR-Diagnostik on time to deescalation |
| [Foliensatz](DocumentReference-Guideline-020-013-SlideDeck.md) | Foliensatz Leitlinie 020-013 |
| [GfV](Organization-GFV.md) | Gesellschaft für Virologie e.V. (GfV) |
| [Guideline Attachment Example](DocumentReference-guideline-attachment-example.md) | An example of a guideline attachment. |
| [Guideline Attachment Patient Version Example](DocumentReference-guideline-attachment-patient-version-example.md) | An example of a guideline attachment for the patient version. |
| [Guideline Author Example](Practitioner-GuidelineAuthorExample.md) | An example of a guideline author. |
| [Guideline Author Role Example](PractitionerRole-GuidelineAuthorRoleExample.md) | An example of a guideline author role. |
| [Guideline Example](Composition-GuidelineExample.md) | An example of a guideline. |
| [Guideline Registry Record Example](Composition-GuidelineRegistryRecordExample.md) | An example of a guideline registry record. |
| [Guideline with contributing author referencing Practitioner (fails invariant)](Composition-RR-TestInvContribAuthorRefPerson-SHOULD-FAIL.md) | Fails because the contributing author points to a Practitioner instead of an Organization. |
| [Guideline with leading author referencing Organization (passes invariant)](Composition-RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS.md) | Passes because the leading author points to an Organization. |
| [Guideline with leading author referencing Practitioner (fails invariant)](Composition-RR-TestInvLeadingAuthorRefPerson-SHOULD-FAIL.md) | Fails because the leading author points to a Practitioner instead of an Organization. |
| [HAP Diagnose](Composition-RecommendationHAPDiagnosis.md) | Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten? |
| [HAP Diagnose - Empfehlung A](Composition-RecommendationHAPDiagnosis-A.md) | Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten? |
| [HAP Diagnose - Empfehlung B](Composition-RecommendationHAPDiagnosis-B.md) | Wie wird eine HAP klinisch diagnostiziert und welche Differenzialdiagnosen sind zu beachten? |
| [Implementierungshilfe](DocumentReference-Guideline-020-013-ImplementationGuidance.md) | Implementierungshilfe Leitlinie 020-013 |
| [Jessica Rademacher](Practitioner-JessicaRademacher.md) | Jessica Rademacher |
| [Jessica Rademacher for DGP in the context of 020-013](PractitionerRole-JessicaRademacherDGPFor020-013.md) | Jessica Rademacher for DGP in the context of 020-013 |
| [Kurzfassung](DocumentReference-Guideline-020-013-ShortVersion.md) | Kurzfassung Leitlinie 020-013 |
| [Langfassung](DocumentReference-Guideline-020-013-LongVersion.md) | Langfassung Leitlinie 020-013 |
| [Leitlinienreport](DocumentReference-Guideline-020-013-GuidelineReport.md) | Leitlinienreport Leitlinie 020-013 |
| [Medical Society Example](Organization-MedicalSocietyExample.md) | An example of a medical society. |
| [Multiplex-PCR-Diagnostik](Composition-RecommendationMultiplexPCRDiagnostic.md) | Wird der Einsatz von Multiplex-PCR im Rahmen der mikrobiologischen Diagnostik bei Patienten mit Verdacht auf nosokomiale Pneumonie empfohlen? |
| [Netzwerk chronisch pulmonale Aspergillose (CPAnet)](Organization-CPAnet.md) | Netzwerk chronisch pulmonale Aspergillose (CPAnet) |
| [Outcome Antibiotic Days](EvidenceVariable-OutcomeAntibioticDays.md) | Outcome Antibiotic Days |
| [Outcome Mortality](EvidenceVariable-OutcomeMortality.md) | Outcome Mortality |
| [Outcome Time to Deescalation](EvidenceVariable-OutcomeTimeToDeescalation.md) | Outcome Time to Deescalation |
| [PEG](Organization-PEG.md) | Paul-Ehrlich-Gesellschaft für Infektionstherapie e.V. (PEG) |
| [PICO Comparator of Recommendation 17 from Guideline 038-013](Group-PICOComparatorRec17.md) | Vergleichsintervention: Kein Test, Mini-Mental-Status-Test (Standard) |
| [PICO Intervention of Recommendation 17 from Guideline 038-013](Group-PICOInterventionRec17.md) | Intervention: Verschiedene kognitive Kurztests |
| [PICO Outcome Sensitivity of Recommendation 17 from Guideline 038-013](Group-PICOOutcomeSensitivityRec17.md) | Sensitivität für die Indikation einer Demenz |
| [PICO Outcome Specificity of Recommendation 17 from Guideline 038-013](Group-PICOOutcomeSpecificityRec17.md) | Spezifizität für die Indikation einer Demenz |
| [PICO Population of Recommendation 17 from Guideline 038-013](Group-PICOPopulationRec17.md) | Population: Menschen in nicht-spezialisierten Settings (z. B. Hausarztpraxis, Krankenhaus), die über die kognitive Störungen berichten oder bei denen eine kognitive Störung beobachtet wird |
| [PICO Question of Recommendation 17 from Guideline 038-013](Group-PICOQuestionRec17.md) | Schlüsselfrage: Sind Tests in nicht-spezialisierten Settings sinnvoll, um eine Demenz zu erkennen bei Personen, die kognitive Störungen berichten oder bei denen eine kognitive Störung beobachtet wird und die einer solchen Untersuchung zustimmen? |
| [Patienteninformation](DocumentReference-Guideline-020-013-PatientVersion.md) | Patienteninformation Leitlinie 020-013 |
| [Recommendation Example](Composition-RecommendationExample.md) | An example of a recommendation. |
| [Recommendation-PlanDefinition-example](PlanDefinition-Recommendation-PlanDefinition-example.md) |  |
| [RecommendationCognitiveTestsWhenSuspectingDementia-Justification](ArtifactAssessment-RecommendationCognitiveTestsWhenSuspectingDementia-Justification.md) | Justification for Recommendation Cognitive Tests When Suspecting Dementia |
| [RecommendationHAPDiagnosis-A-Justification](ArtifactAssessment-RecommendationHAPDiagnosis-A-Justification.md) | Justification for Recommendation HAP Diagnose A |
| [RecommendationHAPDiagnosis-B-Justification](ArtifactAssessment-RecommendationHAPDiagnosis-B-Justification.md) | Justification for Recommendation HAP Diagnose B |
| [RecommendationMultiplexPCRDiagnostic-Justification](ArtifactAssessment-RecommendationMultiplexPCRDiagnostic-Justification.md) | Justification for Recommendation Multiplex-PCR-Diagnostik |
| [Robert Koch-Institut](Organization-RKI.md) | Robert Koch-Institut |
| [S3-Leitlinie Demenzen Living Guideline - Langfassung](Composition-Demenzen.md) | S3-Leitlinie Demenzen Living Guideline - Langfassung |
| [S3-Leitlinie Demenzen Living Guideline - Record](Composition-DemenzenRecord.md) | S3-Leitlinie Demenzen Living Guideline - Record |
| [S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie](Composition-NosokomialePneumonie.md) | S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie |
| [S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie](Composition-NosokomialePneumonieRecord.md) | S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie |
| [Screening auf kognitive Beeinträchtigung](Composition-RecommendationCognitiveTestsWhenSuspectingDementia.md) | Sind Tests in nicht-spezialisierten Settings sinnvoll, um eine Demenz zu erkennen bei Personen, die kognitive Störungen berichten oder bei denen eine kognitive Störung beobachtet wird und die einer solchen Untersuchung zustimmen? |
| [Test: Author Both Leading and Contributing (Should Fail)](Composition-RR-TestTestInvAuthorLeadVsContrExclusive-Both-SHOULD-FAIL.md) | Tests that author-leading-vs-contributing-exclusive fails when author has both roles. |
| [Test: No Official Identifier (Should Fail)](Composition-G-TestTestInvRequireOfficialIdentifier-NoOfficialId-SHOULD-FAIL.md) | Tests that inv-require-official-identifier fails when no official identifier is present. |
| [Test: No Official Identifier (Should Fail)](Composition-RR-TestTestInvRequireOfficialId-NoOfficialId-SHOULD-FAIL.md) | Tests that inv-require-official-identifier fails when no official identifier is present. |
| [Test: No Registrant Author (Should Fail)](Composition-RR-TestTestInvAuthorRegistSingleton-NoRegistrant-SHOULD-FAIL.md) | Tests that author-registrant-singleton fails when no registrant is present. |
| [Test: Preliminary With Consultation Period (Should Pass)](Composition-RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS.md) | Tests that preliminary-composition-needs-consultation-period passes when period is present. |
| [Test: Preliminary Without Consultation Period (Should Fail)](Composition-RR-TestTestInvPrelimCompNeedsConsultPeriod-NoDate-SHOULD-FAIL.md) | Tests that preliminary-composition-needs-consultation-period fails when period is missing. |
| [Test: Registered With Planned Completion Date (Should Pass)](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS.md) | Tests that registered-composition-needs-planned-completion-date passes when date is present. |
| [Test: Registered Without Planned Completion Date (Should Fail)](Composition-RR-TestTestInvRegCompNeedsPlannedComplDate-NoDate-SHOULD-FAIL.md) | Tests that registered-composition-needs-planned-completion-date fails when date is missing. |
| [Test: Release Type If Registered (Should Pass)](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-SHOULD-PASS.md) | Tests that inv-require-release-type-if-registered passes when release type is present. |
| [Test: Release Type No Tag (Should Fail)](Composition-RR-TestTestInvRequireReleaseTypeIfRegistered-NoTag-SHOULD-FAIL.md) | Tests that inv-require-release-type-if-registered fails when release type tag is missing. |
| [Test: Release Type Wrong Code (Should Fail)](Composition-RR-TestTestInvRequireReleaseTypeIfReg-WrongCode-SHOULD-FAIL.md) | Tests that inv-require-release-type-if-registered fails when release type code is invalid. |
| [Test: Single Registrant Author (Should Pass)](Composition-RR-TestTestInvAuthorRegistrantSingleton-SHOULD-PASS.md) | Tests that author-registrant-singleton passes when exactly one registrant is present. |
| [Test: Two Official Identifiers (Should Fail)](Composition-G-TestTestInvRequireOfficialIdentifier-TwoOfficialId-SHOULD-FAIL.md) | Tests that inv-require-official-identifier fails when two official identifiers are present. |
| [Test: Two Official Identifiers (Should Fail)](Composition-RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL.md) | Tests that inv-require-official-identifier fails when two official identifiers are present. |
| [Test: Two Registrant Authors (Should Fail)](Composition-RR-TestTestInvAuthorRegistSingleton-TwoRegistrants-SHOULD-FAIL.md) | Tests that author-registrant-singleton fails when two registrants are present. |
| [Test: Version Major.Minor.Patch (Should Fail)](Composition-G-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL.md) | Tests that inv-version-major-minor fails when version has three parts. |
| [Test: Version Major.Minor.Patch (Should Fail)](Composition-RR-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL.md) | Tests that inv-version-major-minor fails when version has three parts. |
| [Test: Version as Text (Should Fail)](Composition-G-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL.md) | Tests that inv-version-major-minor fails when version is text. |
| [Test: Version as Text (Should Fail)](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL.md) | Tests that inv-version-major-minor fails when version is text. |
| [Test: Version with Prefix (Should Fail)](Composition-G-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL.md) | Tests that inv-version-major-minor fails when version has 'v' prefix. |
| [Test: Version with Prefix (Should Fail)](Composition-RR-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL.md) | Tests that inv-version-major-minor fails when version has 'v' prefix. |
| [contributor0](Practitioner-contributor0.md) |  |
| [contributor1](Practitioner-contributor1.md) |  |
| [contributor2](Practitioner-contributor2.md) |  |
| [contributor3](Practitioner-contributor3.md) |  |
| [contributor4](Practitioner-contributor4.md) |  |

