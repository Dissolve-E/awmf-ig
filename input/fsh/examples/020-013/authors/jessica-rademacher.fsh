Instance: JessicaRademacher
InstanceOf: GuidelineAuthor
Usage: #example
Title: "Jessica Rademacher"
Description: "Jessica Rademacher"
* name
  * prefix = "PD Dr. med."
  * given = "Jessica"
  * family = "Rademacher"
* address
  * text = "Klinik für Pneumologie und Infektiologie, Medizinische Hochschule Hannover"
  * use = #work


Instance: JessicaRademacherDGPFor020-013
InstanceOf: GuidelineAuthorRole
Usage: #example
Title: "Jessica Rademacher for DGP in the context of 020-013"
Description: "Jessica Rademacher for DGP in the context of 020-013"
* practitioner = Reference(JessicaRademacher)
* organization = Reference(DGP)
* period
  * start = "2022-08-01"
  * end = "2023-12-31"
* code.text = "Koordination und wissenschaftliche Leitung"
