<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no" encoding="UTF-8"/>

<xsl:template match="/">
digraph mathlib {
  <xsl:for-each select="graph/node">
    <xsl:value-of select="key" /> [label="<xsl:value-of select="object_name" />",color=<xsl:choose>
      <xsl:when test="object_type='Definition'">red</xsl:when>
      <xsl:when test="object_type='Theorem'">green</xsl:when>
      <xsl:when test="object_type='Proof'">blue</xsl:when>
      <xsl:otherwise>black</xsl:otherwise>
    </xsl:choose>,
    href="<xsl:value-of select="key"/>"];
  <xsl:for-each select="links/a">
    <xsl:value-of select="@href"/><xsl:value-of select="' -> '"/><xsl:value-of select="../../key"/>;
  </xsl:for-each>
  </xsl:for-each>
}
</xsl:template>
</xsl:stylesheet>
