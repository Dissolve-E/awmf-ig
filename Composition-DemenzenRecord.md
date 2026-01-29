# S3-Leitlinie Demenzen Living Guideline - Record - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **S3-Leitlinie Demenzen Living Guideline - Record**

## Example Composition: S3-Leitlinie Demenzen Living Guideline - Record

Profile: [Guideline Registry Record](StructureDefinition-guideline-registry-record.md)

**identifier**: `http://fhir.awmf.org/guidelines`/038-013 (use: official, )

**version**: 5.2

**status**: Final

**type**: Guideline Registry Record

**date**: 2025-07-17

**author**: [Organization Deutsche Gesellschaft für Psychiatrie und Psychotherapie, Psychosomatik und Nervenheilkunde e. V. (DGPPN)](Organization-DGPPN.md)

**title**: Demenzen



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "DemenzenRecord",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/guidelines",
      "value" : "038-013"
    }
  ],
  "version" : "5.2",
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
  "date" : "2025-07-17",
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
        },
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
      "reference" : "Organization/DGPPN"
    }
  ],
  "title" : "Demenzen"
}

```
