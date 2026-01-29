# Body System Conditions - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Body System Conditions**

## CodeSystem: Body System Conditions 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-body-systems-conditions | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:BodySystemConditionsCS |

 
CodeSystem representing various body system conditions. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [BodySystemConditionsVS](ValueSet-vs-body-system-conditions.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-body-systems-conditions",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-body-systems-conditions",
  "version" : "0.2.0",
  "name" : "BodySystemConditionsCS",
  "title" : "Body System Conditions",
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
  "description" : "CodeSystem representing various body system conditions.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 14,
  "concept" : [
    {
      "code" : "respiratory",
      "display" : "Respiratory System and Lungs",
      "designation" : [
        {
          "language" : "de",
          "value" : "Atemwege und Lunge"
        }
      ]
    },
    {
      "code" : "nervous",
      "display" : "Brain and Nerves",
      "designation" : [
        {
          "language" : "de",
          "value" : "Gehirn und Nerven"
        }
      ]
    },
    {
      "code" : "skin",
      "display" : "Skin and Hair",
      "designation" : [
        {
          "language" : "de",
          "value" : "Haut und Haare"
        }
      ]
    },
    {
      "code" : "cardiovascular",
      "display" : "Heart and Circulatory System",
      "designation" : [
        {
          "language" : "de",
          "value" : "Herz und Kreislauf"
        }
      ]
    },
    {
      "code" : "extremities",
      "display" : "Hands and Feet",
      "designation" : [
        {
          "language" : "de",
          "value" : "Hände und Füße"
        }
      ]
    },
    {
      "code" : "musculoskeletal",
      "display" : "Bones and Joints",
      "designation" : [
        {
          "language" : "de",
          "value" : "Knochen und Gelenke"
        }
      ]
    },
    {
      "code" : "headneck",
      "display" : "Head and Neck",
      "designation" : [
        {
          "language" : "de",
          "value" : "Kopf und Hals"
        }
      ]
    },
    {
      "code" : "oncology",
      "display" : "Cancer Conditions",
      "designation" : [
        {
          "language" : "de",
          "value" : "Krebserkrankungen"
        }
      ]
    },
    {
      "code" : "mentalhealth",
      "display" : "Mental Health",
      "designation" : [
        {
          "language" : "de",
          "value" : "Psyche"
        }
      ]
    },
    {
      "code" : "pain",
      "display" : "Pain Conditions",
      "designation" : [
        {
          "language" : "de",
          "value" : "Schmerzen"
        }
      ]
    },
    {
      "code" : "miscellaneous",
      "display" : "Other Conditions",
      "designation" : [
        {
          "language" : "de",
          "value" : "Sonstige Krankheitsbilder"
        }
      ]
    },
    {
      "code" : "metabolic",
      "display" : "Metabolic Disorders",
      "designation" : [
        {
          "language" : "de",
          "value" : "Stoffwechsel-Erkrankungen"
        }
      ]
    },
    {
      "code" : "digestive",
      "display" : "Digestive and Urinary Organs",
      "designation" : [
        {
          "language" : "de",
          "value" : "Verdauungs- und Harnorgane"
        }
      ]
    },
    {
      "code" : "dental",
      "display" : "Teeth",
      "designation" : [
        {
          "language" : "de",
          "value" : "Zähne"
        }
      ]
    }
  ]
}

```
