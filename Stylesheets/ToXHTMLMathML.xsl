<?xml version='1.0' encoding="UTF-8"?>
<!--
"Multi-target document example for blahtexml"
blahtexml: an extension of blahtex with XML processing in mind
http://gva.noekeon.org/blahtexml

Copyright (c) 2010, Gilles Van Assche
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the names of the authors nor the names of their affiliation may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->
<xsl:stylesheet
    version="1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:d="http://gva.noekeon.org/blahtexml/exampledoc"
    xmlns:m="http://www.w3.org/1998/Math/MathML"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="d">

<xsl:import href="ToXHTML-common.xsl"/>

<xsl:output encoding="UTF-8"
  doctype-public = "-//W3C//DTD XHTML 1.1 plus MathML 2.0 plus SVG 1.1//EN"
  doctype-system = "http://www.w3.org/2002/04/xhtml-math-svg/xhtml-math-svg.dtd"/>

<xsl:template match="d:ieq">
    <span class="eq"><xsl:apply-templates select="m:math"/></span>
</xsl:template>

<xsl:template match="d:eq">
    <table class="equation" id="{generate-id()}">
    <tr><td class="eq"><xsl:apply-templates select="m:math"/></td><xsl:if test="@number!=''"><td class="number">(<xsl:value-of select="@number"/>)</td></xsl:if></tr>
    </table>
</xsl:template>

<xsl:template match="m:*">
    <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
    </xsl:copy>
</xsl:template>

<xsl:template match="m:*/text()">
    <xsl:value-of select="."/>
</xsl:template>

</xsl:stylesheet>
