Extension: CompositionLastReviewDate
Id: ext-composition-last-review-date
Title: "Composition Last Review Date"
Description: "The date on which the composition content was last reviewed. Review happens periodically after that, but doesn't change the original approval date."
Context: Composition

* . 0..1
* . ^short = "Last review date for the composition"
* . ^definition = "The date on which the composition content was last reviewed. Review happens periodically after that, but doesn't change the original approval date."
* . ^comment = "If specified, this is usually after the approval date."

* extension 0..0
* value[x] 1..1
* value[x] only date
