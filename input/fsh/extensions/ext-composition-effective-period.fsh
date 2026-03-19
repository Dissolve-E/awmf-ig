Extension: CompositionEffectivePeriod
Id: ext-composition-effective-period
Title: "Composition Effective Period"
Description: "The period during which the composition content was or is planned to be effective."
Context: Composition

* . 0..1
* . ^short = "The effective date range for the composition"
* . ^definition = "The period during which the composition content was or is planned to be effective."
* . ^comment = "The effective period for a composition determines when the content is applicable for usage and is independent of publication and review dates. For example, a measure intended to be used for the year 2016 would be published in 2015."

* extension 0..0
* value[x] 1..1
* value[x] only Period
