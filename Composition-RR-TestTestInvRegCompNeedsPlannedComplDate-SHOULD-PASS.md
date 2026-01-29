# Test: Registered With Planned Completion Date (Should Pass) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Test: Registered With Planned Completion Date (Should Pass)**

## Example Composition: Test: Registered With Planned Completion Date (Should Pass)

Guideline Example



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RR-TestTestInvRegCompNeedsPlannedComplDate-SHOULD-PASS",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ],
    "tag" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-release-type",
        "code" : "class-upgrade",
        "display" : "Class Upgrade"
      }
    ]
  },
  "extension" : [
    {
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date",
      "valueDate" : "2025-03-06"
    }
  ],
  "identifier" : [
    {
      "use" : "official",
      "system" : "https://example.org/identifiers",
      "value" : "AWMF-Guideline-Example"
    }
  ],
  "version" : "2.0",
  "status" : "registered",
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
