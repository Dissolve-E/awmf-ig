# AWMF Guideline S1 Example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AWMF Guideline S1 Example**

## Example Composition: AWMF Guideline S1 Example

AWMF Guideline S1 Example



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "AWMFGuidelineS1Example",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline-record-s1"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/guidelines",
      "value" : "999-999"
    }
  ],
  "version" : "2.0",
  "status" : "final",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
        "code" : "guideline-registry-record",
        "display" : "Guideline Registry Record"
      }
    ]
  },
  "date" : "2025-03-06",
  "author" : [
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "registrant"
              }
            ]
          }
        }
      ],
      "reference" : "PractitionerRole/GuidelineAuthorRoleExample"
    }
  ],
  "title" : "AWMF S1 Example Guideline"
}

```
