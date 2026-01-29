# Citation Systematic Review - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Citation Systematic Review**

## Example Citation: Citation Systematic Review

| |
| :--- |
| Active as of 2026-01-29 |

**url**: [Citation Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis.](Citation-CitationSystematicReviewTsoi2015.md)

**version**: 0.2.0

**title**: Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis.

**status**: Active

**date**: 2026-01-29 18:27:10+0000

**publisher**: AWMF e.V.

**contact**: AWMF e.V.: [https://www.awmf.org](https://www.awmf.org)

**copyright**: 

https://creativecommons.org/licenses/by-nc-sa/4.0/

**approvalDate**: 2015-12-15

**lastReviewDate**: 2025-07-11

> **citedArtifact****identifier**: `https://pubmed.ncbi.nlm.nih.gov`/26052687, `https://doi.org`/10.1001/jamainternmed.2015.2152, pii/2301149

### Titles

| | | |
| :--- | :--- | :--- |
| - | **Type** | **Text** |
| * | Primary title | Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis. |

> **publicationForm**

### PublishedIns

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Type** | **Title** | **PublisherLocation** |
| * | Periodical | JAMA internal medicine | United States |

**volume**: 175**issue**: 9**articleDate**: 2015-09**pageString**: 1450-8

> **webLocation****classifier**: Abstract**url**: [https://pubmed.ncbi.nlm.nih.gov/26052687/](https://pubmed.ncbi.nlm.nih.gov/26052687/)

> **webLocation****classifier**: DOI Based**url**: [https://doi.org/10.1001/jamainternmed.2015.2152](https://doi.org/10.1001/jamainternmed.2015.2152)

> **contributorship****complete**: true
> **entry****contributor**: [Tsoi KK](Practitioner-contributor0.md)**forenameInitials**: KK**affiliation**: School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin2Stanley Ho Big Data Decision Analytics Research Centre, The Chinese University of Hong Kong, Shatin.

> **entry****contributor**: [Chan JY](Practitioner-contributor1.md)**forenameInitials**: JY**affiliation**: School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin.

> **entry****contributor**: [Hirai HW](Practitioner-contributor2.md)**forenameInitials**: HW**affiliation**: School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin2Stanley Ho Big Data Decision Analytics Research Centre, The Chinese University of Hong Kong, Shatin.

> **entry****contributor**: [Wong SY](Practitioner-contributor3.md)**forenameInitials**: SY**affiliation**: School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin.

> **entry****contributor**: [Kwok TC](Practitioner-contributor4.md)**forenameInitials**: TC**affiliation**: Department of Medicine and Therapeutics, The Chinese University of Hong Kong, Shatin.




## Resource Content

```json
{
  "resourceType" : "Citation",
  "id" : "CitationSystematicReviewTsoi2015",
  "url" : "http://fhir.awmf.org/awmf.ig/Citation/CitationSystematicReviewTsoi2015",
  "version" : "0.2.0",
  "title" : "Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis.",
  "status" : "active",
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
  "copyright" : "https://creativecommons.org/licenses/by-nc-sa/4.0/",
  "approvalDate" : "2015-12-15",
  "lastReviewDate" : "2025-07-11",
  "citedArtifact" : {
    "identifier" : [
      {
        "system" : "https://pubmed.ncbi.nlm.nih.gov",
        "value" : "26052687"
      },
      {
        "system" : "https://doi.org",
        "value" : "10.1001/jamainternmed.2015.2152"
      },
      {
        "type" : {
          "text" : "pii"
        },
        "value" : "2301149"
      }
    ],
    "title" : [
      {
        "type" : [
          {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/title-type",
                "code" : "primary",
                "display" : "Primary title"
              }
            ]
          }
        ],
        "text" : "Cognitive Tests to Detect Dementia: A Systematic Review and Meta-analysis."
      }
    ],
    "publicationForm" : [
      {
        "publishedIn" : {
          "type" : {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/published-in-type",
                "code" : "D020492",
                "display" : "Periodical"
              }
            ]
          },
          "title" : "JAMA internal medicine",
          "publisherLocation" : "United States"
        },
        "volume" : "175",
        "issue" : "9",
        "articleDate" : "2015-09",
        "pageString" : "1450-8"
      }
    ],
    "webLocation" : [
      {
        "classifier" : [
          {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/artifact-url-classifier",
                "code" : "abstract",
                "display" : "Abstract"
              }
            ]
          }
        ],
        "url" : "https://pubmed.ncbi.nlm.nih.gov/26052687/"
      },
      {
        "classifier" : [
          {
            "coding" : [
              {
                "system" : "http://hl7.org/fhir/artifact-url-classifier",
                "code" : "doi-based",
                "display" : "DOI Based"
              }
            ]
          }
        ],
        "url" : "https://doi.org/10.1001/jamainternmed.2015.2152"
      }
    ],
    "contributorship" : {
      "complete" : true,
      "entry" : [
        {
          "contributor" : {
            "reference" : "Practitioner/contributor0",
            "type" : "Practitioner",
            "display" : "Tsoi KK"
          },
          "forenameInitials" : "KK",
          "affiliation" : [
            {
              "display" : "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin2Stanley Ho Big Data Decision Analytics Research Centre, The Chinese University of Hong Kong, Shatin."
            }
          ]
        },
        {
          "contributor" : {
            "reference" : "Practitioner/contributor1",
            "type" : "Practitioner",
            "display" : "Chan JY"
          },
          "forenameInitials" : "JY",
          "affiliation" : [
            {
              "display" : "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin."
            }
          ]
        },
        {
          "contributor" : {
            "reference" : "Practitioner/contributor2",
            "type" : "Practitioner",
            "display" : "Hirai HW"
          },
          "forenameInitials" : "HW",
          "affiliation" : [
            {
              "display" : "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin2Stanley Ho Big Data Decision Analytics Research Centre, The Chinese University of Hong Kong, Shatin."
            }
          ]
        },
        {
          "contributor" : {
            "reference" : "Practitioner/contributor3",
            "type" : "Practitioner",
            "display" : "Wong SY"
          },
          "forenameInitials" : "SY",
          "affiliation" : [
            {
              "display" : "School of Public Health and Primary Care, The Chinese University of Hong Kong, Shatin."
            }
          ]
        },
        {
          "contributor" : {
            "reference" : "Practitioner/contributor4",
            "type" : "Practitioner",
            "display" : "Kwok TC"
          },
          "forenameInitials" : "TC",
          "affiliation" : [
            {
              "display" : "Department of Medicine and Therapeutics, The Chinese University of Hong Kong, Shatin."
            }
          ]
        }
      ]
    }
  }
}

```
