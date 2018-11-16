<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <xsl:template match="tei:teiHeader"/>
    <xsl:template match="tei:rdg/tei:del"/>
    
    <xsl:template match="tei:text/tei:body/tei:div[@n]">
        <xsl:result-document href="puliti/{@n}.html">
            <html>
                <head>
                    <title><xsl:value-of select=" concat(./tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title/text(), tei:div, @n)"/></title>
                <style>
                    p {
                    font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                    font-size: 12px;
                    text-align: justify;
                    }
                    del {
                    font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                    font-size: 12px;
                    text-align: justify;
                    color:#f44842;
                    }
                    rdg{
                    font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                    font-size: 12px;
                    text-align: justify;
                    color: #086604;
                    }
                </style>
                </head>
                <body>
                    <h1><xsl:value-of select="tei:head/text()"/></h1>
                    <xsl:for-each select="tei:p//tei:app">
                        <xsl:choose>
                            <xsl:when test="tei:lem">
                                <xsl:variable name="num" select="tei:lem, @n"/>
                                <p><xsl:value-of select="$num"/><xsl:apply-templates/></p>
                                
                            </xsl:when>
                       <!--     <xsl:when test="tei:lem//tei:app">
                                <xsl:choose>
                                    <xsl:when test="tei:lem">
                                        <p><xsl:apply-templates/></p>
                                    </xsl:when>
                                    <xsl:when test="tei:rdg/tei:del">
                                        <p class="del"><xsl:apply-templates/></p>
                                    </xsl:when>
                                </xsl:choose> 
                            </xsl:when>-->
                            <xsl:when test="tei:app/tei:rdg">
                                <p class="rdg"><xsl:number select="tei:rdg, @n"></xsl:number><xsl:apply-templates/></p>
                               
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>