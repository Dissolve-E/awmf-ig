# Thorsten Persigehl for DRG in the context of 018-038 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Thorsten Persigehl for DRG in the context of 018-038**

## Example PractitionerRole: Thorsten Persigehl for DRG in the context of 018-038

Profile: [Guideline Author Role](StructureDefinition-guideline-author-role.md)

**period**: 2022 --> (ongoing)

**practitioner**: [Practitioner Thorsten Persigehl ](Practitioner-ThorstenPersigehl.md)

**organization**: [Organization Deutsche Röntgengesellschaft, Gesellschaft für Medizinische Radiologie e.V. (DRG)](Organization-DRG.md)

**code**: Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "ThorstenPersigehlDRGFor018-038",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role"]
  },
  "period" : {
    "start" : "2022"
  },
  "practitioner" : {
    "reference" : "Practitioner/ThorstenPersigehl"
  },
  "organization" : {
    "reference" : "Organization/DRG"
  },
  "code" : [{
    "text" : "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
  }]
}

```
