# AWMF Member Organization - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **AWMF Member Organization**

## Resource Profile: AWMF Member Organization 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:AWMFMemberOrganization |

 
An organization that is a member of the AWMF 

### Guidance

#### Representing AWMF Member Organizations

Medical associations that are members of the AWMF are each assigned a unique **association number**, typically a 3-character code. These organizations should be modeled using the `AWMFMemberOrganization` profile, which enforces the presence of this identifier and distinguishes the organization as a member.

The identifier must use the fixed system URI and must be marked as the official identifier. The type of the organization must explicitly reflect its AWMF membership by using a designated coding:

```
* system = "http://fhir.awmf.org/association"
* use = #official
* type = cs-awmf#awmf-member-organization

```

This ensures clarity and consistency in downstream systems and supports clear separation between member and non-member organizations.

Here is a complete example of how to define an AWMF member organization in FHIR Shorthand (FSH):

```
Instance: ExampleAWMFMemberOrg
InstanceOf: awmf-member-organization
* name = "German Society of Example Medicine"
* identifier[awmf-association-number]
  * system = "http://fhir.awmf.org/association"
  * value = "123"
  * use = #official
* type = cs-awmf#awmf-member-organization
* contact.telecom
  * system = #url
  * value = "https://www.example-med.org"

```

Important: The information about whether an organization is (currently or historically) a member of the AWMF is stored **only** in the `Organization` resource. This information is **not duplicated** in the guideline itself, even if that organization contributed to the development of the guideline.

To represent that the AWMF itself is the official publishing authority for a guideline, the following structure is used in the `Composition.attester`:

```
* attester[+]
  * mode = #official
  * party = Reference(AWMF)

```

This separation ensures that the provenance and role of organizations are cleanly modeled, and avoids redundancy between metadata and contributor definitions.

This profile of a FHIR Organization is derived from the [medical-society](http://fhir.awmf.org/awmf.ig/StructureDefinition/medical-society) FHIR resource.

**Usages:**

* Examples for this Profile: [Example AWMF Member Organization](Organization-AWMFMemberOrganizationExample.md), [Deutsche Gesellschaft für Anästhesiologie und Intensivmedizin e.V. (DGAI)](Organization-DGAI.md), [Deutsche Gesellschaft für Chirurgie e.V. (DGCH)](Organization-DGCH.md), [Deutsche Gesellschaft für Hygiene und Mikrobiologie e.V. (DGHM)](Organization-DGHM.md)... Show 9 more, [Deutsche Gesellschaft für Infektiologie e.V. (DGI)](Organization-DGI.md), [Deutsche Gesellschaft für Internistische Intensivmedizin und Notfallmedizin e.V. (DGIIN)](Organization-DGIIN.md), [Deutsche Gesellschaft für Innere Medizin e.V. (DGIM)](Organization-DGIM.md), [Deutsche Gesellschaft für Pneumologie und Beatmungsmedizin e.V. (DGP)](Organization-DGP.md), [Deutsche Gesellschaft für Psychiatrie und Psychotherapie, Psychosomatik und Nervenheilkunde e. V. (DGPPN)](Organization-DGPPN.md), [Deutsche Röntgengesellschaft, Gesellschaft für Medizinische Radiologie e.V. (DRG)](Organization-DRG.md), [Deutsche Sepsis-Gesellschaft e.V. (DSG)](Organization-DSG.md), [Gesellschaft für Virologie e.V. (GfV)](Organization-GFV.md) and [Paul-Ehrlich-Gesellschaft für Infektionstherapie e.V. (PEG)](Organization-PEG.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/awmf-member-organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-awmf-member-organization.csv), [Excel](StructureDefinition-awmf-member-organization.xlsx), [Schematron](StructureDefinition-awmf-member-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "awmf-member-organization",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/awmf-member-organization",
  "version" : "0.2.0",
  "name" : "AWMFMemberOrganization",
  "title" : "AWMF Member Organization",
  "status" : "draft",
  "date" : "2026-01-29T18:27:10+00:00",
  "publisher" : "AWMF e.V.",
  "contact" : [
    {
      "name" : "AWMF e.V.",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.awmf.org"
        }
      ]
    }
  ],
  "description" : "An organization that is a member of the AWMF",
  "fhirVersion" : "6.0.0-ballot3",
  "mapping" : [
    {
      "identity" : "w5",
      "uri" : "http://hl7.org/fhir/fivews",
      "name" : "FiveWs Pattern Mapping"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 V2 Mapping"
    },
    {
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    },
    {
      "identity" : "servd",
      "uri" : "http://www.omg.org/spec/ServD/1.0/",
      "name" : "ServD"
    },
    {
      "identity" : "interface",
      "uri" : "http://hl7.org/fhir/interface",
      "name" : "Interface Pattern"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Organization",
  "baseDefinition" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/medical-society",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Organization",
        "path" : "Organization"
      },
      {
        "id" : "Organization.identifier",
        "path" : "Organization.identifier",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "system"
            }
          ],
          "rules" : "open"
        },
        "min" : 1
      },
      {
        "id" : "Organization.identifier:awmf-association-number",
        "path" : "Organization.identifier",
        "sliceName" : "awmf-association-number",
        "min" : 1,
        "max" : "1"
      },
      {
        "id" : "Organization.identifier:awmf-association-number.use",
        "path" : "Organization.identifier.use",
        "patternCode" : "official"
      },
      {
        "id" : "Organization.identifier:awmf-association-number.system",
        "path" : "Organization.identifier.system",
        "min" : 1,
        "patternUri" : "http://fhir.awmf.org/association"
      },
      {
        "id" : "Organization.identifier:awmf-association-number.value",
        "path" : "Organization.identifier.value",
        "min" : 1
      },
      {
        "id" : "Organization.qualification",
        "path" : "Organization.qualification",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "code"
            }
          ],
          "rules" : "closed"
        },
        "min" : 1
      },
      {
        "id" : "Organization.qualification:awmf-member-organization",
        "path" : "Organization.qualification",
        "sliceName" : "awmf-member-organization",
        "min" : 1,
        "max" : "*"
      },
      {
        "id" : "Organization.qualification:awmf-member-organization.code",
        "path" : "Organization.qualification.code",
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "awmf-member-organization"
            }
          ]
        }
      }
    ]
  }
}

```
