# Guideline Author Role Example - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline Author Role Example**

## Example PractitionerRole: Guideline Author Role Example

Guideline Author Role Example



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "GuidelineAuthorRoleExample",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role"
    ]
  },
  "period" : {
    "start" : "2022-08-01",
    "end" : "2023-12-31"
  },
  "practitioner" : {
    "reference" : "Practitioner/GuidelineAuthorExample"
  },
  "organization" : {
    "reference" : "Organization/AWMFMemberOrganizationExample"
  },
  "code" : [
    {
      "text" : "Coordinaion and scientific leadership"
    }
  ]
}

```
