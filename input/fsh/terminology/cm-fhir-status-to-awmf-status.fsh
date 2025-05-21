Instance: FHIRStatusToAWMFStatus
InstanceOf: ConceptMap
Usage: #example
Title: "Concept map from concepts from standardized vocabularies (that are not standard OMOP concepts) to Concept IDs of OMOP standard Concepts"
Description: "Concept map from concepts from standardized vocabularies that are not labelled as 'standard' in Athena – OHDSI Vocabularies Repository to Concept IDs from 'standard' concepts"
* version = "0.0.1"
* status = #draft
* purpose = """The DISSOLVE-E project develops a digital registry for clinical practice guidelines in Germany. The project is based on current processes coordinated by the Association of the Scientific Medical Societies in Germany (in German: Arbeitsgemeinschaft der Wissenschaftlichen Medizinischen Fachgesellschaften, short: AWMF).
            This ConceptMap maps values for the workflow status as defined by the AWMF to the required FHIR ValueSet http://hl7.org/fhir/ValueSet/composition-status that is used in a Composition Resource or Profile."""
* group[+]
  * source = $cs-composition-status
  * target = Canonical(cs-awmf-guideline-status)
  * element[+]
    * code = #registered
    * display = "Registered"
    * target[+]
      * code = #registered
      * display = "Registered"
      * relationship = $cs-cm-relationship#related-to "Equivalent"
  * element[+]
    * code = #preliminary
    * display = "Preliminary"
    * target[+]
      * code = #preliminary
      * display = "Preliminary"
      * relationship = $cs-cm-relationship#related-to "Equivalent"
  * element[+]
    * code = #final
    * display = "Final"
    * target[+]
      * code = #final
      * display = "Final"
      * relationship = $cs-cm-relationship#related-to "Equivalent"
  * element[+]
    * code = #amended
    * display = "Amended"
    * target[+]
      * code = #amended
      * display = "Amended"
      * relationship = $cs-cm-relationship#related-to "Equivalent"
  * element[+]
    * code = #corrected
    * display = "Corrected"
    * target[+]
      * code = #corrected
      * display = "Corrected"
      * relationship = $cs-cm-relationship#related-to "Equivalent"
  * element[+]
    * code = #cancelled
    * display = "Cancelled"
    * target[+]
      * code = #cancelled
      * display = "Cancelled"
      * relationship = $cs-cm-relationship#related-to "Equivalent"
  * element[+]
    * code = #deprecated
    * display = "Deprecated"
    * target[+]
      * code = #deprecated
      * display = "Deprecated"
      * relationship = $cs-cm-relationship#related-to "Equivalent"