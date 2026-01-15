{% include variables.md %}
{% assign id = {{include.id}} %}
{% assign resource = site.data.structuredefinitions.[id] %}

### Guidance

The recommendation justification is the boiler plate for linking evidence and evidence-to-decision information to a recommendation. In terms of Dissolve-E requirements, it shall allow to: 

* Flag missing evidence for specific questions or topics

#### Linking Evidence and Justification to Recommendations

To ensure transparency and traceability, each recommendation can be supported by structured justification. This includes:

- Linking **evidence** used to derive the recommendation, outcome by outcome,
- Providing a structured summary of **evidence-to-decision** considerations (e.g., GRADE domains, consensus strength),
- Referencing individual studies when applicable.

This is achieved by combining two linked `ArtifactAssessment` profiles:

1. `RecommendationJustification`: summarizes how a recommendation was derived, including consensus strength and outcome-specific evidence summaries.
2. `EvidenceAssessment`: evaluates the certainty of the evidence for a specific outcome, and optionally for individual studies.

Each outcome that contributed to the recommendation is documented as a separate `content[evidence]` entry in the `RecommendationJustification`. This entry then references a corresponding `EvidenceAssessment` resource.

##### Example: Linking Evidence to a Recommendation

The following example shows how a justification can link multiple outcome-specific evidence ratings to one recommendation:

```
Instance: JustificationExample
InstanceOf: recommendation-justification
* artifactReference = Reference(GuidelineRecommendation/rec-001)
* workflowStatus = #applied

* content[recommendationRating]
  * component[strengthOfRecommendation].classifier = $cs-ebm-ig#strong
  * component[directionOfRecommendation].classifier = $vs-direction-of-recommendation#for
  * component[levelOfConsensus].classifier = vs-level-of-consensus#broad

* content[evidence][+]
  * type = $cs-ebm-ig#evidence
  * relatesTo
    * type = $cs-related-artifact-type#justification
    * targetReference = Reference(EvidenceAssessment/mortality)

* content[evidence][+]
  * type = $cs-ebm-ig#evidence
  * relatesTo
    * type = $cs-related-artifact-type#justification
    * targetReference = Reference(EvidenceAssessment/hospitalStay)
```

This structure supports separate evaluation of the certainty of evidence for each relevant outcome (e.g., mortality, hospital stay).

##### Example: Certainty of Evidence for an Outcome

Each `EvidenceAssessment` references the structured outcome evidence and provides a rating of the certainty of evidence (e.g., GRADE).

```
Instance: CertaintyMortality
InstanceOf: certainty-of-evidence-rating
* artifactReference = Reference(OutcomeEvidence/mortality-effect)
* workflowStatus = #applied

* content[ratingSystem]
  * classifier = $cs-evidence-rating-system#GRADE

* content[levelOfEvidence]
  * type = $cs-certainty-type#Overall
  * classifier = cs-rating-certainty-of-evidence#moderate
```

This pattern supports consistent documentation of certainty across outcomes and recommendations.

##### Optional: Referencing Individual Studies

If individual studies were assessed separately, each can be linked as a `component` within the corresponding `content[evidence]` in the `RecommendationJustification`:

```
* content[evidence][+]
  * type = $cs-ebm-ig#evidence
  * relatesTo.targetReference = Reference(EvidenceAssessment/summary-mortality)
  * component[+]
    * type = $cs-ebm-ig#evidence
    * relatesTo.targetReference = Reference(EvidenceAssessment/study123)
```

This structure enables separation of outcome-level summaries from individual study-level ratings, while still maintaining linkages between them.

##### Why this Structure?

Although the linkages span multiple resources (`RecommendationJustification → EvidenceAssessment → OutcomeEvidence → EvidenceVariable`), this model supports:

- Precise referencing of both outcome-level and study-level evidence,
- Extensibility for structured meta-analysis,
- Compatibility with structured reporting of p-values, effect sizes, and certainty domains,
- Clean separation of evidence evaluation (`EvidenceAssessment`) and recommendation reasoning (`RecommendationJustification`).

This design aligns with the Dissolve-E goal of structured, traceable, and standards-based documentation of how recommendations are derived from evidence.



#### Capturing Consensus Procedures for Recommendations

To promote transparency in how recommendations were developed, guidelines must include information on the **consensus process** used by the working group. This includes:

- The consensus method (e.g., Nominal Group Process, Delphi technique, Structured Consensus Conference),
- When consensus meetings took place,
- How consensus was achieved or revised across meetings.

This information is recorded in a dedicated **Consensus Protocol** section of the guideline composition, using the `consensusProtocol` slice. The content is unstructured and can be recorded as plain text, tables, or embedded HTML for maximum flexibility. Further slicing may be added in the future if structured encoding is needed.

##### Example in FSH

```
* section[+]
  * code = cs-guideline-sections#consensus-protocol "Consensus Protocol"
  * text.div = "<div xmlns='http://www.w3.org/1999/xhtml'><p>The guideline was developed using a Delphi process conducted in three rounds between January and March 2024. Final consensus was reached during a structured consensus conference on March 28, 2024.</p></div>"
```

This section helps users and reviewers understand the development methodology and fosters trust in the guideline’s legitimacy.

#### Including Conflict of Interest Declarations

To ensure transparency and mitigate potential bias, all guidelines must disclose **conflicts of interest (COI)** of contributors. This includes:

- Types of interests (e.g., paid consultancy, speaker fees, advisory board membership, intellectual property ownership),
- Relevance to the guideline topic,
- Declared consequences (e.g., restriction from voting or drafting).

Conflict of interest declarations are recorded in the `competingInterests` section of the guideline composition or specific recommendation. The content may be provided as structured tables or unstructured text (e.g., using HTML tables within `text.div`). This allows for clear presentation of COI data without enforcing a rigid schema.

##### Example in FSH

```
* section[+]
  * code = cs-guideline-sections#competing-interests "Competing Interests"
  * text.div = """
    <div xmlns="http://www.w3.org/1999/xhtml">
      <table>
        <thead><tr><th>Name</th><th>Interest</th><th>Relevance</th><th>Consequence</th></tr></thead>
        <tbody>
          <tr><td>Dr. Example</td><td>Consulting for PharmaCorp</td><td>High</td><td>Excluded from voting</td></tr>
        </tbody>
      </table>
    </div>
    """
```

Further extensions or slices may be introduced in the future to structure these items more granularly (e.g., per contributor or per category), but for now, the section allows flexible textual or tabular encoding of COI information as appropriate.

This approach supports compliance with AWMF and oncology guideline standards, enabling clear communication of potential bias while allowing guideline developers freedom in how they collect and present COI declarations.



{% capture resource_inheritance %}
This profile of a FHIR {{resource.type}} is derived from the [{{resource.base | split: '/' | last}}]({{resource.base}}) FHIR resource.
{% endcapture %}

{{ resource_inheritance | strip_newlines }}

{% include link-list.md %}
