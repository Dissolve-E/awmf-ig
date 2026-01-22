// This RuleSet should be applied to every ValueSet definition.
// It ensures compliance with best practice recommendations by setting
// `experimental`, which is strongly recommended in the
// FHIR specification (e.g., constraints like the ShareableValueSet profile).
RuleSet: rs-valueset-meta
* ^experimental = false
