Invariant: inv-require-official-identifier  // # P2.2.1, #P2.2.2 // TODO: Test this invariant [@glichtner]
Description: "Every Guideline/Recommendation must have exactly one official identifier (with use = #official)"
Expression: "identifier.where(use='official').count() = 1"
Severity: #error
