<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no" encoding="UTF-8"/>

<xsl:key name="type" match="node" use="object_type" />

<xsl:template match="/">
\documentclass{article}
\usepackage{amsmath,amssymb}

\title{Math library}
\begin{document}
\maketitle

\section{Graph}

\section{Definitions}
<xsl:for-each select="key('type','Definition')">
  <xsl:sort select="object_name"/>
  \subsection{<xsl:value-of select="object_name"/>}\label{<xsl:value-of select="key"/>}
  <xsl:value-of select="attributed_text"/>
</xsl:for-each>

\section{Theorems}
<xsl:for-each select="key('type','Theorem')">
  <xsl:sort select="object_name"/>
  \subsection{<xsl:value-of select="object_name"/>}
  <xsl:value-of select="attributed_text"/>
</xsl:for-each>

\section{Proofs}
<xsl:for-each select="key('type','Proof')">
  <xsl:sort select="object_name"/>
  \subsection{<xsl:value-of select="object_name"/>}
  <xsl:value-of select="attributed_text"/>
</xsl:for-each>

<!-- <xsl:for-each select="graph/node[generate-id()=generate-id(key('type',object_type)[1])]/object_type"> -->
<!--   <xsl:value-of select="."/> -->
<!-- </xsl:for-each> -->
\end{document}
</xsl:template>
</xsl:stylesheet>
