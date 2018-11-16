<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:template match="tei:teiHeader"/>
    <!--<xsl:template match="tei:del"/>-->
    <xsl:template match="tei:text/tei:body/tei:div[@n]">
       
           
                    <xsl:for-each select="tei:p/tei:app">
                        <xsl:result-document href="puliti/{tei:lem/@n}.html">
                            <html>
                                <head>
                                    <title><xsl:value-of select="concat(ancestor::tei:div/@n, ': ' , tei:lem/@n)"/>
                                    </title>
                                    <style>
                                        p {
                                        font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                                        font-size: 14px;
                                        text-align: justify;
                                        }
                                        .del {
                                        font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                                        font-size: 12px;
                                        text-align: justify;
                                        color:#f44842;
                                        }
                                        .rdg{
                                        font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                                        font-size: 12px;
                                        text-align: justify;
                                        color: #086604;
                                        font-weight:bold;
                                        }
                                        .rdg_sub{
                                        font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                                        font-size: 12px;
                                        text-align: justify;
                                        color: #086604;}
                                    </style>
                                </head>
                                <body>
                                    <h1><xsl:value-of select="concat(ancestor::tei:div/@n, ': ' , tei:lem/@n)"/></h1>
                                    <p>
                                        <xsl:for-each select="tei:lem"><xsl:apply-templates/></xsl:for-each>
                                    </p>
                                    <ol>
                                        <xsl:for-each select="tei:rdg">
                                            <li class="rdg"><xsl:apply-templates/></li>
                                        </xsl:for-each>
                                    </ol>
                                    <xsl:for-each select="tei:lem/tei:app">
                                        <p><xsl:apply-templates select="tei:lem"></xsl:apply-templates></p>
                                        <ol><xsl:choose>
                                            <xsl:when test="tei:rdg/tei:del">
                                                <li class="del"><xsl:value-of select="tei:rdg/tei:del/text()"/></li>
                                            </xsl:when>
                                            <xsl:when test="tei:rdg">
                                                <li class="rdg_sub"><xsl:value-of select="tei:rdg/text()"/></li>
                                            </xsl:when>
                                        </xsl:choose></ol>
                                    </xsl:for-each>
                           </body>
            </html>
                        </xsl:result-document>
                    </xsl:for-each>
               
        
    </xsl:template>
</xsl:stylesheet>