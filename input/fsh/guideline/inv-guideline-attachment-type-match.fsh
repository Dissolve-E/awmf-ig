Invariant: inv-guideline-attachment-type-match
Description: "Attachment type in DocumentReference must match the type of the section"
// TODO: a lot of debug statements here - clean up when this is working [@glichtner]
Expression: "entry[0].reference.resolve().trace('resolve').trace('this.code', $this.code).trace('type', type).where(type[0]=$this.code[0]).trace('typewhere', type).exists()"
Severity: #error
