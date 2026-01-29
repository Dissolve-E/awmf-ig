# ROBIS Risk of Bias Domains - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ROBIS Risk of Bias Domains**

## CodeSystem: ROBIS Risk of Bias Domains 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-robis-risk-of-bias-domains | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:ROBISRiskOfBiasDomains |

 
CodeSystem representing the domains assessed by the ROBIS tool for evaluating risk of bias in systematic reviews. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [ROBISRiskOfBiasDomainsVS](ValueSet-vs-robis-risk-of-bias-domains.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-robis-risk-of-bias-domains",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-robis-risk-of-bias-domains",
  "version" : "0.2.0",
  "name" : "ROBISRiskOfBiasDomains",
  "title" : "ROBIS Risk of Bias Domains",
  "status" : "active",
  "experimental" : false,
  "date" : "2026-01-29T18:27:10+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [
    {
      "name" : "AWMF e.V.",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org"
        }
      ]
    }
  ],
  "description" : "CodeSystem representing the domains assessed by the ROBIS tool for evaluating risk of bias in systematic reviews.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 4,
  "concept" : [
    {
      "code" : "study_eligibility_criteria",
      "display" : "Study Eligibility Criteria",
      "definition" : "Concerns regarding the specification of study eligibility criteria.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Bedenken im Hinblick auf die Einschlusskriterien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Studienauswahlkriterien"
        }
      ]
    },
    {
      "code" : "identification_selection_studies",
      "display" : "Identification and Selection of Studies",
      "definition" : "Concerns regarding methods used to identify and/or select studies.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Bedenken im Hinblick auf die Identifikation und Auswahl der Studien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Identifizierung und Auswahl der Studien"
        }
      ]
    },
    {
      "code" : "data_collection_study_appraisal",
      "display" : "Data Collection and Study Appraisal",
      "definition" : "Concerns regarding methods used to collect data and appraise studies.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Bedenken im Hinblick auf die Datenextraktion und Bewertung der Studien"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Datenextraktion und kritische Bewertung der Studien"
        }
      ]
    },
    {
      "code" : "synthesis_findings",
      "display" : "Synthesis and Findings",
      "definition" : "Concerns regarding the synthesis and findings of the review.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Bedenken im Hinblick auf die Datensynthese und Ergebnisse"
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Synthese und Ergebnisse"
        }
      ]
    }
  ]
}

```
