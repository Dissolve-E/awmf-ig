Invariant: inv-guideline-attachment-type-match
Description: "Attachment type in DocumentReference must match the type of the section"
Expression: "reference.resolve()[type=$this.code].exists()"
Severity: #error
