Extension: CompositionApprovalDate
Id: ext-composition-approval-date
Title: "Composition Approval Date"
Description: "The date on which the composition content was approved by the publisher. Approval happens once when the content is officially approved for usage."
Context: Composition

* . 0..1
* . ^short = "When composition approved by publisher"
* . ^definition = "The date on which the asset content was approved by the publisher. Approval happens once when the content is officially approved for usage."
* . ^comment = "The date may be more recent than the approval date because of minor changes / editorial corrections."

* extension 0..0
* value[x] 1..1
* value[x] only date
