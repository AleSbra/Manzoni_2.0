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
                                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                                        
                                     
                                        }
                                        .rdg_sub{
                                        font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                                        font-size: 12px;
                                        text-align: justify;
                                        color: #086604;}
                                        
                                        .dropdown-menu{position:absolute;top:100%;z-index:1000;display:none;min-width:160px;padding:5px 0;margin:2px 0 0;font-size:14px;text-align:left;list-style:none;background-color:#fff;left:auto;
                                        -webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #ccc;
                                        border:1px solid rgba(0,0,0,.15);border-radius:4px;-webkit-box-shadow:0 6px 12px rgba(0,0,0,.175);box-shadow:0 6px 12px rgba(0,0,0,.175)}
                                        
                                    </style>
                                </head>
                                <body>
                                    <div class="container">
                                    <h2><xsl:value-of select="concat(ancestor::tei:div/@n, ': ' , tei:lem/@n)"/></h2>
                                    <div>
                                        <xsl:for-each select="tei:lem"><xsl:apply-templates/></xsl:for-each>
                                    </div>
                                    <ol>
                                        <xsl:for-each select="tei:rdg">
                                            <li class="rdg"><xsl:apply-templates/></li>
                                        </xsl:for-each>
                                    </ol>
                                    <!--<xsl:for-each select="tei:lem/tei:app">
                                        <p><xsl:apply-templates select="tei:lem"></xsl:apply-templates></p>
                                        <ol><xsl:choose>
                                            <xsl:when test="tei:rdg/tei:del">
                                                <li class="del"><xsl:value-of select="tei:rdg/tei:del/text()"/></li>
                                            </xsl:when>
                                            <xsl:when test="tei:rdg">
                                                <li class="rdg_sub"><xsl:value-of select="tei:rdg/text()"/></li>
                                            </xsl:when>
                                        </xsl:choose></ol>
                                    </xsl:for-each>-->
                                    </div>     
                           </body>
            </html>
                        </xsl:result-document>
                    </xsl:for-each>
               
        
    </xsl:template>
    
    <xsl:template match="tei:app[ancestor::tei:app]">
        <div class="dropdown"  style="display:inline-block">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown"><xsl:value-of select="tei:lem"/><span class="caret"></span></button>
            <ul class="dropdown-menu"><li><a><xsl:value-of select="tei:rdg"/></a></li></ul>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <i><xsl:text>prima: </xsl:text></i><xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:desc">
        <i><xsl:text> (</xsl:text><xsl:apply-templates/><xsl:text>) </xsl:text></i>
    </xsl:template>
    
</xsl:stylesheet>