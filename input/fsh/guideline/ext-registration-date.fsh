Extension: RegistrationDate
Id: ext-registration-date
Title: "Registration Date"
Description: "The date the guideline project was registered."
Context: Composition
* insert rs-extension-url(ext-registration-date)
* ^purpose = "The date the guideline project was registered."
* . 0..1
* . ^short = "Registration Date"
* . ^definition = "The date the guideline project was registered."
* value[x] 1..
* value[x] only date
