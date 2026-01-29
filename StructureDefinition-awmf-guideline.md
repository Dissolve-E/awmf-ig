# Guideline - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Guideline**

## Resource Profile: Guideline 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:AWMFGuideline |

 
Clinical Practice Guideline 

### Guidance

#### Representing AWMF Quality Assurance Assessment and Provenance

To document the quality assurance process carried out by the AWMF, we use the `attester` element in the `Guideline` profile. This structure enables linking the attesting party (the AWMF) and specifying their role in the guideline publication process.

The profile includes a named slice `attester[AWMF]` to record the attestation by the AWMF:

* `attester.mode` is set to `official`, indicating that the guideline has been formally attested by an authoritative body.
* `attester.party.reference` must point to the AWMF organization resource (typically `"Organization/AWMF"`).
* Standard FHIR elements `date` and `dateElement` can be used to record the date of attestation.

Example: Attestation by AWMF

```
* attester[AWMF]
  * mode = $cs-composition-attestation-mode#official
  * party.reference = "Organization/AWMF"
  * time = "2025-03-06T00:00:00+01:00"

```

This example shows a guideline that was officially attested by the AWMF on March 6, 2025.

This profile of a FHIR Composition is derived from the [guideline](http://hl7.org/fhir/uv/ebm/StructureDefinition/guideline) FHIR resource.

**Usages:**

* Examples for this Profile: [Composition/Demenzen](Composition-Demenzen.md), [Composition/G-TestTestInvRequireOfficialIdentifier-NoOfficialId-SHOULD-FAIL](Composition-G-TestTestInvRequireOfficialIdentifier-NoOfficialId-SHOULD-FAIL.md), [Composition/G-TestTestInvRequireOfficialIdentifier-TwoOfficialId-SHOULD-FAIL](Composition-G-TestTestInvRequireOfficialIdentifier-TwoOfficialId-SHOULD-FAIL.md), [Composition/G-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL](Composition-G-TestTestInvVersionMajorMinor-VersionInvalid-SHOULD-FAIL.md)... Show 4 more, [Composition/G-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL](Composition-G-TestTestInvVersionMajorMinor-VersionInvalid2-SHOULD-FAIL.md), [Composition/G-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL](Composition-G-TestTestInvVersionMajorMinor-VersionPatch-SHOULD-FAIL.md), [Composition/GuidelineExample](Composition-GuidelineExample.md) and [Composition/NosokomialePneumonie](Composition-NosokomialePneumonie.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/awmf-guideline)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-awmf-guideline.csv), [Excel](StructureDefinition-awmf-guideline.xlsx), [Schematron](StructureDefinition-awmf-guideline.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "awmf-guideline",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline",
  "version" : "0.2.0",
  "name" : "AWMFGuideline",
  "title" : "Guideline",
  "status" : "draft",
  "date" : "2026-01-29T18:27:10+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [
    {
      "name" : "AWMF e.V.",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org"
        }
      ]
    }
  ],
  "description" : "Clinical Practice Guideline",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "workflow",
      "uri" : "http://hl7.org/fhir/workflow",
      "name" : "Workflow Pattern"
    },
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "cda",
      "uri" : "http://hl7.org/v3/cda",
      "name" : "CDA (R2)"
    },
    {
      "identity" : "fhirdocumentreference",
      "uri" : "http://hl7.org/fhir/documentreference",
      "name" : "FHIR DocumentReference"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Composition",
  "baseDefinition" : "http://hl7.org/fhir/uv/ebm/StructureDefinition/guideline",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Composition",
        "path" : "Composition",
        "constraint" : [
          {
            "key" : "inv-require-official-identifier",
            "severity" : "error",
            "human" : "Every Guideline/Recommendation must have exactly one official identifier (with use = #official)",
            "expression" : "identifier.where(use='official').count() = 1",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline"
          }
        ]
      },
      {
        "id" : "Composition.language",
        "path" : "Composition.language",
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:versionAlgorithm",
        "path" : "Composition.extension",
        "sliceName" : "versionAlgorithm"
      },
      {
        "id" : "Composition.extension:versionAlgorithm.value[x]:valueCoding",
        "path" : "Composition.extension.value[x]",
        "sliceName" : "valueCoding",
        "type" : [
          {
            "code" : "Coding"
          }
        ],
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
          "code" : "major-minor",
          "display" : "Major-Minor Versioning"
        }
      },
      {
        "id" : "Composition.extension:firstPublicationDate",
        "path" : "Composition.extension",
        "sliceName" : "firstPublicationDate",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:submissionDate",
        "path" : "Composition.extension",
        "sliceName" : "submissionDate",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:consultationPeriod",
        "path" : "Composition.extension",
        "sliceName" : "consultationPeriod",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:plannedCompletionDate",
        "path" : "Composition.extension",
        "sliceName" : "plannedCompletionDate",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.extension:registrationDate",
        "path" : "Composition.extension",
        "sliceName" : "registrationDate",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "Composition.identifier",
        "path" : "Composition.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.identifier:awmf-register-number",
        "path" : "Composition.identifier",
        "sliceName" : "awmf-register-number",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Composition.identifier:awmf-register-number.system",
        "path" : "Composition.identifier.system",
        "min" : 1,
        "patternUri" : "http://fhir.awmf.org/guidelines"
      },
      {
        "id" : "Composition.identifier:awmf-register-number.value",
        "path" : "Composition.identifier.value",
        "min" : 1
      },
      {
        "id" : "Composition.version",
        "path" : "Composition.version",
        "min" : 1,
        "constraint" : [
          {
            "key" : "inv-version-major-minor",
            "severity" : "error",
            "human" : "Version must be a major-minor version (e.g. 5.1)",
            "expression" : "$this.matches('^[0-9]+\\\\.[0-9]+$')",
            "source" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-guideline"
          }
        ]
      },
      {
        "id" : "Composition.status",
        "path" : "Composition.status",
        "definition" : "Workflow status of the guideline from registration to publication or deprecation. Please note that the ValueSet 'http://hl7.org/fhir/ValueSet/composition-status' is required; We therefore created the ConceptMap 'FHIRStatusToAWMFStatus' to store the mapping to the AWMF status values."
      },
      {
        "id" : "Composition.date",
        "path" : "Composition.date",
        "short" : "Modification Date",
        "definition" : "Modification date of the Composition contents. Does not represent the publication, last review or approval date."
      },
      {
        "id" : "Composition.title",
        "path" : "Composition.title",
        "definition" : "Title of the Guideline"
      },
      {
        "id" : "Composition.section",
        "path" : "Composition.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code.coding"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section.code",
        "path" : "Composition.section.code",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-sections"
        }
      },
      {
        "id" : "Composition.section:summary",
        "path" : "Composition.section",
        "sliceName" : "summary"
      },
      {
        "id" : "Composition.section:summary.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "summary",
              "display" : "Summary"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:summary.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction",
        "path" : "Composition.section",
        "sliceName" : "introduction"
      },
      {
        "id" : "Composition.section:introduction.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "introduction",
              "display" : "Introduction"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:introduction.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion",
        "path" : "Composition.section",
        "sliceName" : "discussion"
      },
      {
        "id" : "Composition.section:discussion.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "discussion",
              "display" : "Discussion"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:discussion.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods",
        "path" : "Composition.section",
        "sliceName" : "methods"
      },
      {
        "id" : "Composition.section:methods.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "methods",
              "display" : "Methods"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:methods.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references",
        "path" : "Composition.section",
        "sliceName" : "references"
      },
      {
        "id" : "Composition.section:references.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "references",
              "display" : "References"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:references.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests",
        "path" : "Composition.section",
        "sliceName" : "competingInterests"
      },
      {
        "id" : "Composition.section:competingInterests.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "competing-interests",
              "display" : "Competing Interests"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:competingInterests.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements",
        "path" : "Composition.section",
        "sliceName" : "acknowledgements"
      },
      {
        "id" : "Composition.section:acknowledgements.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "acknowledgements",
              "display" : "Acknowledgements"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:acknowledgements.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices",
        "path" : "Composition.section",
        "sliceName" : "appendices"
      },
      {
        "id" : "Composition.section:appendices.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "appendices",
              "display" : "Appendices"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:appendices.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol",
        "path" : "Composition.section",
        "sliceName" : "consensusProtocol",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:consensusProtocol.code",
        "path" : "Composition.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "consensus-protocol",
              "display" : "Consensus Protocol"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "consensus-protocol",
          "display" : "Consensus Protocol"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:consensusProtocol.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text",
        "path" : "Composition.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*"
      },
      {
        "id" : "Composition.section:text.code",
        "path" : "Composition.section.code",
        "min" : 1
      },
      {
        "id" : "Composition.section:text.code.coding",
        "path" : "Composition.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section",
        "path" : "Composition.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:language",
        "path" : "Composition.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:language.extension",
        "path" : "Composition.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:language.extension:language",
        "path" : "Composition.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:language.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:language.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:language.section",
        "path" : "Composition.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text",
        "path" : "Composition.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.code",
        "path" : "Composition.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.code.coding",
        "path" : "Composition.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section",
        "path" : "Composition.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:language",
        "path" : "Composition.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text.section:text",
        "path" : "Composition.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:language",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "language",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:language.extension:language",
        "path" : "Composition.section.section.section.section.section.section.section.section.extension",
        "sliceName" : "language",
        "min" : 1,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language"
            ]
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
              "code" : "language",
              "display" : "Language"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:language.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
          "code" : "language",
          "display" : "Language"
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:language.section",
        "path" : "Composition.section.section.section.section.section.section.section.section.section",
        "max" : "0"
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:text",
        "path" : "Composition.section.section.section.section.section.section.section.section",
        "sliceName" : "text",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "BackboneElement"
          }
        ]
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code",
        "path" : "Composition.section.section.section.section.section.section.section.section.code",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "https://fevir.net/resources/CodeSystem/179423",
              "code" : "text",
              "display" : "Text"
            }
          ]
        }
      },
      {
        "id" : "Composition.section:text.section:text.section:text.section:text.section:text.section:text.section:text.section:text.code.coding",
        "path" : "Composition.section.section.section.section.section.section.section.section.code.coding",
        "min" : 1,
        "max" : "1",
        "patternCoding" : {
          "system" : "https://fevir.net/resources/CodeSystem/179423",
          "code" : "text",
          "display" : "Text"
        }
      }
    ]
  }
}

```
