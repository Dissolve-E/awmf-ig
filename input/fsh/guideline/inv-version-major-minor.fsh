Invariant: inv-version-major-minor  // #P2.2.1 #P2.2.8 // TODO: Test this invariant
Description: "Version must be a major-minor version (e.g. 5.1)"
Expression: "$this.matches('[0-9]+\\\\.[0-9]+')"
Severity: #error
