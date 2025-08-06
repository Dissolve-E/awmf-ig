<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile RecommendationJustification
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ArtifactAssessment/f:content</sch:title>
    <sch:rule context="f:ArtifactAssessment/f:content">
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:relatesTo) &gt;= 1">relatesTo: minimum cardinality of 'relatesTo' is 1</sch:assert>
      <sch:assert test="count(f:relatesTo) &lt;= 1">relatesTo: maximum cardinality of 'relatesTo' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:relatesTo) &gt;= 1">relatesTo: minimum cardinality of 'relatesTo' is 1</sch:assert>
      <sch:assert test="count(f:relatesTo) &lt;= 1">relatesTo: maximum cardinality of 'relatesTo' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ArtifactAssessment/f:content/f:component</sch:title>
    <sch:rule context="f:ArtifactAssessment/f:content/f:component">
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &gt;= 1">classifier: minimum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:classifier) &lt;= 1">classifier: maximum cardinality of 'classifier' is 1</sch:assert>
      <sch:assert test="count(f:type) &gt;= 1">type: minimum cardinality of 'type' is 1</sch:assert>
      <sch:assert test="count(f:relatesTo) &gt;= 1">relatesTo: minimum cardinality of 'relatesTo' is 1</sch:assert>
      <sch:assert test="count(f:relatesTo) &lt;= 1">relatesTo: maximum cardinality of 'relatesTo' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
