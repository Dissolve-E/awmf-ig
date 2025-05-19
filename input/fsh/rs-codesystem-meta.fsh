// This RuleSet should be applied to every CodeSystem definition.
// It ensures compliance with best practice recommendations by setting
// `caseSensitive` and `experimental`, which are strongly recommended in the
// FHIR specification (e.g., constraints like csd-7 and the ShareableCodeSystem profile).
RuleSet: rs-codesystem-meta
* ^caseSensitive = false
* ^experimental = false
