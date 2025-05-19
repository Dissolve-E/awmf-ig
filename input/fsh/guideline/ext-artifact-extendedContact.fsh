Extension: ArtifactExtendedContact
Id: ext-artifact-extended-contact
Title: "Artifact Contact (Extended)"
Description: "This extension provides additional contact details for individuals or organizations associated with an artifact (e.g., a clinical document, guideline, or other composition)."
Context: Composition
* insert rs-extension-url(ext-artifact-extended-contact)
* value[x] only ExtendedContactDetail
* valueExtendedContactDetail 1..1
