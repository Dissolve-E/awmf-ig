RuleSet: rs-language-section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #closed
* section contains language 0..* and @default 0..* // #P2.3.2.21
* section[language]
  * code 1..1
  * code = cs-guideline-sections#language
  * extension contains ext-section-language named language 1..1
  * section 0..0
* section[@default]
  // fixme: actually, the default slice must not fix the discriminator, but as of 25-03-06 the validator is not able to handle default slices. therefore, we fix the discriminator here.
  * code 1..1
  * code = cs-guideline-sections#default-section

RuleSet: rs-language-section-nested
* insert rs-language-section
* section[@default]
  * insert rs-language-section
  * section[@default]
    * insert rs-language-section
    * section[@default]
      * insert rs-language-section
      * section[@default]
        * insert rs-language-section
        * section[@default]
          * insert rs-language-section
          * section[@default]
            * insert rs-language-section


// TODO: make invariant that checks that all leaves are language and that all non-leaves do not contain text [@gregor, after workshop]
// TODO: each section that is not defined by a code (e.g. introduction) needs a language section at least for the title [after workshop]
// TODO: what shall we do with lang sections that only specify the title (and have thus no entry/text/section, cf cmp-1 https://build.fhir.org/composition.html#invs ) -- is this a valid use case? [all, after workshop]