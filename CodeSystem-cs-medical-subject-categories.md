# Medical Subject Categories - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medical Subject Categories**

## CodeSystem: Medical Subject Categories 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-medical-subject-categories | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:MedicalSubjectCategoriesCS |

 
CodeSystem defining values to classify medical subjects into different categories. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [MedicalSubjectCategoriesVS](ValueSet-vs-medical-subject-categories.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-medical-subject-categories",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-medical-subject-categories",
  "version" : "0.2.0",
  "name" : "MedicalSubjectCategoriesCS",
  "title" : "Medical Subject Categories",
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
  "description" : "CodeSystem defining values to classify medical subjects into different categories.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 9,
  "concept" : [
    {
      "code" : "surgical",
      "display" : "Surgical Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Operative Fächer"
        }
      ]
    },
    {
      "code" : "conservative",
      "display" : "Conservative Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Konservative Fächer"
        }
      ]
    },
    {
      "code" : "psychosocial",
      "display" : "Psychosocial Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Psychosoziale Fächer"
        }
      ]
    },
    {
      "code" : "basic-sciences",
      "display" : "Basic Sciences",
      "designation" : [
        {
          "language" : "de",
          "value" : "Grundlagenfächer"
        }
      ]
    },
    {
      "code" : "method-oriented",
      "display" : "Method-Oriented Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Methodenorientierte Fächer"
        }
      ]
    },
    {
      "code" : "clinical-theoretical",
      "display" : "Clinical-Theoretical Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Klinisch-theoretische Fächer"
        }
      ]
    },
    {
      "code" : "ecological",
      "display" : "Ecological and Environmental Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Fächer des ökolog. Stoffgebietes"
        }
      ]
    },
    {
      "code" : "dental",
      "display" : "Dental Medicine Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Zahnmedizinische Fächer"
        }
      ]
    },
    {
      "code" : "other",
      "display" : "Other Disciplines",
      "designation" : [
        {
          "language" : "de",
          "value" : "Sonstige Fächer"
        }
      ]
    }
  ]
}

```
