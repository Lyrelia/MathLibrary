<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no" encoding="UTF-8"/>

<xsl:key name="type" match="node" use="object_type"/>

<xsl:template match="/">
digraph {
<!-- <xsl:for-each select="graph/node[generate-id()=generate-id(key('type',object_type)[1])]"> -->
<!--   node[color=red] -->
<!--   <xsl:for-each select="graph/node[object_type=current()/object_type]"> -->
<!--     test -->
<!--   </xsl:for-each> -->
<!-- </xsl:for-each> -->

  <xsl:for-each select="graph/node">
    <xsl:value-of select="key" /> [name="<xsl:value-of select="object_name" />",color=<xsl:choose>
      <xsl:when test="object_type='Definition'">red</xsl:when>
      <xsl:when test="object_type='Theorem'">gree</xsl:when>
      <xsl:when test="object_type='Proof'">blue</xsl:when>
      <xsl:otherwise>black</xsl:otherwise>
    </xsl:choose>]
    <xsl:for-each select="children/t">
      <xsl:value-of select="../../key"/><xsl:value-of select="' -> '"/><xsl:value-of select="."/>;
    </xsl:for-each>
  </xsl:for-each>
<!--   node[color=red] // color of definiton nodes -->
<!--   <xsl:for-each select="graph/node[object_type='Definition']"> -->
<!--     <xsl:value-of select="key" /> [name="<xsl:value-of select="object_name" />"] -->
<!--   </xsl:for-each> -->
<!--   node[color=green] // color of definiton nodes -->
<!--   <xsl:for-each select="graph/node[object_type='Theorem']"> -->
<!--     <xsl:value-of select="key" /> [name="<xsl:value-of select="object_name" />"] -->
<!--   </xsl:for-each> -->
<!--   node[color=blue] // color of definiton nodes -->
<!--   <xsl:for-each select="graph/node[object_type='Proof']"> -->
<!--     <xsl:value-of select="key" /> [name="<xsl:value-of select="object_name" />"] -->
<!--   </xsl:for-each> -->
}
</xsl:template>
</xsl:stylesheet>
