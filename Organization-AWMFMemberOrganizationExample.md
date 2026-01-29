# AWMF Member Organization Example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AWMF Member Organization Example**

## Example Organization: AWMF Member Organization Example

AWMF Member Organization Example



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "AWMFMemberOrganizationExample",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization"
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
      "extension" : [
        {
          "url" : "brandLogo",
          "valueUrl" : "https://www.example.org/logo.png"
        }
      ],
      "url" : "http://hl7.org/fhir/StructureDefinition/organization-brand"
    }
  ],
  "identifier" : [
    {
      "system" : "http://fhir.awmf.org/association",
      "value" : "-1"
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
  "name" : "Example AWMF Member Organization",
  "alias" : ["Chirurgie.Example"],
  "contact" : [
    {
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.example.org"
        }
      ]
    }
  ],
  "qualification" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
            "code" : "awmf-member-organization"
          }
        ]
      }
    }
  ]
}

```
