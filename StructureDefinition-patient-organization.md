# Patient Organization - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Patient Organization**

## Resource Profile: Patient Organization 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/StructureDefinition/patient-organization | *Version*:0.2.0 |
| Draft as of 2026-01-29 | *Computable Name*:PatientOrganization |

 
An organization that represents patients 

### Guidance

This profile represents a **Patient Organization** – an organization that represents patients and patient interests in the guideline development process.

#### Overview

Patient organizations play an important role in ensuring that guidelines reflect patient perspectives and priorities. This profile provides a standardized way to identify and reference such organizations.

#### Key Elements

##### Organization Type

The `type` element is required and fixed to identify the organization as a patient organization:

```
* type = cs-awmf#patient-organization

```

#### Example Usage

```
Instance: PatientOrgExample
InstanceOf: patient-organization
Usage: #example
* name = "German Patient Alliance for [Condition]"
* type = cs-awmf#patient-organization
* contact.telecom
  * system = #url
  * value = "https://www.patient-alliance-example.org"

```

This profile of a FHIR Organization is derived from the [Organization](http://hl7.org/fhir/StructureDefinition/Organization) FHIR resource.

**Usages:**

* This Profile is not used by any profiles in this Implementation Guide

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/awmf.ig|current/StructureDefinition/patient-organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-patient-organization.csv), [Excel](StructureDefinition-patient-organization.xlsx), [Schematron](StructureDefinition-patient-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "patient-organization",
  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/patient-organization",
  "version" : "0.2.0",
  "name" : "PatientOrganization",
  "title" : "Patient Organization",
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
  "description" : "An organization that represents patients",
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
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Organization",
        "path" : "Organization"
      },
      {
        "id" : "Organization.type",
        "path" : "Organization.type",
        "min" : 1,
        "patternCodeableConcept" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
              "code" : "patient-organization"
            }
          ]
        }
      }
    ]
  }
}

```
