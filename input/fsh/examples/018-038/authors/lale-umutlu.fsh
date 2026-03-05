Instance: LaleUmutlu
InstanceOf: GuidelineAuthor
Usage: #example
Title: "Lale Umutlu"
Description: "Lale Umutlu"
* name
  * prefix = "Prof. Dr. med."
  * given = "Lale"
  * family = "Umutlu"
* insert narrative([[Lale Umutlu]])

Instance: LaleUmutluDRGFor018-038
InstanceOf: GuidelineAuthorRole
Usage: #example
Title: "Lale Umutlu for DRG in the context of 018-038"
Description: "Lale Umutlu for DRG in the context of 018-038"
* practitioner = Reference(LaleUmutlu)
* organization = Reference(DRG)
* period
  * start = "2022"
* code.text = "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
