<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:param name="fl-sp"></xsl:param>

    <xsl:template match="//tei:surfaceGrp/tei:surface[@n]">
        <xsl:choose>
            <xsl:when test="$fl-sp = 'sp'">
                <xsl:call-template name="contenuto">
                    <xsl:with-param name="fl-sp">
                        <xsl:value-of select="$fl-sp"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="contenuto">
                    <xsl:with-param name="fl-sp">
                        <xsl:value-of select="$fl-sp"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:del"/>

    <xsl:template name="contenuto">
        <xsl:param name="fl-sp"/>
        <xsl:result-document href="../testi/{$fl-sp}/{@n}.html">
            <html>
                <head>
                    <title>
                        <xsl:value-of select="$fl-sp"/>
                    </title>
                    <style>
                        h1{
                            font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            text-align: center;
                            text-align: center;
                            font-weight: bolder;
                            font-size: 16px;
                        }
                        h2{
                            font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            text-align: center;
                            font-size: 14px;
                        }
                        p{
                            font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            font-size: 12px;
                            text-align: justify;
                        }
                        .box{
                            text-decoration: none;
                            width: 350px;
                            height: 500px;
                            position: absolute;
                            text-align: center;
                            align-content: center;
                            align-items: center;
                            margin-top: 5%;
                            display: list-item;
                        }</style>
                </head>
                <body>
                    <div class="box">
                        <xsl:for-each select=".//tei:zone[contains(@change, concat('#r', $fl-sp))]">

                            <xsl:choose>
                                <xsl:when test="tei:line[@type = 'title']">
                                    <h1>
                                        <xsl:value-of select="tei:line/text()"/>
                                    </h1>
                                </xsl:when>
                                <xsl:when test="tei:line[@type = 'subtitle']">
                                    <h2>
                                        <xsl:value-of select="tei:line/text()"/>
                                    </h2>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p>
                                        <xsl:apply-templates/>
                                    </p>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

<xsl:template match="tei:teiHeader"/>
</xsl:stylesheet>
