Instance: UlrichDuehrsen
InstanceOf: GuidelineAuthor
Usage: #example
Title: "Ulrich Dührsen"
Description: "Ulrich Dührsen"
* name
  * prefix = "Prof. Dr. med."
  * given = "Ulrich"
  * family = "Dührsen"
* insert narrative([[Ulrich Dührsen]])

Instance: UlrichDuehrsenDGIMFor018-038
InstanceOf: GuidelineAuthorRole
Usage: #example
Title: "Ulrich Dührsen for DGIM in the context of 018-038"
Description: "Ulrich Dührsen for DGIM in the context of 018-038"
* practitioner = Reference(UlrichDuehrsen)
* organization = Reference(DGIM)
* period
  * start = "2022"
* code.text = "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
