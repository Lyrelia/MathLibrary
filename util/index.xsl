<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="no" encoding="UTF-8"/>

<xsl:key name="type" match="node" use="object_type" />

<xsl:template match="/">
\documentclass{article}
\usepackage{amsmath,amssymb}
\usepackage{hyperref}

\title{Math library}
\begin{document}
\maketitle

\ifdefined\HCode
\section{Graph}\label{index:graph}

\HCode{<img src="table.png" usemap="\#mathlib" />
<map id="mathlib" name="mathlib">
<xsl:for-each select="document('../table.map')/map/area">
  <area shape="poly" id="{@id}" title="{@title}" graphkey="{@href}" alt="" coords="{@coords}">
    <xsl:attribute name="href">test</xsl:attribute>
  </area>
  <!-- <  coords="<xsl:value-of select="@coords"/>" id="<xsl:value-of select="@id"/>" --> 
  <!-- graphkey="<xsl:value-of select="@href" />" shape="poly" alt=""]{<xsl:value-of select="@href"/><xsl:value-of select="@title"/> -->
</xsl:for-each>
</map>}

<xsl:for-each select="document('../table.map')/map/area">
\HCode{<div id='{@href}_tip' style='display: none'>}
  <xsl:value-of select="document('../table.xml')/graph/node[key=current()/@href]/attributed_text" />
\HCode{</div>}
</xsl:for-each>
\fi

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

\end{document}
</xsl:template>

<xsl:template match='@href'>
  <xsl:attribute name='graphkey'>
    <xsl:value-of select='.'/>
  </xsl:attribute>
  <xsl:attribute name='href'>
    <xsl:value-of select='.'/>.html</xsl:attribute>
    <!-- todo: point to file generated by htlatex -->
</xsl:template>

<xsl:template match='@*|node()'>
  <xsl:copy>
    <xsl:apply-templates select='@*|node()'/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
