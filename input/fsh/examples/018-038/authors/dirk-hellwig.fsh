Instance: DirkHellwig
InstanceOf: GuidelineAuthor
Usage: #example
Title: "Dirk Hellwig"
Description: "Dirk Hellwig"
* name
  * prefix = "Prof. Dr. med."
  * given = "Dirk"
  * family = "Hellwig"
* insert narrative([[Dirk Hellwig]])

Instance: DirkHellwigDGNFor018-038
InstanceOf: GuidelineAuthorRole
Usage: #example
Title: "Dirk Hellwig for DGN in the context of 018-038"
Description: "Dirk Hellwig for DGN in the context of 018-038"
* practitioner = Reference(DirkHellwig)
* organization = Reference(DGN)
* period
  * start = "2022"
* code.text = "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
