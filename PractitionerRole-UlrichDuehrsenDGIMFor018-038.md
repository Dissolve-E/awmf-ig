# Ulrich Dührsen for DGIM in the context of 018-038 - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Ulrich Dührsen for DGIM in the context of 018-038**

## Example PractitionerRole: Ulrich Dührsen for DGIM in the context of 018-038

Profile: [Guideline Author Role](StructureDefinition-guideline-author-role.md)

**period**: 2022 --> (ongoing)

**practitioner**: [Practitioner Ulrich Dührsen ](Practitioner-UlrichDuehrsen.md)

**organization**: [Organization Deutsche Gesellschaft für Innere Medizin e.V. (DGIM)](Organization-DGIM.md)

**code**: Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung



## Resource Content

```json
{
  "resourceType" : "PractitionerRole",
  "id" : "UlrichDuehrsenDGIMFor018-038",
  "meta" : {
    "profile" : ["http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-author-role"]
  },
  "period" : {
    "start" : "2022"
  },
  "practitioner" : {
    "reference" : "Practitioner/UlrichDuehrsen"
  },
  "organization" : {
    "reference" : "Organization/DGIM"
  },
  "code" : [{
    "text" : "Kapitelverantwortung 5.2 Bildgebende Verfahren, Knochenmarkbiopsie und Stadieneinteilung"
  }]
}

```
