#### Multi-Language Support for Guideline and Recommendation Sections

To support multi-language publishing of clinical guidelines, the section content in a guideline composition must be represented **per language**. This allows rendering engines and readers to easily select the appropriate version without relying on translation extensions that imply a primary language.

Each section in the `Composition.section` tree may contain a `language` slice, which holds one or more language-specific representations of the same content.

Each `section[language]`:

- Contains an extension `ext-section-language` to indicate the language (e.g., `#de`, `#en`, `#ar`),
- Contains a `text` block with the narrative in that language,
- May contain a `title` and additional structure,
- Can support right-to-left (RTL) layout if required (e.g., Arabic) by using a custom narrative renderer such as `narrative-rtl`.

This structure is preferred over translation extensions (e.g., `content.translation`) because it allows all languages to be treated as equal and avoids privileging a "main" language. This is especially useful in multilingual regions or when publishing international guidelines.

##### Example: Multi-Language Section

```
* section[introduction]
  * section[+]
    * code = cs-guideline-sections#overview
    * section[language][+]
      * extension[ext-section-language].valueCode = #de
      * title = "Übersicht der Empfehlungen und Statements"
      * insert narrative([[Übersicht der Empfehlungen und Statements]])
    * section[language][+]
      * extension[ext-section-language].valueCode = #en
      * title = "Overview of Recommendations and Statements"
      * insert narrative([[Overview of Recommendations and Statements]])
    * section[language][+]
      * extension[ext-section-language].valueCode = #ar
      * title = "نظرة عامة على التوصيات والبيانات"
      * insert narrative-rtl([[نظرة عامة على التوصيات والبيانات]])
```

##### Design Considerations

- **No Primary Language Assumption**: All language sections are treated equally. This avoids models where one language is considered the source and others as secondary translations.
- **Language-Dependent Text Content**: Narrative and free-text fields are included inside the `language` sections, as they are language-specific.
- **Language-Invariant Data (e.g., Codes)**: Structured codes and metadata (e.g., `CodeableConcept`) remain outside the language-specific sections, as they are not language-dependent.
- **Author Attribution**: In the future, a language-specific `section.author` extension may be introduced to represent language-specific contributions.

This approach ensures high flexibility and internationalization, while maintaining clean semantic structure and avoiding redundancy or conflicting language data.
