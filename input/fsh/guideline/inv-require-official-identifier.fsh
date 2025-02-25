Invariant: inv-require-official-identifier  // # P2.2.1 // TODO: Test this invariant
Description: "Every Recommendation must have exactly one official identifier (with use = #official)"
Expression: "$this.where(use='official').count() = 1"
Severity: #error
