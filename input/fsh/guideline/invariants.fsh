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
