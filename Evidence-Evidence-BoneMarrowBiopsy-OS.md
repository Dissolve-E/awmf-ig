# Evidence: Knochenmarkbiopsie - Gesamtüberleben - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Evidence: Knochenmarkbiopsie - Gesamtüberleben**

## Example Evidence: Evidence: Knochenmarkbiopsie - Gesamtüberleben

Evidenz zum Einfluss von Knochenmarkbiopsie vs. PET/CT-Staging auf das Gesamtüberleben



## Resource Content

```json
{
  "resourceType" : "Evidence",
  "id" : "Evidence-BoneMarrowBiopsy-OS",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/outcome-evidence"]
  },
  "status" : "active",
  "variableDefinition" : [{
    "variableRole" : "outcome",
    "observed" : {
      "reference" : "Group/Outcome-OverallSurvival"
    },
    "intended" : {
      "reference" : "Group/Outcome-OverallSurvival"
    }
  }]
}

```
