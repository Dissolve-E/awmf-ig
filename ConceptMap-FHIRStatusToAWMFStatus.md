# Concept map from concepts from standardized vocabularies (that are not standard OMOP concepts) to Concept IDs of OMOP standard Concepts - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Concept map from concepts from standardized vocabularies (that are not standard OMOP concepts) to Concept IDs of OMOP standard Concepts**

## ConceptMap: Concept map from concepts from standardized vocabularies (that are not standard OMOP concepts) to Concept IDs of OMOP standard Concepts (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/ConceptMap/FHIRStatusToAWMFStatus | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:FHIRStatusToAWMFStatus |

 
This ConceptMap maps values for the workflow status as defined by the AWMF to the required FHIR ValueSet http://hl7.org/fhir/ValueSet/composition-status that is used in a Composition Resource or Profile. 

 
The DISSOLVE-E project develops a digital registry for clinical practice guidelines in Germany. The project is based on current processes coordinated by the Association of the Scientific Medical Societies in Germany (in German: Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften, short: AWMF). This ConceptMap maps values for the workflow status as defined by the AWMF to the required FHIR ValueSet http://hl7.org/fhir/ValueSet/composition-status that is used in a Composition Resource or Profile. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "FHIRStatusToAWMFStatus",
  "url" : "http://fhir.awmf.org/awmf.ig/ConceptMap/FHIRStatusToAWMFStatus",
  "version" : "0.2.0",
  "name" : "FHIRStatusToAWMFStatus",
  "title" : "Concept map from FHIR Composition Status to AWMF Guideline Status",
  "status" : "draft",
  "experimental" : true,
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
  "description" : "This ConceptMap maps values for the workflow status as defined by the AWMF to the required FHIR ValueSet http://hl7.org/fhir/ValueSet/composition-status that is used in a Composition Resource or Profile.",
  "purpose" : "The DISSOLVE-E project develops a digital registry for clinical practice guidelines in Germany. The project is based on current processes coordinated by the Association of the Scientific Medical Societies in Germany (in German: Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften, short: AWMF).\n            This ConceptMap maps values for the workflow status as defined by the AWMF to the required FHIR ValueSet http://hl7.org/fhir/ValueSet/composition-status that is used in a Composition Resource or Profile.",
  "group" : [
    {
      "source" : "http://hl7.org/fhir/composition-status",
      "target" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-status",
      "element" : [
        {
          "code" : "registered",
          "display" : "Registered",
          "target" : [
            {
              "code" : "registered",
              "display" : "Registered",
              "relationship" : "related-to"
            }
          ]
        },
        {
          "code" : "preliminary",
          "display" : "Preliminary",
          "target" : [
            {
              "code" : "preliminary",
              "display" : "Preliminary",
              "relationship" : "related-to"
            }
          ]
        },
        {
          "code" : "final",
          "display" : "Final",
          "target" : [
            {
              "code" : "final",
              "display" : "Final",
              "relationship" : "related-to"
            }
          ]
        },
        {
          "code" : "amended",
          "display" : "Amended",
          "target" : [
            {
              "code" : "amended",
              "display" : "Amended",
              "relationship" : "related-to"
            }
          ]
        },
        {
          "code" : "corrected",
          "display" : "Corrected",
          "target" : [
            {
              "code" : "corrected",
              "display" : "Corrected",
              "relationship" : "related-to"
            }
          ]
        },
        {
          "code" : "cancelled",
          "display" : "Cancelled",
          "target" : [
            {
              "code" : "cancelled",
              "display" : "Cancelled",
              "relationship" : "related-to"
            }
          ]
        },
        {
          "code" : "deprecated",
          "display" : "Deprecated",
          "target" : [
            {
              "code" : "deprecated",
              "display" : "Deprecated",
              "relationship" : "related-to"
            }
          ]
        }
      ]
    }
  ]
}

```
