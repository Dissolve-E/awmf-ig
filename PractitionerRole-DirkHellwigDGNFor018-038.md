# Dirk Hellwig for DGN in the context of 018-038 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Dirk Hellwig for DGN in the context of 018-038**

## Example PractitionerRole: Dirk Hellwig for DGN in the context of 018-038

Profile: [Guideline Author Role](StructureDefinition-guideline-author-role.md)

**period**: 2022 --> (ongoing)

**practitioner**: [Practitioner Dirk Hellwig ](Practitioner-DirkHellwig.md)

**organization**: [Organization Deutsche Gesellschaft für Nuklearmedizin e.V. (DGN)](Organization-DGN.md)

**code**: Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "DirkHellwigDGNFor018-038",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role"]
  },
  "period" : {
    "start" : "2022"
  },
  "practitioner" : {
    "reference" : "Practitioner/DirkHellwig"
  },
  "organization" : {
    "reference" : "Organization/DGN"
  },
  "code" : [{
    "text" : "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
  }]
}

```
