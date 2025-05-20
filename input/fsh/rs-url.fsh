RuleSet: rs-url(type, id)
* ^url = "http://fhir.awmf.org/awmf.ig/{type}/{id}"

RuleSet: rs-extension-url(id)
* insert rs-url(Extension, {id})
