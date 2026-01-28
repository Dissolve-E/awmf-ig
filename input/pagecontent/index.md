{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

# Dissolve-E - Digitization of the AWMF guideline registry for an open, guideline-based, trustworthy evidence ecosystem

### Background

Dissolve-E (*Digitization of the AWMF guideline registry for an open, guideline-based, trustworthy evidence ecosystem*) aims to digitize the guidelines registry maintained by the Association of the Scientific Medical Societies in Germany (AWMF). This registry plays a crucial role in ensuring quality medical care by providing evidence-based clinical guidelines. However, this registry is currently analog without comprehensive digital version existing yet.

**Potential Objectives and Benefits are:**

* Developing a digital infrastructure that meets national and international technical standards and requirements;
* Ideally facilitating the creation, updating, and access of clinical guidelines;
* Providing tailored formats and decision-support tools for medical professionals;
* Potentially enabling efficient real-time comparison between guideline recommendations, treatment options, and latest scientific findings.

### Summary

We hereby present the Implementation Guide (IG) developed for DISSOLVE-E based combining the [evidence-based medicine on FHIR (EBMonFHIR)][EMBonFHIR] IG and further defined artifacts to represent evidence-based clinical practice guidelines and recommendations, including the evidence that led to the single recommendations. Additional FHIR artifacts allow to describe the certainty of evidence based on different rating systems or the strength of recommendation, as well as the organizations and persons involved in the guideline process.

This IG is based on FHIR R6 (6.0.0-ballot3).
{:.stu-note}

#### Profiles to represent a clinical practice guideline
While DISSOLVE-E is initiated by the AWMF and foremost aiming to develop a digital guidelines registry for Germany, we propose a general guideline profile as well as registry-specific profiles including AWMF specific requirements.

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Guideline][SD:Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of a general clinical practice guideline. |
| [Guideline Attachment][SD:Guideline Attachment] | [DocumentReference]({{ fhir_base_url }}documentreference.html) | Representation of an attachment to a clinical practice guideline. |
| [Guideline Registry Record][SD:Guideline Registry Record] | [Composition]({{ fhir_base_url }}composition.html) | Representation of a guideline registry record containing metadata and registry-specific information. |
| [AWMF S1 Guideline Registry Record][SD:AWMF S1 Guideline Registry Record] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S1 guideline registry record encompassing expert recommendations developed through informal consensus. |
| [AWMF S2e Guideline Registry Record][SD:AWMF S2e Guideline Registry Record] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S2e guideline registry record based on systematic literature search and evaluation. |
| [AWMF S2k Guideline Registry Record][SD:AWMF S2k Guideline Registry Record] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S2k guideline registry record based on structured consensus by a representative panel. |
| [AWMF S3 Guideline Registry Record][SD:AWMF S3 Guideline Registry Record] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S3 guideline registry record based on systematic evidence review and structured consensus by a representative panel. |
{:.grid}

#### Profile to represent a recommendation

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Recommendation][SD:Recommendation] | [Composition]({{ fhir_base_url }}composition.html) | Representation of a clinical practice guideline recommendation. |
{:.grid}

##### Profiles to represent the certainty of evidence upon which a clinical practice guideline recommendation is based
We propose a general profile as well as profiles based on different quality and risk of bias assessment systems.

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Certainty of Evidence Rating][SD:Certainty of Evidence Rating] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | General representation of a certainty of evidence rating for a specific outcome. |
| [Evidence Internal Validity Assessment][SD:Evidence Internal Validity Assessment] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Assessment of the internal validity of evidence. |
| [Evidence Internal Assessment AGREE II][SD:Evidence Internal Assessment AGREE II] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Assessment of guideline quality using the AGREE II instrument. |
| [Evidence Internal Assessment AMSTAR 2][SD:Evidence Internal Assessment AMSTAR 2] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Assessment of systematic review quality using AMSTAR 2. |
| [Evidence Internal Assessment Cochrane Risk of Bias][SD:Evidence Internal Assessment Cochrane Risk of Bias] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Assessment of risk of bias using Cochrane RoB tool. |
| [Evidence Internal Assessment ROBIS][SD:Evidence Internal Assessment ROBIS] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews). |
| [Evidence Overall Quality Assessment][SD:Evidence Overall Quality Assessment] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Overall assessment of evidence quality. |
| [Evidence Overall Assessment GRADE][SD:Evidence Overall Assessment GRADE] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Overall assessment of evidence certainty using GRADE. |
| [Evidence Overall Assessment Oxford 2011][SD:Evidence Overall Assessment Oxford 2011] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Overall assessment of evidence certainty using Oxford 2011 levels of evidence. |
{:.grid}

##### Profiles to represent the recommendation justification

We propose a general profile as well as specific profiles based on various internationally recognized rating systems used to describe the strength of recommendation:

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Recommendation Justification][SD:Recommendation Justification] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | General representation of a structured assessment of the evidence and consensus that underpins a recommendation. |
| [Recommendation Justification AWMF][SD:Recommendation Justification AWMF] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Recommendation justification including AWMF strength of recommendation rating. |
| [Recommendation Justification Expert Consensus][SD:Recommendation Justification Expert Consensus] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Recommendation justification based on expert consensus. |
| [Recommendation Justification GRADE][SD:Recommendation Justification GRADE] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Recommendation justification including GRADE strength of recommendation rating. |
| [Recommendation Justification OXFORD 2009][SD:Recommendation Justification OXFORD 2009] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Recommendation justification including Oxford 2009 grade of recommendation. |
| [Recommendation Justification OXFORD 2011][SD:Recommendation Justification OXFORD 2011] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Recommendation justification including Oxford 2011 grade of recommendation. |
| [Recommendation Justification SIGN][SD:Recommendation Justification SIGN] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Recommendation justification including SIGN grade of recommendation. |
{:.grid}

#### Profiles for PICO Questions

To support structured representation of clinical questions, we provide profiles for PICO (Population, Intervention, Comparator, Outcome) questions:

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [PICO Question][SD:PICO Question] | [Group]({{ fhir_base_url }}group.html) | Structured definition of a PICO question in the context of guidelines and recommendations. |
| [Conceptual Cohort Definition Population][SD:Conceptual Cohort Definition Population] | [Group]({{ fhir_base_url }}group.html) | Definition of the population in a PICO question. |
| [Conceptual Cohort Definition Intervention][SD:Conceptual Cohort Definition Intervention] | [Group]({{ fhir_base_url }}group.html) | Definition of the intervention in a PICO question. |
| [Conceptual Cohort Definition Comparator][SD:Conceptual Cohort Definition Comparator] | [Group]({{ fhir_base_url }}group.html) | Definition of the comparator in a PICO question. |
| [Conceptual Cohort Definition Outcome][SD:Conceptual Cohort Definition Outcome] | [Group]({{ fhir_base_url }}group.html) | Definition of the outcome in a PICO question. |
{:.grid}

#### Profiles for involved Organizations and Persons

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [AWMF Member Organization][SD:AWMF Member Organization] | [Organization]({{ fhir_base_url }}organization.html) | Representation of an organization that is a member of the AWMF. |
| [Medical Society][SD:Medical Society] | [Organization]({{ fhir_base_url }}organization.html) | Representation of a medical society involved in guideline development. |
| [Patient Organization][SD:Patient Organization] | [Organization]({{ fhir_base_url }}organization.html) | Representation of a patient organization involved in guideline development. |
| [Guideline Author][SD:Guideline Author] | [Practitioner]({{ fhir_base_url }}practitioner.html) | Representation of a person that authored a guideline. |
| [Guideline Author Role][SD:Guideline Author Role] | [PractitionerRole]({{ fhir_base_url }}practitionerrole.html) | Representation of the role of the author of the guideline. |
{:.grid}

#### Other Profiles

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Outcome Evidence][SD:Outcome Evidence] | [Evidence]({{ fhir_base_url }}evidence.html) | Representation of evidence for a specific outcome. |
| [Citation List][SD:Citation List] | [Citation]({{ fhir_base_url }}citation.html) | Representation of a list of citations supporting recommendations or evidence. |
{:.grid}

### Graphical Overview of the FHIR Resources

The following diagramm provides an overview of the diverse profiles used in this the DISSOLVE-E-IG and their relationship allowing for a structured representation of clinical practice guidelines with
accompanying evidence and evidence-to-decision information. The cardinalities shown represent the respective maxima. Please consult the pages of the respective [profiles](profiles.html) for additional details.

<img src="awmf-ig-0.2.0-class-diagram.png" alt="Class Diagramm for DISSOLVE-E AWMF IG" style="width:100%;" />

### Authors (in alphabetical order) with Affiliations
* [Sophie Klopfenstein](https://github.com/klsophie) (Berlin Institute of Health at Charité)
* [Gregor Lichtner](https://github.com/glichtner) (University Medicine Greifswald)
* Ina Müller (Association of the Scientific Medical Societies in Germany)
* [Johannes Starlinger](https://github.com/starlinger) (Howto Health GmbH)

### Contributing Organisations (in alphabetical order)

* Association of the Scientific Medical Societies in Germany (AWMF)
* aQua – Institute for Applied Quality Improvement and Research in Health Care
* Charité–Universitätsmedizin Berlin / Berlin Institute of Health
* Clinical Guideline Services GmbH
* Computable Publishing LLC, Scientific Knowledge Accelerator Foundation
* Evidence Prime Inc.
* German Cancer Society, Office Leitlinienprogramm Onkologie
* German Society for Wound Healing and Wound Treatment e.V.
* German Society of Internal Medicine
* HL7 Germany
* Howto Health GmbH
* Institute for Evidence in Medicine, University of Freiburg
* MAGIC Evidence Ecosystem Foundation
* University Medicine Greifswalds

### Further information

#### Ethical Considerations
*The Ethics Committee of the Berlin chamber of physicians in accordance with its code of conduct §15 section 1 (Eth-KB-24-11) confirmed that no ethical approval is needed for this study.*

#### Funding Information
This project is publicly funded by the Innovation Committee of the Federal Joint Committee (German: Gemeinsamer Bundesausschuss, short: G-BA) for three years (April 2024 to March 2027) with a total of around 2.8 million euros under the grant number: 01VSF23021. 

#### Links
* DISSOLVE-E on the Website of the Federal Joint Committee (G-BA) in [German](https://innovationsfonds.g-ba.de/projekte/versorgungsforschung/dissolve-e.597) or [English](https://www.awmf.org/die-awmf/imwi/projekte/dissolve-e-english-version)
* [GitHub project](https://github.com/Dissolve-E/awmf-ig)

{% include link-list.md %}
