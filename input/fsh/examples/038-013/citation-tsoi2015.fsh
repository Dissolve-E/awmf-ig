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
* status = #active
* citedArtifact.identifier[0].system = "https://pubmed.ncbi.nlm.nih.gov"
* citedArtifact.identifier[=].value = "26052687"
* citedArtifact.identifier[+].system = "https://doi.org"
* citedArtifact.identifier[=].value = "10.1001/jamainternmed.2015.2152"
* citedArtifact.identifier[+].type.text = "pii"
* citedArtifact.identifier[=].value = "2301149"
* citedArtifact.title.text = "Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis."
* citedArtifact.title.type = $title-type#primary "Primary title"
* citedArtifact.publicationForm.publishedIn.type = $published-in-type#D020492 "Periodical"
* citedArtifact.publicationForm.publishedIn.title = "JAMA internal medicine"
* citedArtifact.publicationForm.publishedIn.publisherLocation = "United States"
* citedArtifact.publicationForm.volume = "175"
* citedArtifact.publicationForm.issue = "9"
* citedArtifact.publicationForm.articleDate = "2015-09"
* citedArtifact.publicationForm.pageString = "1450-8"
* citedArtifact.webLocation[0].classifier = $artifact-url-classifier#abstract "Abstract"
* citedArtifact.webLocation[=].url = "https://pubmed.ncbi.nlm.nih.gov/26052687/"
* citedArtifact.webLocation[+].url = "https://doi.org/10.1001/jamainternmed.2015.2152"
* citedArtifact.webLocation[=].classifier = $artifact-url-classifier#doi-based "DOI Based"
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
* title = "Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis."
* publisher = "Computable Publishing LLC"
* copyright = "https://creativecommons.org/licenses/by-nc-sa/4.0/"

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
