<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:param name="crapp">sp</xsl:param>
    <xsl:template match="tei:teiHeader"/>
    <!--<xsl:template match="tei:del"/>-->
    <xsl:template match="tei:text/tei:body//tei:div[contains(@n, concat('_', $crapp))]">
        <xsl:choose>
            <xsl:when test="$crapp='sp'">
                <xsl:call-template name="apparato">
                    <xsl:with-param name="crapp">
                        <xsl:value-of select="$crapp"/>
                    </xsl:with-param>
                </xsl:call-template>
                
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="apparato">
                    <xsl:with-param name="crapp">
                        <xsl:value-of select="$crapp"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
<xsl:template name="apparato">
    <xsl:param name="crapp"/>
        <xsl:for-each select="tei:p/tei:app | tei:head/tei:app">
            <xsl:result-document href="puliti/{$crapp}/{tei:lem/@n}.html">
                <html>
                    <head>
                        <title>
                            <xsl:value-of select="concat(ancestor::tei:div/@n, ': ', tei:lem/@n)"/>
                        </title>
                        <link rel="stylesheet"
                            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"/>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/>
                        <style>
                            .title{
                            border: solid;
                            border-color:#5C9EAD;
                            margin-left:10%;
                            margin-right: 10%;
                            margin-top: 2px;
                            padding: 2px;}
                            h1{
                            font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            color: #eeeeee;
                            text-align: center;
                            font-weight: bolder;
                            font-size: 48px;
                            }
                            h2{font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            text-align: center;
                            text-align: center;
                            font-weight: bolder;}
                            
                            h3{font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            text-align: center;
                            text-align: center;}
                            
                            h4{font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            text-align: center;
                            text-align: center;}
                            
                            h5{font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                            color: #326273;
                            margin-top: 10px;
                            text-align: left}
                            
                            header{
                            background-color: #326273;
                            width: auto;
                            height: auto;
                            align-self: center;
                            align-content: center;
                            align-items: center;
                            float: none;
                            padding:3.5px;
                            margin-left: 10%;
                            margin-right: 10%;
                            margin-top: 2%;
                            }
                            body{
                            background-color: #eeeeee;
                            width: 100%;
                            border-radius: 25%;
                            height: auto;
                            }
                            
                            p{
                                font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", "DejaVu Sans", Verdana, "sans-serif";
                                font-size: 14px;
                                text-align: justify;
                                margin-top:10px;
                            }
                           
                            .dropdown-menu{
                                position: absolute;
                                top: 100%;
                                z-index: 1000;
                                display: none;
                                min-width: 160px;
                                padding: 5px 0;
                                margin: 2px 0 0;
                                font-size: 14px;
                                text-align: left;
                                list-style: none;
                                background-color: #fff;
                                left: auto;
                                -webkit-background-clip: padding-box;
                                background-clip: padding-box;
                                border: 1px solid #ccc;
                                border: 1px solid rgba(0, 0, 0, .15);
                                border-radius: 4px;
                                -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
                                box-shadow: 0 6px 12px rgba(0, 0, 0, .175)
                            }</style>
                    </head>
                    <body><header>
                        <h1 class="titolo">Dal <i>Fermo e Lucia</i> agli <i>Sposi Promessi</i></h1>
                    </header>
                        <div class="title">
                            <h2>Saggio di filologia degli scartafacci</h2>
                            <h4>Alessia Marini, Elena Pierazzo, Raffaele Viglianti</h4>
                        </div>
                        <div class="container">
                            <h2>Apparato <xsl:choose>
                                <xsl:when test="$crapp = 'sp'">Sposi Promessi</xsl:when>
                                <xsl:otherwise>Fermo e Lucia</xsl:otherwise>
                            </xsl:choose>
                            </h2>
                            <h3> 
                                <xsl:if test="preceding::tei:lem[parent::tei:app[parent::tei:p |parent::tei:head]][1][@n]">
                                        <a
                                            href="{preceding::tei:lem[parent::tei:app[parent::tei:p |parent::tei:head]][1][@n]/@n}.html"
                                            >&lt;&lt; </a>
                                    </xsl:if> 
                                
                                <xsl:text>Folio </xsl:text><xsl:value-of
                                    select="concat(substring-before(ancestor::tei:div/@n, '_'), ': frase', tei:lem/@n)"/> 
                                
                                
                                <xsl:if test="following::tei:lem[1][@n]">
                                        <a href="{following::tei:lem[1][@n]/@n}.html"> >></a>
                                    </xsl:if>
                              
                            </h3> 
                            <div>
                                <xsl:for-each select="tei:lem">
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                            </div>
                            <ol>
                                <xsl:for-each select="tei:rdg">
                                    <li class="rdg">
                                        <xsl:apply-templates/>
                                    </li>
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
        <div class="dropdown" style="display:inline-block">
            <button class="btn dropdown-toggle" type="button" data-toggle="dropdown">
                <xsl:apply-templates select="tei:lem"/>
                <span class="caret"/>
            </button>
            <ul class="dropdown-menu">
               <xsl:for-each select="tei:rdg"><li>
                    <a>
                        <xsl:choose>
                            <xsl:when test="@type='da'">
                                <i>da: </i>
                            </xsl:when>
                            <xsl:when test="@type='sps'">
                                <i>sps: </i>
                            </xsl:when>
                            <xsl:when test="@type='su'"> <xsl:choose>
                                <xsl:when test="@type='da'">
                                    <i>da: </i>
                                </xsl:when>
                                <xsl:when test="@type='sps'">
                                    <i>su: </i>
                                </xsl:when>
                            </xsl:choose> </xsl:when>
                        </xsl:choose> 
                       <xsl:apply-templates/>
                    </a>
                </li></xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:if test="@rend">
            <i><xsl:value-of select="@rend"/>: </i>
        </xsl:if>
        <span style="text-decoration:underline dashed"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:desc">
        <i>
            <xsl:text> (</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>) </xsl:text>
        </i>
    </xsl:template>
    
   

</xsl:stylesheet>
