Instance: ThorstenPersigehl
InstanceOf: GuidelineAuthor
Usage: #example
Title: "Thorsten Persigehl"
Description: "Thorsten Persigehl"
* name
  * prefix = "Prof. Dr. med."
  * given = "Thorsten"
  * family = "Persigehl"
* insert narrative([[Thorsten Persigehl]])

Instance: ThorstenPersigehlDRGFor018-038
InstanceOf: GuidelineAuthorRole
Usage: #example
Title: "Thorsten Persigehl for DRG in the context of 018-038"
Description: "Thorsten Persigehl for DRG in the context of 018-038"
* practitioner = Reference(ThorstenPersigehl)
* organization = Reference(DRG)
* period
  * start = "2022"
* code.text = "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
