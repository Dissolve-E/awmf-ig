# Guideline with leading author referencing Organization (passes invariant) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline with leading author referencing Organization (passes invariant)**

## Example Composition: Guideline with leading author referencing Organization (passes invariant)

Profile: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

**identifier**: `http://fhir.awmf.org/guidelines`/888-003 (use: official, )

**version**: 1.0

**status**: Final

**type**: Guideline Registry Record

**date**: 2025-06-17

**author**: 

* [Organization Deutsche Gesellschaft für Anästhesiologie und Intensivmedizin e.V. (DGAI)](Organization-DGAI.md)
* [Organization Deutsche Gesellschaft für Chirurgie e.V. (DGCH)](Organization-DGCH.md)

**title**: Leading Author Organization Pass



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RR-TestInvLeadingAuthorRefOrganization-SHOULD-PASS",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/guidelines",
      "value" : "888-003"
    }
  ],
  "version" : "1.0",
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
  "date" : "2025-06-17",
  "author" : [
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "leading"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGAI"
    },
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
      "reference" : "Organization/DGCH"
    }
  ],
  "title" : "Leading Author Organization Pass"
}

```
