<?xml version="1.0" encoding="UTF-8"?>
  <!-- (c) by A. Hamacher -->
  <!-- published under M.I.T. Licence -->
  <!--
  	
  	Description:
  	
  	This xslt add the attribute Zposition to every Text element in the DCDM subtitleReel
  	The parameter globalZValue can be edited to position all the subtitles
  	with a certain depth position in front or behind the screen.
  	The value expresses a percentage of the MainPicture width.
  	A negative value positions the subtitles in front of the screen.
  	A positive value positions the subtitles behind the screen 
  	
  	-->
<xsl:stylesheet xmlns:input="http://www.smpte-ra.org/schemas/428-7/2014/DCST" version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:output omit-xml-declaration="no" indent="yes"/>
 <xsl:strip-space elements="*"/>
 
 <!-- Edit the Variable below to add Zposition for all Subtitles.
 	please add '.0' for decimals. 
 	negative percent value is in front of the screen 
 	-->
 	
 <xsl:variable name="globalZValue" select="'-1.0'"/>
 
 <!-- -->
    <xsl:template match="input:*" mode="copy-no-namespaces">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

 <!-- identity transform -->
  <xsl:template match="node()|@*">
     <xsl:copy>
       <xsl:apply-templates select="@* | node()"/>      
    </xsl:copy>
  </xsl:template>
  
  <!-- apply to copy -->
  <xsl:template match="input:Text">
   <xsl:copy>
   	  <xsl:apply-templates select="@*"/>
   	  <xsl:attribute name="Zposition"><xsl:copy-of select="$globalZValue" /></xsl:attribute>
   	  <xsl:apply-templates select="node()"/>
   </xsl:copy>
 </xsl:template>
  
</xsl:stylesheet>