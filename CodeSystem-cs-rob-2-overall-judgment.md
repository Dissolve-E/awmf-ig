# RoB2 Overall Judgment - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **RoB2 Overall Judgment**

## CodeSystem: RoB2 Overall Judgment 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.awmf.org/awmf.ig/CodeSystem/cs-rob-2-overall-judgment | *Version*:0.2.0 |
| Active as of 2026-01-29 | *Computable Name*:RoB2OverallJudment |

 
CodeSystem representing the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [RoB2OverallJudmentVS](ValueSet-vs-rob-2-overall-judgment.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "cs-rob-2-overall-judgment",
  "url" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-rob-2-overall-judgment",
  "version" : "0.2.0",
  "name" : "RoB2OverallJudment",
  "title" : "RoB2 Overall Judgment",
  "status" : "active",
  "experimental" : false,
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
  "description" : "CodeSystem representing the overall judgment of risk of bias assessed by the RoB2 tool for evaluating risk of bias for randomized trials.",
  "caseSensitive" : false,
  "content" : "complete",
  "count" : 3,
  "concept" : [
    {
      "code" : "low_risk_of_bias",
      "display" : "Low risk of bias",
      "definition" : "The study is judged to be at low risk of bias for all domains for this result.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Das Biasrisiko der Studie wurde in Bezug auf das Ergebnis in allen Domänen als niedrig eingeschätzt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Geringes Risiko für Bias"
        }
      ]
    },
    {
      "code" : "some_concerns",
      "display" : "Some concerns",
      "definition" : "The study is judged to raise some concerns in at least one domain for this result, but not to be at high risk of bias for any domain.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Die Studie wurde hinsichtlich des Biasrisikos in Bezug auf das Ergebnis in mindestens einer Domäne als „mit einigen Bedenken“ behaftet eingeschätzt, das Biasrisiko wurde jedoch in keiner Domäne als „hoch“ eingeschätzt."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Einige Bedenken"
        }
      ]
    },
    {
      "code" : "high_risk_of_bias",
      "display" : "High risk of bias",
      "definition" : "The study is judged to be at high risk of bias in at least one domain for this result.\n                     Or \n                     The study is judged to have some concerns for multiple domains in a way that substantially lowers confidence in the result.",
      "_definition" : {
        "extension" : [
          {
            "extension" : [
              {
                "url" : "lang",
                "valueCode" : "de"
              },
              {
                "url" : "content",
                "valueString" : "Das Biasrisiko der Studie wurde in Bezug auf das Ergebnis in mindestens einer Domäne als hoch eingeschätzt; \n                                                                             oder \n                                                                             Die Studie wurde hinsichtlich des Biasrisikos in Bezug auf das Ergebnis in mehreren Domänen als „mit einigen Bedenken“ behaftet eingeschätzt, in einer Weise, die das Vertrauen in das Ergebnis substantiell verringert."
              }
            ],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }
        ]
      },
      "designation" : [
        {
          "language" : "de",
          "value" : "Hohes Risiko für Bias"
        }
      ]
    }
  ]
}

```
