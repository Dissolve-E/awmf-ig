Alias: $citation-classification-type = http://hl7.org/fhir/citation-classification-type
Alias: $citation-artifact-classifier = http://hl7.org/fhir/citation-artifact-classifier
Alias: $elements_descriptions.html = https://www.nlm.nih.gov/bsd/licensee/elements_descriptions.html#owner_value
Alias: $citation-status-type = http://hl7.org/fhir/citation-status-type
Alias: $title-type = http://hl7.org/fhir/title-type
Alias: $cited-artifact-abstract-type = http://hl7.org/fhir/cited-artifact-abstract-type
Alias: $mesh = https://www.nlm.nih.gov/mesh
Alias: $published-in-type = http://hl7.org/fhir/published-in-type
Alias: $elements_descriptions.html_1 = https://www.nlm.nih.gov/bsd/licensee/elements_descriptions.html#issn
Alias: $cited-medium = http://hl7.org/fhir/cited-medium
Alias: $artifact-url-classifier = http://hl7.org/fhir/artifact-url-classifier
Alias: $cited-artifact-classification-type = http://hl7.org/fhir/cited-artifact-classification-type
Alias: $cited-artifact-classification-type_1 = https://hl7.org/fhir/cited-artifact-classification-type
Alias: $citation-artifact-classifier_1 = https://hl7.org/fhir/citation-artifact-classifier
Alias: $elements_descriptions.html_2 = https://www.nlm.nih.gov/bsd/licensee/elements_descriptions.html#citationsubset
Alias: $citation-status-type_1 = https://hl7.org/fhir/citation-status-type
Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203
Alias: $Thesaurus.owl = http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl

Instance: CitationSystematicReviewTsoi2015
InstanceOf: Citation
Usage: #example
Title: "Citation Systematic Review"
Description: "Citation for the Systematic Review by Tsoi et al. 2015"
* meta.profile = "http://hl7.org/fhir/uv/ebm/StructureDefinition/journal-article-citation"
* meta.versionId = "1"
* meta.lastUpdated = "2026-01-23T12:12:55.936Z"
* status = #active
* useContext.code = $citation-classification-type#fevir-platform-use "FEvIR Platform Use"
* useContext.valueCodeableConcept.coding = $citation-artifact-classifier#medline-base "Medline Base"
* useContext.valueCodeableConcept.coding.userSelected = false
* classification[0].type = $citation-classification-type#citation-source "Citation Source"
* classification[=].classifier.text = "MEDLINE"
* classification[+].type = $citation-classification-type#medline-owner "MEDLINE Citation Owner"
* classification[=].classifier.coding = $elements_descriptions.html#NLM "National Library of Medicine, Index Section"
* classification[=].classifier.coding.userSelected = false
* statusDate[0].activity = $citation-status-type#pubmed-pubstatus-entrez "PubMed Pubstatus of Entrez"
* statusDate[=].period.end = "2015-06-09T06:00:00.000Z"
* statusDate[+].activity = $citation-status-type#pubmed-pubstatus-pubmed "PubMed Pubstatus of Pubmed"
* statusDate[=].period.end = "2015-06-09T06:00:00.000Z"
* statusDate[+].activity = $citation-status-type#pubmed-pubstatus-medline "PubMed Pubstatus of Medline"
* statusDate[=].period.end = "2015-12-17T06:00:00.000Z"
* citedArtifact.identifier[0].system = "https://pubmed.ncbi.nlm.nih.gov"
* citedArtifact.identifier[=].value = "26052687"
* citedArtifact.identifier[+].system = "https://doi.org"
* citedArtifact.identifier[=].value = "10.1001/jamainternmed.2015.2152"
* citedArtifact.identifier[+].type.text = "pii"
* citedArtifact.identifier[=].value = "2301149"
* citedArtifact.title.text = "Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis."
* citedArtifact.title.type = $title-type#primary "Primary title"
* citedArtifact.abstract.type = $cited-artifact-abstract-type#primary-human-use "Primary human use"
* citedArtifact.abstract.text = "<AbstractText Label=\"IMPORTANCE\" NlmCategory=\"OBJECTIVE\">Dementia is a global public health problem. The Mini-Mental State Examination (MMSE) is a proprietary instrument for detecting dementia, but many other tests are also available.</AbstractText><AbstractText Label=\"OBJECTIVE\" NlmCategory=\"OBJECTIVE\">To evaluate the diagnostic performance of all cognitive tests for the detection of dementia.</AbstractText><AbstractText Label=\"DATA SOURCES\" NlmCategory=\"METHODS\">Literature searches were performed on the list of dementia screening tests in MEDLINE, EMBASE, and PsychoINFO from the earliest available dates stated in the individual databases until September 1, 2014. Because Google Scholar searches literature with a combined ranking algorithm on citation counts and keywords in each article, our literature search was extended to Google Scholar with individual test names and dementia screening as a supplementary search.</AbstractText><AbstractText Label=\"STUDY SELECTION\" NlmCategory=\"METHODS\">Studies were eligible if participants were interviewed face to face with respective screening tests, and findings were compared with criterion standard diagnostic criteria for dementia. Bivariate random-effects models were used, and the area under the summary receiver-operating characteristic curve was used to present the overall performance.</AbstractText><AbstractText Label=\"MAIN OUTCOMES AND MEASURES\" NlmCategory=\"METHODS\">Sensitivity, specificity, and positive and negative likelihood ratios were the main outcomes.</AbstractText><AbstractText Label=\"RESULTS\" NlmCategory=\"RESULTS\">Eleven screening tests were identified among 149 studies with more than 49,000 participants. Most studies used the MMSE (n = 102) and included 10,263 patients with dementia. The combined sensitivity and specificity for detection of dementia were 0.81 (95% CI, 0.78-0.84) and 0.89 (95% CI, 0.87-0.91), respectively. Among the other 10 tests, the Mini-Cog test and Addenbrooke's Cognitive Examination-Revised (ACE-R) had the best diagnostic performances, which were comparable to that of the MMSE (Mini-Cog, 0.91 sensitivity and 0.86 specificity; ACE-R, 0.92 sensitivity and 0.89 specificity). Subgroup analysis revealed that only the Montreal Cognitive Assessment had comparable performance to the MMSE on detection of mild cognitive impairment with 0.89 sensitivity and 0.75 specificity.</AbstractText><AbstractText Label=\"CONCLUSIONS AND RELEVANCE\" NlmCategory=\"CONCLUSIONS\">Besides the MMSE, there are many other tests with comparable diagnostic performance for detecting dementia. The Mini-Cog test and the ACE-R are the best alternative screening tests for dementia, and the Montreal Cognitive Assessment is the best alternative for mild cognitive impairment.</AbstractText>"
* citedArtifact.publicationForm.publishedIn.type = $published-in-type#D020492 "Periodical"
* citedArtifact.publicationForm.publishedIn.identifier[0].type = $elements_descriptions.html_1#Electronic "Electronic"
* citedArtifact.publicationForm.publishedIn.identifier[=].type.text = "Electronic ISSN Type"
* citedArtifact.publicationForm.publishedIn.identifier[=].value = "2168-6114"
* citedArtifact.publicationForm.publishedIn.identifier[=].system = "https://portal.issn.org"
* citedArtifact.publicationForm.publishedIn.identifier[+].type.text = "ISOAbbreviation"
* citedArtifact.publicationForm.publishedIn.identifier[=].system = "https://www.issn.org/services/online-services/access-to-the-ltwa/"
* citedArtifact.publicationForm.publishedIn.identifier[=].value = "JAMA Intern Med"
* citedArtifact.publicationForm.publishedIn.identifier[+].type.text = "ISSN Linking"
* citedArtifact.publicationForm.publishedIn.identifier[=].system = "https://www.issn.org/understanding-the-issn/assignment-rules/the-issn-l-for-publications-on-multiple-media/"
* citedArtifact.publicationForm.publishedIn.identifier[=].value = "2168-6106"
* citedArtifact.publicationForm.publishedIn.identifier[+].type.text = "Medline Title Abbreviation"
* citedArtifact.publicationForm.publishedIn.identifier[=].system = "https://www.nlm.nih.gov/tsd/cataloging/contructitleabbre.html"
* citedArtifact.publicationForm.publishedIn.identifier[=].value = "JAMA Intern Med"
* citedArtifact.publicationForm.publishedIn.identifier[+].type.text = "NLM Unique ID"
* citedArtifact.publicationForm.publishedIn.identifier[=].system = "https://locatorplus.gov/cgi-bin/Pwebrecon.cgi?DB=local"
* citedArtifact.publicationForm.publishedIn.identifier[=].value = "101589534"
* citedArtifact.publicationForm.publishedIn.title = "JAMA internal medicine"
* citedArtifact.publicationForm.publishedIn.publisherLocation = "United States"
* citedArtifact.publicationForm.citedMedium = $cited-medium#internet "Internet"
* citedArtifact.publicationForm.volume = "175"
* citedArtifact.publicationForm.issue = "9"
* citedArtifact.publicationForm.articleDate = "2015-09"
* citedArtifact.publicationForm.pageString = "1450-8"
* citedArtifact.webLocation[0].classifier = $artifact-url-classifier#abstract "Abstract"
* citedArtifact.webLocation[=].url = "https://pubmed.ncbi.nlm.nih.gov/26052687/"
* citedArtifact.webLocation[+].url = "https://doi.org/10.1001/jamainternmed.2015.2152"
* citedArtifact.webLocation[=].classifier = $artifact-url-classifier#doi-based "DOI Based"
* citedArtifact.classification[0].type.coding = $cited-artifact-classification-type#publishing-model "Publishing Model"
* citedArtifact.classification[=].type.coding.userSelected = false
* citedArtifact.classification[=].classifier.coding = $citation-artifact-classifier#Print "Print"
* citedArtifact.classification[=].classifier.coding.userSelected = false
* citedArtifact.classification[+].type = $cited-artifact-classification-type_1#publication-type "Publication type"
* citedArtifact.classification[=].classifier[0].coding = $mesh#D016428 "Journal Article"
* citedArtifact.classification[=].classifier[=].coding.userSelected = false
* citedArtifact.classification[=].classifier[+].coding = $mesh#D017418 "Meta-Analysis"
* citedArtifact.classification[=].classifier[=].coding.userSelected = false
* citedArtifact.classification[=].classifier[+].coding = $mesh#D000078182 "Systematic Review"
* citedArtifact.classification[=].classifier[=].coding.userSelected = false
* citedArtifact.classification[+].type.coding = $cited-artifact-classification-type_1#knowledge-artifact-type "Knowledge Artifact Type"
* citedArtifact.classification[=].type.coding.userSelected = false
* citedArtifact.classification[=].classifier.coding = $citation-artifact-classifier_1#D016428 "Journal Article"
* citedArtifact.classification[=].classifier.coding.userSelected = false
* citedArtifact.classification[=].artifactAssessment.display = "Classifier added by Computable Publishing LLC"
* citedArtifact.classification[+].type.coding = $cited-artifact-classification-type_1#citation-subset "Citation subset"
* citedArtifact.classification[=].type.coding.userSelected = false
* citedArtifact.classification[=].classifier.coding = $elements_descriptions.html_2#IM "IM"
* citedArtifact.classification[=].classifier.coding.userSelected = false
* citedArtifact.contributorship.entry[0].contributor = Reference(contributor0) "Tsoi KK"
* citedArtifact.contributorship.entry[=].contributor.type = "Practitioner"
* citedArtifact.contributorship.entry[=].forenameInitials = "KK"
* citedArtifact.contributorship.entry[=].affiliation.display = "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin2Stanley Ho Big Data Decision Analytics Research Centre, The Chinese University of Hong Kong, Shatin."
* citedArtifact.contributorship.entry[+].contributor = Reference(contributor1) "Chan JY"
* citedArtifact.contributorship.entry[=].contributor.type = "Practitioner"
* citedArtifact.contributorship.entry[=].forenameInitials = "JY"
* citedArtifact.contributorship.entry[=].affiliation.display = "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin."
* citedArtifact.contributorship.entry[+].contributor = Reference(contributor2) "Hirai HW"
* citedArtifact.contributorship.entry[=].contributor.type = "Practitioner"
* citedArtifact.contributorship.entry[=].forenameInitials = "HW"
* citedArtifact.contributorship.entry[=].affiliation.display = "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin2Stanley Ho Big Data Decision Analytics Research Centre, The Chinese University of Hong Kong, Shatin."
* citedArtifact.contributorship.entry[+].contributor = Reference(contributor3) "Wong SY"
* citedArtifact.contributorship.entry[=].contributor.type = "Practitioner"
* citedArtifact.contributorship.entry[=].forenameInitials = "SY"
* citedArtifact.contributorship.entry[=].affiliation.display = "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin."
* citedArtifact.contributorship.entry[+].contributor = Reference(contributor4) "Kwok TC"
* citedArtifact.contributorship.entry[=].contributor.type = "Practitioner"
* citedArtifact.contributorship.entry[=].forenameInitials = "TC"
* citedArtifact.contributorship.entry[=].affiliation.display = "Department of Medicine and Therapeutics, The Chinese University of Hong Kong, Shatin."
* citedArtifact.contributorship.complete = true
* approvalDate = "2015-12-15"
* lastReviewDate = "2025-07-11"
* currentState[0] = $citation-status-type#medline-medline "Medline Citation Status of Medline"
* currentState[+] = $citation-status-type_1#pubmed-publication-status-ppublish "PubMed PublicationStatus of ppublish"
* title = "26052687 Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis."
* identifier[0].type = $v2-0203#ACSN "Accession ID"
* identifier[=].type.text = "FEvIR Object Identifier"
* identifier[=].system = "https://fevir.net/FOI"
* identifier[=].value = "432106"
* identifier[=].assigner.display = "Computable Publishing LLC"
* identifier[+].system = "https://pubmed.ncbi.nlm.nih.gov"
* identifier[=].value = "26052687"
* url = "https://fevir.net/resources/Citation/432106"
* publisher = "Computable Publishing LLC"
* copyright = "https://creativecommons.org/licenses/by-nc-sa/4.0/"
* contact.telecom.system = #email
* contact.telecom.value = "support@computablepublishing.com"
* author.name = "Computable Publishing®: MEDLINE-to-FEvIR Converter"

Instance: contributor0
InstanceOf: Practitioner
Usage: #inline
* name.family = "Tsoi"
* name.given = "Kelvin K F"

Instance: contributor1
InstanceOf: Practitioner
Usage: #inline
* name.family = "Chan"
* name.given = "Joyce Y C"

Instance: contributor2
InstanceOf: Practitioner
Usage: #inline
* name.family = "Hirai"
* name.given = "Hoyee W"

Instance: contributor3
InstanceOf: Practitioner
Usage: #inline
* name.family = "Wong"
* name.given = "Samuel Y S"

Instance: contributor4
InstanceOf: Practitioner
Usage: #inline
* name.family = "Kwok"
* name.given = "Timothy C Y"
