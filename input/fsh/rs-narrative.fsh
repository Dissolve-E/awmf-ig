RuleSet: narrative(text)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\">{text}</div>"

RuleSet: narrative-rtl(text) // #P2.3.2.26 (text direction)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"rtl\">{text}</div>"
