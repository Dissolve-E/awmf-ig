# Test: Version as Text (Should Fail) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Test: Version as Text (Should Fail)**

## Example Composition: Test: Version as Text (Should Fail)

Test: Version as Text



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "G-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline"
    ]
  },
  "identifier" : [
    {
      "use" : "official",
      "system" : "https://example.org/identifiers",
      "value" : "AWMF-Guideline-Example"
    }
  ],
  "version" : "zweiteVersion",
  "status" : "final",
  "type" : {
    "coding" : [
      {
        "system" : "https://fevir.net/resources/CodeSystem/179423",
        "code" : "Guideline",
        "display" : "Guideline"
      }
    ]
  },
  "date" : "2025-03-06",
  "author" : [
    {
      "reference" : "Practitioner/GuidelineAuthorExample"
    }
  ],
  "title" : "Example Guideline"
}

```
