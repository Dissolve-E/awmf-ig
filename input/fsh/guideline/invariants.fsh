Invariant: registered-composition-needs-planned-completion-date
Description: "If status = #registered, extension[plannedCompletionDate] SHALL be present."
Expression: "(status != 'registered') or
            (extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date').value.exists())"
Severity: #error

Invariant: preliminary-composition-needs-consultation-period
Description: "If status = #preliminary, extension[consultationPeriod] SHALL be present."
Expression: "(status != 'preliminary') or
            (extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period').value.exists())"
Severity: #error

Invariant: author-registrant-singleton
Description: "Exactly one author SHALL have the role “registrant”."
Expression: "author.extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role')
             .value.ofType(CodeableConcept).coding.where(code = 'registrant').count() = 1"
Severity: #error

Invariant: author-leading-vs-contributing-exclusive
Description: "No single author SHALL simultaneously have the roles “leading” and “contributing”."
Expression: "author.all(
              extension('http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role')
              .value.ofType(CodeableConcept).coding.code
              .where($this = 'leading' or $this = 'contributing')
              .count() <= 1          /* each author may have 0 or 1 of those roles */
            )"
Severity: #error

Invariant: author-leading-contributing-organization
Description: "Authors with role “leading” or “contributing” SHALL reference an Organization."
Expression: "
  author.where(
    extension(
      'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role'
    ).value.ofType(CodeableConcept).coding.where(code = 'leading' or code = 'contributing').exists()
  ).all(resolve().is(Organization))
"
Severity: #error
