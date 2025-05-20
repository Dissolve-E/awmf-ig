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
While DISSOLVE-E is initiated by the AWMF and foremost aiming to develop a digital guidelines registry for Germany, we propose a general profile (Guideline) as well as profiles including AWMF specific requirements.

| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Guideline][SD:Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of a general clinical practice guideline. |
| [AWMF Guideline][SD:AWMF Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of a guideline based on AWMF requirements. |
| [AWMF S1 Guideline][SD:AWMF S1 Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S1 guideline encompassing expert recommendations developed through informal consensus. |
| [AWMF S2e Guideline][SD:AWMF S2e Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S2e guideline based on systematic literature search and evaluation. |
| [AWMF S2k Guideline][SD:AWMF S2k Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S2k guideline based on structured consensus by a representative panel. |
| [AWMF S3 Guideline][SD:AWMF S3 Guideline] | [Composition]({{ fhir_base_url }}composition.html) | Representation of an AWMF S3 guideline based on systematic evidence review and structured consensus by a representative panel. |
{:.grid}

#### Profile to represent a recommendation
| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Recommendation][SD:Recommendation] | [Composition]({{ fhir_base_url }}composition.html) | Representation of a clinical practice guideline recommendation. |
{:.grid}

##### Profiles to represent the certainty of evidence upon which a clinical practice guideline recommendation is based
We propose different a general profile as well as profiles based on different rating systems.
| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Evidence Assessment][SD:Evidence Assessment] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the certainty of evidence for a specific outcome. |
| [Evidence Assessment AGREE II][SD:Evidence Assessment AGREE II] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the quality of guidelines using the AGREE II instrument. |
| [Evidence Assessment AMSTAR 2][SD:Evidence Assessment AMSTAR 2] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the quality of guidelines using AMSTAR 2. |
| [Evidence Assessment Cochrane Risk of Bias][SD:Evidence Assessment Cochrane Risk of Bias] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of risk of bias using Cochrane RoB tool. |
| [Evidence Assessment GRADE][SD:Evidence Assessment GRADE] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the certainty of evidence for a specific outcome, including GRADE rating. |
| [Evidence Assessment Oxford 2011][SD:Evidence Assessment Oxford 2011] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the certainty of evidence for a specific outcome, including Oxford 2011 rating. |
| [Evidence Assessment ROBIS][SD:Evidence Assessment ROBIS] | [ArtifactAssesment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structure assessment of risk of bias using ROBIS (Risk of Bias in Systematic Reviews). |
{:.grid}

##### Profiles to represent the recommendation justification
We propose a general profile as well as two further profiles based on the GRADE and AWMF rating systems used to describe the strength of recommendation:
| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Recommendation Justification][SD:Recommendation Justification] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the evidence and consensus that underpins a recommendation. |
| [Recommendation Justification AWMF][SD:Recommendation Justification AWMF] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the evidence and consensus that underpins a recommendation, including AWMF rating. |
| [Recommendation Justification GRADE][SD:Recommendation Justification GRADE] | [ArtifactAssessment]({{ fhir_base_url }}artifactassessment.html) | Representation of a structured assessment of the evidence and consensus that underpins a recommendation, including GRADE rating. |
{:.grid}

#### Profiles for involved Organizations and Persons
| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [AWMF Member Organization][SD:AWMF Member Organization] | [Organization]({{ fhir_base_url }}organization.html) | Representation of an organization that is a member of the AWMF. |
| [Guideline Author][SD:Guideline Author] | [Practitioner]({{ fhir_base_url }}practitioner.html) | Representation of a person that authored a guideline. |
| [Guideline Author Role][SD:Guideline Author Role] | [PractitionerRole]({{ fhir_base_url }}practitionerrole.html) | Representation of the role of the author of the guideline. |
{:.grid}

#### Other Profile
| Name | FHIR Base Resource | Description |
| ---- | ------------- | ----------- |
| [Guideline Attachment][SD:Guideline Attachment] | [DocumentReference]({{ fhir_base_url }}documentreference.html) | Representation of an attachment to a clinical practice guideline. |
{:.grid}

### Graphical Overview of the FHIR Resources

The following diagramm provides an overview of the diverse profiles used in this the DISSOLVE-E-IG and their relationship allowing for a structured representation of clinical practice guidelines with
accompanying evidence and evidence-to-decision information. The cardinalities shown represent the respective maxima. Please consult the pages of the respective [profiles](profiles.html) for additional details.

<img src="awmf-ig-klassendiagramm-v0.png" alt="Class Diagramm for DISSOLVE-E" style="width:100%;" />

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