// Identifier namespaces of the AWMF registry. Declaring them as NamingSystems documents
// them and lets the validator resolve identifier.system values that use them.

Instance: awmf-register-number
InstanceOf: NamingSystem
Usage: #definition
Title: "AWMF Register Number"
Description: "Identifier namespace for the register number the AWMF assigns to a guideline, e.g. 020-013."
* url = "http://fhir.awmf.org/awmf.ig/NamingSystem/awmf-register-number"
* name = "AWMFRegisterNumber"
* status = #active
* kind = #identifier
* date = "2026-10-15"
* publisher = "AWMF e.V."
* responsible = "AWMF e.V."
* description = "Identifier namespace for the register number the AWMF assigns to a guideline, e.g. 020-013."
* uniqueId[+]
  * type = #uri
  * value = "http://fhir.awmf.org/guidelines"
  * preferred = true

Instance: awmf-association-number
InstanceOf: NamingSystem
Usage: #definition
Title: "AWMF Association Number"
Description: "Identifier namespace for the number the AWMF assigns to its member societies and associated organizations."
* url = "http://fhir.awmf.org/awmf.ig/NamingSystem/awmf-association-number"
* name = "AWMFAssociationNumber"
* status = #active
* kind = #identifier
* date = "2026-10-15"
* publisher = "AWMF e.V."
* responsible = "AWMF e.V."
* description = "Identifier namespace for the number the AWMF assigns to its member societies and associated organizations."
* uniqueId[+]
  * type = #uri
  * value = "http://fhir.awmf.org/association"
  * preferred = true
