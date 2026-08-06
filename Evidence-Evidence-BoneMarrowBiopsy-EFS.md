# Evidence: Knochenmarkbiopsie - Ereignisfreies Überleben - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence: Knochenmarkbiopsie - Ereignisfreies Überleben**

## Example Evidence: Evidence: Knochenmarkbiopsie - Ereignisfreies Überleben

Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das ereignisfreie Überleben



## Resource Content

```json
{
  "resourceType" : "Evidence",
  "id" : "Evidence-BoneMarrowBiopsy-EFS",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/outcome-evidence"]
  },
  "status" : "active",
  "variableDefinition" : [{
    "variableRole" : "outcome",
    "observed" : {
      "reference" : "Group/Outcome-EventFreeSurvival"
    },
    "intended" : {
      "reference" : "Group/Outcome-EventFreeSurvival"
    }
  }]
}

```
