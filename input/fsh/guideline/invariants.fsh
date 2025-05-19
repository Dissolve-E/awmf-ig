Invariant: registered-composition-needs-planned-completion-date
Description: "If status = #registered, extension[plannedCompletionDate] SHALL be present."
Expression: "(status != 'registered') or
            (extension.where(url = 'http://fhir.awmf.org/awmf.ig/Extension/ext-planned-completion-date').value.exists())"
Severity: #error

Invariant: preliminary-composition-needs-consultation-period
Description: "If status = #preliminary, extension[consultationPeriod] SHALL be present."
Expression: "(status != 'preliminary') or
            (extension.where(url = 'http://fhir.awmf.org/awmf.ig/Extension/ext-consultation-period').value.exists())"
Severity: #error

Invariant: author-roles-registrant-singleton
Description: "Exactly one author SHALL have role “registrant”; roles “contributing” and “leading” SHALL NOT be used."
Expression: "author.extension.where(url = 'http://fhir.awmf.org/awmf.ig/Extension/ext-guideline-author-role')
           .value.coding.where(code = 'registrant').count() = 1
           and
           author.extension.where(url = 'http://fhir.awmf.org/awmf.ig/Extension/ext-guideline-author-role')
           .value.coding.where(code = 'contributing' or code = 'leading').empty()"
Severity: #error