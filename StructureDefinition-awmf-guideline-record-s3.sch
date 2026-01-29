<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile AWMFGuidelineRegistryRecord
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
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-extended-contact-detail']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-extended-contact-detail': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/artifact-extended-contact-detail']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/artifact-extended-contact-detail': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-first-publication-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-submission-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-consultation-period': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-planned-completion-date': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-registration-date': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:note</sch:title>
    <sch:rule context="f:Composition/f:note">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/annotationType']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/annotationType': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/annotationType']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/annotationType': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:attester</sch:title>
    <sch:rule context="f:Composition/f:attester">
      <sch:assert test="count(f:party) &gt;= 1">party: minimum cardinality of 'party' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:relatesTo</sch:title>
    <sch:rule context="f:Composition/f:relatesTo">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &gt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &gt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/relatesto-classifier': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-relates-to-label': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section</sch:title>
    <sch:rule context="f:Composition/f:section">
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section">
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:entry) &gt;= 1">entry: minimum cardinality of 'entry' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section">
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:section</sch:title>
    <sch:rule context="f:Composition/f:section/f:section/f:section/f:section/f:section/f:section/f:section/f:section">
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &gt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language']) &lt;= 1">extension with URL = 'http://fhir.awmf.org/awmf.ig/StructureDefinition/ext-section-language': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:section) &lt;= 0">section: maximum cardinality of 'section' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
