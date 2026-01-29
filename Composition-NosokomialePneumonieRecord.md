# S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie - Dissolve-E: AWMF Guideline Registry v0.2.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie**

## Example Composition: S3-Leitlinie Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie

S3-Leitlinie zur Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie



## Resource Content

```json
{
  "resourceType" : "Composition",
  "id" : "NosokomialePneumonieRecord",
  "meta" : {
    "profile" : [
      "http://fhir.awmf.org/awmf.ig/StructureDefinition/guideline-registry-record"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/artifact-extended-contact-detail",
      "valueExtendedContactDetail" : {
        "purpose" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point",
              "code" : "contact"
            }
          ]
        },
        "name" : [
          {
            "text" : "PD Dr. med. Jessica Rademacher"
          }
        ],
        "telecom" : [
          {
            "system" : "email",
            "value" : "Rademacher.Jessica@mh-hannover.de"
          },
          {
            "system" : "phone",
            "value" : "0511-532 9735"
          }
        ],
        "address" : {
          "use" : "work",
          "line" : ["Klinik für Pneumologie", "Medizinische Hochschule Hannover"],
          "city" : "Hannover",
          "postalCode" : "30625"
        }
      }
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/artifact-extended-contact-detail",
      "valueExtendedContactDetail" : {
        "purpose" : {
          "coding" : [
            {
              "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-contact-point",
              "code" : "coordinator"
            }
          ]
        },
        "name" : [
          {
            "text" : "PD Dr. med. Jessica Rademacher"
          }
        ],
        "telecom" : [
          {
            "system" : "email",
            "value" : "Rademacher.Jessica@mh-hannover.de"
          },
          {
            "system" : "phone",
            "value" : "0511-532 9735"
          }
        ],
        "address" : {
          "use" : "work",
          "line" : ["Klinik für Pneumologie", "Medizinische Hochschule Hannover"],
          "city" : "Hannover",
          "postalCode" : "30625"
        }
      }
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/artifact-lastReviewDate",
      "valueDate" : "2024-03-01"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/artifact-publicationDate",
      "valueDate" : "2024-03-22"
    },
    {
      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date",
      "valueDate" : "2012-11-16"
    },
    {
      "url" : "http://hl7.org/fhir/StructureDefinition/artifact-effectivePeriod",
      "valuePeriod" : {
        "end" : "2029-02-28"
      }
    }
  ],
  "identifier" : [
    {
      "use" : "official",
      "system" : "http://fhir.awmf.org/guidelines",
      "value" : "020-013"
    }
  ],
  "version" : "3.0",
  "status" : "final",
  "type" : {
    "coding" : [
      {
        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf",
        "code" : "guideline-registry-record",
        "display" : "Guideline Registry Record"
      }
    ]
  },
  "category" : [
    {
      "coding" : [
        {
          "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-awmf-guideline-class",
          "code" : "S3",
          "display" : "Evidence- and consensus-based guideline"
        }
      ]
    }
  ],
  "date" : "2025-02-13",
  "author" : [
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "leading"
              }
            ]
          }
        },
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "registrant"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGP"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGAI"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGI"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGHM"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/PEG"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DRG"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/GFV"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGCH"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGIM"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DGIIN"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/DSG"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/CPAnet"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "contributing"
              }
            ]
          }
        }
      ],
      "reference" : "Organization/RKI"
    },
    {
      "extension" : [
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-guideline-author-role",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-author-role",
                "code" : "content-author"
              }
            ]
          }
        }
      ],
      "reference" : "PractitionerRole/JessicaRademacherDGPFor020-013"
    }
  ],
  "title" : "Epidemiologie, Diagnostik und Therapie erwachsener Patienten mit nosokomialer Pneumonie",
  "note" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/annotationType",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-remark-type",
                "code" : "note",
                "display" : "Note"
              }
            ]
          }
        }
      ],
      "text" : "Das dieser Veröffentlichung zugrundliegende Projekt wurde mit Mitteln des Innovationsausschusses beim Gemeinsamen Bundesausschuss unter dem Förderkennzeichen gefördert: 01VSF22007"
    }
  ],
  "attester" : [
    {
      "mode" : {
        "coding" : [
          {
            "system" : "http://hl7.org/fhir/composition-attestation-mode",
            "code" : "official"
          }
        ]
      },
      "party" : {
        "reference" : "Organization/AWMF"
      }
    }
  ],
  "relatesTo" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
                "code" : "related-guideline"
              }
            ]
          }
        },
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label",
          "valueString" : "Behandlung von erwachsenen Patienten mit ambulant erworbener Pneumonie"
        }
      ],
      "type" : "similar-to",
      "targetUri" : "https://www.awmf.org/leitlinien/detail/ll/020-020.html"
    },
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
                "code" : "related-guideline"
              }
            ]
          }
        },
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label",
          "valueString" : "Diagnostik und Therapie von erwachsenen Patienten mit Husten"
        }
      ],
      "type" : "similar-to",
      "targetUri" : "https://www.awmf.org/leitlinien/detail/ll/020-003.html"
    },
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
                "code" : "related-guideline"
              }
            ]
          }
        },
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label",
          "valueString" : "Prolongiertes Weaning"
        }
      ],
      "type" : "similar-to",
      "targetUri" : "https://www.awmf.org/leitlinien/detail/ll/020-015.html"
    },
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
                "code" : "related-guideline"
              }
            ]
          }
        },
        {
          "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label",
          "valueString" : "Management der ambulant erworbenen Pneumonie bei Kindern und Jugendlichen (pCAP)"
        }
      ],
      "type" : "similar-to",
      "targetUri" : "https://www.awmf.org/leitlinien/detail/ll/048-013.html"
    },
    {
      "extension" : [
        {
          "url" : "http://hl7.org/fhir/StructureDefinition/relatesto-classifier",
          "valueCodeableConcept" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-related-artifact-types",
                "code" : "awmf-detail-page"
              }
            ]
          }
        }
      ],
      "type" : "documentation",
      "targetUri" : "https://register.awmf.org/de/leitlinien/detail/020-013"
    }
  ],
  "section" : [
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "summary",
            "display" : "Summary"
          }
        ]
      },
      "section" : [
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "intention",
                "display" : "Intention"
              }
            ]
          },
          "section" : [
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                  "valueCode" : "de"
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "language",
                    "display" : "Language"
                  }
                ]
              },
              "text" : {
                "status" : "additional",
                "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Darstellung und Standardisierung der Diagnostik und Therapie der nosokomialen Pneumonie auf der Basis des aktuellen wissen-schaftlichen Kenntnisstandes für die Sicherstellung einer Evidenz-basierten und optimalen Versorgung von Patienten.</div>"
              }
            }
          ]
        },
        {
          "extension" : [
            {
              "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding",
              "valueCodeableConcept" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-target-patient-group",
                    "code" : "adults",
                    "display" : "Adults"
                  }
                ]
              }
            }
          ],
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "target-patient-group",
                "display" : "Target Patient Group"
              }
            ]
          },
          "section" : [
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                  "valueCode" : "de"
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "language",
                    "display" : "Language"
                  }
                ]
              },
              "text" : {
                "status" : "additional",
                "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Erwachsene</div>"
              }
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "care-setting",
                "display" : "Care Setting"
              }
            ]
          },
          "section" : [
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding",
                  "valueCodeableConcept" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-care-setting",
                        "code" : "inpatient"
                      }
                    ]
                  }
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "encounter-type",
                    "display" : "Encounter Type"
                  }
                ]
              },
              "section" : [
                {
                  "extension" : [
                    {
                      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                      "valueCode" : "de"
                    }
                  ],
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                        "code" : "language",
                        "display" : "Language"
                      }
                    ]
                  },
                  "text" : {
                    "status" : "additional",
                    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">stationär</div>"
                  }
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding",
                  "valueCodeableConcept" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-care-setting",
                        "code" : "diagnosis"
                      }
                    ]
                  }
                },
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding",
                  "valueCodeableConcept" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-care-setting",
                        "code" : "therapy"
                      }
                    ]
                  }
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "care-stage",
                    "display" : "Care Stage"
                  }
                ]
              },
              "section" : [
                {
                  "extension" : [
                    {
                      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                      "valueCode" : "de"
                    }
                  ],
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                        "code" : "language",
                        "display" : "Language"
                      }
                    ]
                  },
                  "text" : {
                    "status" : "additional",
                    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Diagnostik, Therapie</div>"
                  }
                }
              ]
            },
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-coding",
                  "valueCodeableConcept" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-care-setting",
                        "code" : "specialized-care"
                      }
                    ]
                  }
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "care-level",
                    "display" : "Care Level"
                  }
                ]
              },
              "section" : [
                {
                  "extension" : [
                    {
                      "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                      "valueCode" : "de"
                    }
                  ],
                  "code" : {
                    "coding" : [
                      {
                        "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                        "code" : "language",
                        "display" : "Language"
                      }
                    ]
                  },
                  "text" : {
                    "status" : "additional",
                    "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">spezialärztliche Versorgung</div>"
                  }
                }
              ]
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "topic-selection-reason",
                "display" : "Topic Selection Reason"
              }
            ]
          },
          "section" : [
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                  "valueCode" : "de"
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "language",
                    "display" : "Language"
                  }
                ]
              },
              "text" : {
                "status" : "additional",
                "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Die nosokomiale Pneumonie ist in Deutschland eine häufige hospitalerworbene Infektion, die mit einer hohen Morbidität und Mortalität einhergeht. Diagnostik und Therapie stellen hohe Ansprüche an die behandelnden Ärzte, die häufig interdisziplinär gelöst werden müssen. Das therapeutische Vorgehen hat erheblichen Einfluss auf die Entwicklung von Antibiotikaresistenzen bei den ursächlichen Erregern. Revision der bestehenden Leitlinie wurde erforderlich, da die Empfehlungen zur Standardisierung und Qualitätssicherung der Diagnostik und Therapie bei erwachsenen Patienten mit nosokomialen Pneumonien auf den aktuellsten Forschungsergebnissen angepasst werden müssen.</div>"
              }
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "target-audience",
                "display" : "Target Audience"
              }
            ]
          },
          "section" : [
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                  "valueCode" : "de"
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "language",
                    "display" : "Language"
                  }
                ]
              },
              "text" : {
                "status" : "additional",
                "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Die Leitlinie wendet sich an alle im Krankenhaus tätigen Ärzte, die mit der Diagnostik und Therapie nosokomialer Pneumonien konfrontiert sind. Hierzu gehören Fachärzte für Anästhesiologie, Chirurgie, Innere Medizin, Intensivmedizin, Klinische Infektiologie, Klinische Mikrobiologie, Hygiene, Pneumologie, Virologie, und Radiologie, aber auch Ärzten anderer Fachgebiete, die Patienten mit nosokomialen Infektionen betreuen. Zugleich soll sie als Orientierung für Personen, Organisationen, Kostenträger sowie medizinisch-wissenschaftliche Fachgesellschaften und Berufsverbände dienen, die direkt oder indirekt mit diesem Thema in Verbindung stehen.</div>"
              }
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "keywords",
                "display" : "Keywords"
              }
            ]
          },
          "section" : [
            {
              "extension" : [
                {
                  "url" : "http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language",
                  "valueCode" : "de"
                }
              ],
              "code" : {
                "coding" : [
                  {
                    "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                    "code" : "language",
                    "display" : "Language"
                  }
                ]
              },
              "text" : {
                "status" : "additional",
                "div" : "<div xmlns=\"http://www.w3.org/1999/xhtml\">Pneumonie, nosokomial, hospital-acquired pneumonia, HAP, Ventilator-assoziierten Pneumonie, VAP, im Krankenhaus erworbene Lungenentzündung, Epidemiology, diagnosis and treatment of adult patients with nosocomial pneumonia</div>"
              }
            }
          ]
        }
      ]
    },
    {
      "code" : {
        "coding" : [
          {
            "system" : "https://fevir.net/resources/CodeSystem/179423",
            "code" : "attachments",
            "display" : "Attachments"
          }
        ]
      },
      "section" : [
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "long-version",
                "display" : "Long Version"
              }
            ]
          },
          "entry" : [
            {
              "reference" : "DocumentReference/Guideline-020-013-LongVersion"
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "short-version",
                "display" : "Short Version"
              }
            ]
          },
          "entry" : [
            {
              "reference" : "DocumentReference/Guideline-020-013-ShortVersion"
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "guideline-report",
                "display" : "Guideline Report"
              }
            ]
          },
          "entry" : [
            {
              "reference" : "DocumentReference/Guideline-020-013-GuidelineReport"
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "patient-version",
                "display" : "Patient Version"
              }
            ]
          },
          "entry" : [
            {
              "reference" : "DocumentReference/Guideline-020-013-PatientVersion"
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "slide-deck"
              }
            ]
          },
          "entry" : [
            {
              "reference" : "DocumentReference/Guideline-020-013-SlideDeck"
            }
          ]
        },
        {
          "code" : {
            "coding" : [
              {
                "system" : "http://fhir.awmf.org/awmf.ig/CodeSystem/cs-guideline-sections",
                "code" : "implementation-guidance"
              }
            ]
          },
          "entry" : [
            {
              "reference" : "DocumentReference/Guideline-020-013-ImplementationGuidance"
            }
          ]
        }
      ]
    }
  ]
}

```
