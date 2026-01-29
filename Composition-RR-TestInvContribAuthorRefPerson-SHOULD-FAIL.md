# Guideline with contributing author referencing Practitioner (fails invariant) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline with contributing author referencing Practitioner (fails invariant)**

## Example Composition: Guideline with contributing author referencing Practitioner (fails invariant)

Profile: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

**identifier**: `http://fhir.awmf.org/guidelines`/888-002 (use: official, )

**version**: 1.0

**status**: Final

**type**: Guideline Registry Record

**date**: 2025-06-17

**author**: [PractitionerRole ](PractitionerRole-GuidelineAuthorRoleExample.md)

**title**: Contributing Author Practitioner Fail



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "RR-TestInvContribAuthorRefPerson-SHOULD-FAIL",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/guidelines",
      "value" : "888-002"
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
                "code" : "registrant"
              }
            ]
          }
        }
      ],
      "reference" : "PractitionerRole/GuidelineAuthorRoleExample"
    }
  ],
  "title" : "Contributing Author Practitioner Fail"
}

```
