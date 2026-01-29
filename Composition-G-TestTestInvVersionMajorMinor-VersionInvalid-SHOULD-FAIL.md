# Test: Version with Prefix (Should Fail) - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Test: Version with Prefix (Should Fail)**

## Example Composition: Test: Version with Prefix (Should Fail)

Test: Version with Prefix



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "G-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL",
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
  "version" : "v2.0",
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
