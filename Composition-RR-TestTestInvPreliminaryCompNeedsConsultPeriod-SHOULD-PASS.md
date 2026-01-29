# Test: Preliminary With Consultation Period (Should Pass) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Test: Preliminary With Consultation Period (Should Pass)**

## Example Composition: Test: Preliminary With Consultation Period (Should Pass)

Guideline Example



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RR-TestTestInvPreliminaryCompNeedsConsultPeriod-SHOULD-PASS",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ]
  },
  "extension" : [
    {
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period",
      "valuePeriod" : {
        "start" : "2025-03-06",
        "end" : "2025-03-07"
      }
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
  "status" : "preliminary",
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
