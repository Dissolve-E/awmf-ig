# Recommendation Justification Expert Consensus - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Recommendation Justification Expert Consensus**

## Resource Profile: Recommendation Justification Expert Consensus 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-expert-consensus | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:RecommendationJustificationExpertConsensus |

 
A structured assessment of the evidence and consensus that underpins a recommendation based on expert consensus. 

### Guidance

This profile of a FHIR ArtifactAssessment is derived from the [recommendation-justification](http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/recommendation-justification-expert-consensus)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-recommendation-justification-expert-consensus.csv), [Excel](StructureDefinition-recommendation-justification-expert-consensus.xlsx), [Schematron](StructureDefinition-recommendation-justification-expert-consensus.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "recommendation-justification-expert-consensus",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification-expert-consensus",
  "version" : "0.2.0",
  "name" : "RecommendationJustificationExpertConsensus",
  "title" : "Recommendation Justification Expert Consensus",
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
  "description" : "A structured assessment of the evidence and consensus that underpins a recommendation based on expert consensus.",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
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
      "identity" : "objimpl",
      "uri" : "http://hl7.org/fhir/object-implementation",
      "name" : "Object Implementation Information"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "ArtifactAssessment",
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/recommendation-justification",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "ArtifactAssessment",
        "path" : "ArtifactAssessment"
      },
      {
        "id" : "ArtifactAssessment.content:evidenceRating",
        "path" : "ArtifactAssessment.content",
        "sliceName" : "evidenceRating",
        "max" : "0"
      }
    ]
  }
}

```
