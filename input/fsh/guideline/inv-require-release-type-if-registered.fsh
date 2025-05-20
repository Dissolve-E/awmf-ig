Invariant: inv-require-release-type-if-registered
Description: "If status = #registered, meta.tag[guideline-releaseType] SHALL be present and drawn from vs-guideline-release-type."
Expression: "(status != 'registered') or
            (meta.tag.where(code.memberOf('http://fhir.awmf.org/awmf.ig/ValueSet/vs-guideline-release-type')).exists())"
Severity: #error
