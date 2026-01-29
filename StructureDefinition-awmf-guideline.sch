<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Guideline
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Composition</sch:title>
    <sch:rule context="f:Composition">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-versionAlgorithm': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-experimental']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-experimental': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-description']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-description': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-purpose']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-purpose': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-copyright']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-copyright': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-copyrightLabel']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-copyrightLabel': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-approvalDate']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-approvalDate': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-lastReviewDate']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-lastReviewDate': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-effectivePeriod']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-effectivePeriod': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-publicationDate']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-publicationDate': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/ebm/StructureDefinition/artifact-publication-status']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/ebm/StructureDefinition/artifact-publication-status': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:version) &gt;= 1">version: minimum cardinality of 'version' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:extension</sch:title>
    <sch:rule context="f:Composition/f:extension">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:identifier</sch:title>
    <sch:rule context="f:Composition/f:identifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 1">use: maximum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:type) &lt;= 1">type: maximum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 1">period: maximum cardinality of 'period' is 1</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 1">assigner: maximum cardinality of 'assigner' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:relatesTo</sch:title>
    <sch:rule context="f:Composition/f:relatesTo">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section</sch:title>
    <sch:rule context="f:Composition/f:section">
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:title) &lt;= 1">title: maximum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:focus) &lt;= 1">focus: maximum cardinality of 'focus' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:orderedBy) &lt;= 1">orderedBy: maximum cardinality of 'orderedBy' is 1</sch:assert>
      <sch:assert test="count(f:emptyReason) &lt;= 1">emptyReason: maximum cardinality of 'emptyReason' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:code</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
