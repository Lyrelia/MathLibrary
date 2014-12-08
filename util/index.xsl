<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" indent="no" encoding="UTF-8"/>

<xsl:key name="type" match="node" use="object_type" />

<xsl:template match="/">
\documentclass{article}
\usepackage{amsmath,amssymb}
\usepackage{hyperref}

\title{Math library}
\begin{document}
\maketitle

\section{Graph}\label{index:graph}

\section{Definitions}
<xsl:for-each select="key('type','Definition')">
  <xsl:sort select="object_name"/>
  \subsection{<xsl:value-of select="object_name"/>}\label{<xsl:value-of select="key"/>}
  \noindent\hyperref[index:graph]{Back to graph}

  <xsl:value-of select="attributed_text"/>

  \noindent\hyperref[index:graph]{Back to graph}
</xsl:for-each>

\section{Theorems}
<xsl:for-each select="key('type','Theorem')">
  <xsl:sort select="object_name"/>
  \subsection{<xsl:value-of select="object_name"/>}
  \noindent\hyperref[index:graph]{Back to graph}
  
  <xsl:value-of select="attributed_text"/>

  \noindent\hyperref[index:graph]{Back to graph}
</xsl:for-each>

\section{Proofs}
<xsl:for-each select="key('type','Proof')">
  <xsl:sort select="object_name"/>
  \subsection{<xsl:value-of select="object_name"/>}
  \noindent\hyperref[index:graph]{Back to graph}

  <xsl:value-of select="attributed_text"/>

  \noindent\hyperref[index:graph]{Back to graph}
</xsl:for-each>

<!-- <xsl:for-each select="graph/node[generate-id()=generate-id(key('type',object_type)[1])]/object_type"> -->
<!--   <xsl:value-of select="."/> -->
<!-- </xsl:for-each> -->
\end{document}
</xsl:template>
</xsl:stylesheet>
