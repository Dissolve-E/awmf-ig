RuleSet: rs-language-section
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section contains language 0..* // #P2.3.2.21 // TODO: must be 1..* when this is implemented as an actual subsection 
* section[language]
  * code 1..1
  * code.coding 1..1
  * code.coding = cs-awmf#language // TODO: use existing code
  * extension contains ext-section-language named language 1..1
  * section 0..0


RuleSet: rs-language-section-nested
* insert rs-language-section
* section
  * insert rs-language-section
  * section
    * insert rs-language-section
    * section
      * insert rs-language-section
      * section
        * insert rs-language-section
        * section
          * insert rs-language-section

// TODO: make invariant that checks that all leaves are language and that all non-leaves do not contain text
