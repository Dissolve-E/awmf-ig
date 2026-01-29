# Related Artifact Types - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Related Artifact Types**

## CodeSystem: Related Artifact Types 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RelatedArtifactTypes |

 
CodeSystem defining types of related artifacts that can be part of a guideline. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [DisseminationWebsite](ValueSet-vs-dissemination-website.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-related-artifact-types",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
  "version" : "0.2.0",
  "name" : "RelatedArtifactTypes",
  "title" : "Related Artifact Types",
  "status" : "active",
  "experimental" : false,
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
  "description" : "CodeSystem defining types of related artifacts that can be part of a guideline.",
  "caseSensitive" : false,
  "hierarchyMeaning" : "is-a",
  "content" : "complete",
  "count" : 8,
  "concept" : [
    {
      "code" : "related-guideline",
      "display" : "Related Guideline",
      "designation" : [
        {
          "language" : "de",
          "value" : "Verwandte Leitlinie"
        }
      ]
    },
    {
      "code" : "app",
      "display" : "Mobile App",
      "designation" : [
        {
          "language" : "de",
          "value" : "Mobile App"
        }
      ]
    },
    {
      "code" : "update-registration",
      "display" : "Registration of an Update of the Guideline",
      "designation" : [
        {
          "language" : "de",
          "value" : "Anmeldung eines Leitlinien-Updates"
        }
      ]
    },
    {
      "code" : "scientific-publication",
      "display" : "Scientific Publication",
      "designation" : [
        {
          "language" : "de",
          "value" : "Wissenschaftliche Veröffentlichung"
        }
      ]
    },
    {
      "code" : "dissemination-website",
      "display" : "Dissemination Website",
      "definition" : "A website that disseminates the guideline in a human readable format.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Eine Website, die die Leitlinie in einem für Menschen lesbaren Format verbreitet."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Webseite zur Verbreitung"
        },
        {
          "language" : "de",
          "value" : "Detailseite auf der AWMF Webseite"
        },
        {
          "language" : "de",
          "value" : "Seite der Medizinischen Fachgesellschaft"
        }
      ],
      "concept" : [
        {
          "code" : "awmf-detail-page",
          "display" : "Detail Page on AWMF Website"
        },
        {
          "code" : "medical-society-page",
          "display" : "Page of the Medical Society"
        }
      ]
    },
    {
      "code" : "patient-information",
      "display" : "Patient-Facing Information",
      "definition" : "Supplementary material targeted at patients, derived from or related to the guideline.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Zusätzliche Materialien, die sich an Patient*innen richten und auf der Leitlinie basieren oder mit ihr in Zusammenhang stehen."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Patientenorientierte Information"
        }
      ]
    }
  ]
}

```
