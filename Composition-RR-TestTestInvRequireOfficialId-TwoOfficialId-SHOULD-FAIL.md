# Test: Two Official Identifiers (Should Fail) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Test: Two Official Identifiers (Should Fail)**

## Example Composition: Test: Two Official Identifiers (Should Fail)

Guideline Example



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RR-TestTestInvRequireOfficialId-TwoOfficialId-SHOULD-FAIL",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "https://example.org/identifiers",
      "value" : "AWMF-Guideline-Example"
    },
    {
      "use" : "official",
      "system" : "https://example.org/identifiers",
      "value" : "AWMF-Guideline-Example2"
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
  "title" : "Example Guideline"
}

```
