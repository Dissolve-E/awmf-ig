RuleSet: rs-language-section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #closed
* section contains language 0..* and text 0..* // #P2.3.2.21
* section[language]
  * code 1..1
  * code = cs-guideline-sections#language "Language"
  * code.coding 1..1
  * code.coding = cs-guideline-sections#language "Language"
  * extension contains ext-section-language named language 1..1
  * section 0..0
* section[text]
  * code 1..1
  * code.coding 1..1
  * code = $cs-ebm-ig#text "Text"
  * code.coding = $cs-ebm-ig#text "Text"

RuleSet: rs-language-section-nested
* insert rs-language-section
* section[text]
  * insert rs-language-section
  * section[text]
    * insert rs-language-section
    * section[text]
      * insert rs-language-section
      * section[text]
        * insert rs-language-section
        * section[text]
          * insert rs-language-section
          * section[text]
            * insert rs-language-section


// TODO: make invariant that checks that all leaves are language and that all non-leaves do not contain text [@gregor, after workshop]
// TODO: each section that is not defined by a code (e.g. introduction) needs a language section at least for the title [after workshop]
// TODO: what shall we do with lang sections that only specify the title (and have thus no entry/text/section, cf cmp-1 https://build.fhir.org/composition.html#invs ) -- is this a valid use case? [all, after workshop]