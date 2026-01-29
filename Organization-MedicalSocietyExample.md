# Medical Society Example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medical Society Example**

## Example Organization: Medical Society Example

Some Medical Society



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "MedicalSocietyExample",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/medical-society"
    ]
  },
  "extension" : [
    {
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject-category",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-medical-subject-categories",
            "code" : "psychosocial",
            "display" : "Psychosocial Disciplines"
          }
        ]
      }
    },
    {
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject-category",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-medical-subject-categories",
            "code" : "surgical",
            "display" : "Surgical Disciplines"
          }
        ]
      }
    },
    {
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-medical-subject",
      "valueCodeableConcept" : {
        "text" : "Anesthesiology and Intensive Care Medicine"
      }
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/organization-period",
      "valuePeriod" : {
        "start" : "2000-01-01",
        "end" : "2050-12-31"
      }
    }
  ],
  "type" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
          "code" : "medical-society"
        }
      ]
    }
  ],
  "name" : "Example Medical Society",
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.example.org"
        }
      ]
    }
  ]
}

```
