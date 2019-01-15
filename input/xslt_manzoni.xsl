<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0" xmlns:svg="http://www.w3.org/2000/svg"
    exclude-result-prefixes="svg">
    <xsl:param name="mode" select="'writing_sp'"/>
    <xsl:template match="/" exclude-result-prefixes="svg">
        <xsl:for-each select="//tei:surfaceGrp">
            <xsl:variable name="surface-id" select="@xml:id"/>
            <xsl:variable name="op" select="concat(tei:surface[1]/@n, '-', tei:surface[2]/@n)"/>
            <xsl:result-document href="../output/{$mode}/{$op}-{$mode}.svg">
                <svg xmlns:cc="http://creativecommons.org/ns#"
                    xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg"
                    xmlns:xlink="http://www.w3.org/1999/xlink"
                    xmlns:dc="http://purl.org/dc/elements/1.1/"
                    width="{substring-before(tei:surface[1]/tei:graphic/@width, 'px')}"
                    height="{substring-before(tei:surface[1]/tei:graphic/@height, 'px')}"
                    viewBox="0 0 {substring-before(tei:surface[1]/tei:graphic/@width, 'px')} {substring-before(tei:surface[1]/tei:graphic/@height, 'px')}"
                    id="svg3170" version="1.1">
                    <defs id="defs3172"/>
                    <metadata>
                        <!-- metadatazione e selezione dei <change> da considerare al cambiare del parametro-->
                        <xsl:choose>
                            <xsl:when test="$mode = 'reading_sp'">
                                <xsl:for-each
                                    select="ancestor::tei:TEI/tei:teiHeader//tei:listChange[@xml:id = 'reading_sp']">
                                    <listChange xmlns="http://www.tei-c.org/ns/1.0">
                                        <xsl:for-each select="tei:change[@xml:id]">
                                            <xsl:if
                                                test="if ((for $c in ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone/tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()">
                                                <change ref="{@xml:id}">
                                                    <xsl:if test="@type = 'patch'">
                                                        <xsl:attribute name="type">
                                                            <xsl:value-of select="@type"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="target">
                                                            <xsl:value-of select="ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone[if ((for $c in tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()]/parent::tei:surface/@n"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="tei:desc"/>
                                                </change>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </listChange>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="$mode = 'reading_fl'">
                                <xsl:for-each
                                    select="ancestor::tei:TEI/tei:teiHeader//tei:listChange[@xml:id = 'reading_fl']">
                                    <listChange xmlns="http://www.tei-c.org/ns/1.0">
                                        <xsl:for-each select="tei:change">
                                            <xsl:if
                                                test="if ((for $c in ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone/tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()">
                                                <change ref="{@xml:id}">
                                                    <xsl:if test="@type = 'patch'">
                                                        <xsl:attribute name="type">
                                                            <xsl:value-of select="@type"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="target">
                                                            <xsl:value-of select="ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone[if ((for $c in tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()]/parent::tei:surface/@n"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="tei:desc"/>
                                                </change>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </listChange>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="$mode = 'writing_sp'">
                                <xsl:for-each
                                    select="ancestor::tei:TEI/tei:teiHeader//tei:listChange[@xml:id = 'writing_sp']">
                                    <listChange xmlns="http://www.tei-c.org/ns/1.0">
                                        <xsl:for-each select="tei:change">
                                            <xsl:if
                                                test="if ((for $c in ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone/tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()">
                                                <change ref="{@xml:id}">
                                                    <xsl:if test="@type = 'patch'">
                                                        <xsl:attribute name="type">
                                                            <xsl:value-of select="@type"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="target">
                                                            <xsl:value-of select="ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone[if ((for $c in tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()]/parent::tei:surface/@n"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="tei:desc"/>
                                                </change>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </listChange>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="$mode = 'writing_fl'">
                                <xsl:for-each
                                    select="ancestor::tei:TEI/tei:teiHeader//tei:listChange[@xml:id = 'writing_fl']">
                                    <listChange xmlns="http://www.tei-c.org/ns/1.0">
                                        <xsl:for-each select="tei:change">
                                            <xsl:if
                                                test="if ((for $c in ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone/tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()">
                                                <change ref="{@xml:id}">
                                                    <xsl:if test="@type = 'patch'">
                                                        <xsl:attribute name="type">
                                                            <xsl:value-of select="@type"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="target">
                                                            <xsl:value-of select="ancestor::tei:TEI//tei:surfaceGrp[@xml:id = $surface-id]//tei:zone[if ((for $c in tokenize(@change, '#') return normalize-space($c) = current()/@xml:id) = true()) then true() else false()]/parent::tei:surface/@n"/>
                                                        </xsl:attribute>
                                                    </xsl:if>
                                                    <xsl:value-of select="tei:desc"/>
                                                </change>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </listChange>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>0</xsl:otherwise>
                        </xsl:choose>
                        <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
                            <cc:Work rdf:about="">
                                <dc:format>image/svg+xml</dc:format>
                                <dc:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
                                <dc:title>
                                    <xsl:value-of select="tei:surface[1]/@n"/>
                                </dc:title>
                            </cc:Work>
                        </rdf:RDF>
                    </metadata>
                    <g id="layer1">
                        <!-- selezione dell'immagine e delle dimensioni -->
                        <image xlink:href="{tei:surface[1]/tei:graphic/@url}"
                            height="{substring-before(tei:surface[1]/tei:graphic/@height, 'px')}"
                            width="{substring-before(tei:surface[1]/tei:graphic/@width,'px')}"/>

                    <!-- ricerca dei @change all'interno delle zone per ogni parametro -->
                        <xsl:for-each select="tei:surface//tei:zone">
                            <xsl:variable name="ma_g">
                                <xsl:choose>
                                    <xsl:when test="$mode = 'reading_fl'">
                                        <xsl:choose>
                                            <xsl:when test="contains(@change, ' ')">
                                                <xsl:value-of
                                                  select="substring-after(substring-after(@change, ' '), '#')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="substring-after(@change, '#')"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="$mode = 'reading_sp'">
                                        <xsl:choose>
                                            <xsl:when test="contains(@change, ' ')">
                                                <xsl:value-of
                                                  select="substring-after(substring-after(@change, ' '), '#')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="substring-after(@change, '#')"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="$mode = 'writing_sp'">
                                        <xsl:choose>
                                            <xsl:when test="contains(@change, ' ')">
                                                <xsl:value-of
                                                  select="substring-before(substring-after(@change, '#'), ' ')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="substring-after(@change, '#')"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test="$mode = 'writing_fl'">
                                        <xsl:choose>
                                            <xsl:when test="contains(@change, ' ')">
                                                <xsl:value-of
                                                  select="substring-before(substring-after(@change, '#'), ' ')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="substring-after(@change, '#')"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:variable>
                            <g class="draggable" transform="matrix(1 0 0 1 0 0)">
                               <!-- selezione stile per le zone sia per poligoni che per rettangoli -->
                                <xsl:attribute name="id">
                                    <xsl:value-of select="$ma_g"/>
                                </xsl:attribute>
                                <xsl:if test="@corresp">
                                    <xsl:attribute name="data-patch" select="@corresp"/>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="@points">
                                        <polygon points="{@points}" id="{@xml:id}">
                                            <xsl:attribute name="style">

                                                <xsl:choose>
                                                    <xsl:when
                                                        test="//tei:listChange/tei:change[@xml:id = $ma_g][@type = 'refused']">
                                                        <xsl:text>fill:#54aedb;stroke:#4c4c4c;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;fill-opacity:0.5;</xsl:text>
                                                    </xsl:when>
                                                    <xsl:when
                                                        test="//tei:listChange/tei:change[@xml:id = $ma_g][@type = 'accepted']">
                                                        <xsl:text>fill:#f2ade1;stroke:#4c4c4c;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;fill-opacity:0.5;</xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:choose>
                                                            <xsl:when
                                                                test="tei:surface//tei:zone, @type = 'patch'">
                                                                <xsl:text>fill:#FFFFFF;stroke:#003399;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:5;fill-opacity:0.5;</xsl:text>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:text>fill:#F0E68C;stroke:#4c4c4c;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;fill-opacity:0.5;</xsl:text>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                        </polygon>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <rect id="{@xml:id}" width="{number(@lrx)-number(@ulx)}"
                                            height="{number(@lry)-number(@uly)}" x="{@ulx}"
                                            y="{@uly}" pippo="{$ma_g}">
                                            <xsl:attribute name="style">
                                                <xsl:choose>
                                                  <xsl:when
                                                  test="//tei:listChange/tei:change[@xml:id = $ma_g][@type = 'refused']">
                                                  <xsl:text>fill:#54aedb;stroke:#4c4c4c;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;fill-opacity:0.5;</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when
                                                  test="//tei:listChange/tei:change[@xml:id = $ma_g][@type = 'accepted']">
                                                  <xsl:text>fill:#f2ade1;stroke:#4c4c4c;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;fill-opacity:0.5;</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="tei:surface//tei:zone, @type = 'patch'">
                                                  <xsl:text>fill:#FFFFFF;stroke:#003399;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:5;fill-opacity:0.5;</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:text>fill:#F0E68C;stroke:#4c4c4c;stroke-width:1.28400004;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;fill-opacity:0.5;</xsl:text>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:attribute>
                                        </rect>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <!-- stile per il testo -->
                                <xsl:for-each select="tei:line | tei:space">
                                    <xsl:variable name="x-set">
                                        <xsl:choose>
                                            <xsl:when test="parent::tei:zone/@points">
                                                <xsl:choose>
                                                  <xsl:when test="@style">
                                                  <xsl:value-of
                                                  select="number(substring-after(@style, 'indent:'))"
                                                  />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of
                                                  select="number(substring-before(parent::tei:zone/@points, ',')) + 20"
                                                  />
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                  select="
                                                        parent::tei:zone/@ulx + 20 + (if (@style) then
                                                            number(substring-after(@style, 'indent:'))
                                                        else
                                                            0)"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:variable name="y-set">
                                        <xsl:variable name="font-size">
                                            <xsl:choose>
                                                <xsl:when
                                                  test="number(substring-after(parent::tei:zone/@style, 'font-size:'))"
                                                  >22</xsl:when>
                                                <xsl:otherwise>20</xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test="parent::tei:zone/@points">
                                                <xsl:value-of
                                                  select="number(substring-before(substring-after(parent::tei:zone/@points, ','), ' ')) + 30 + number($font-size) * position()"/>

                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of
                                                  select="parent::tei:zone/@uly + number($font-size) * position()"
                                                />
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:variable name="interlinea"
                                        select="number(substring-before(substring-after(parent::tei:zone/@rend, ':'), ' ')) * position()"/>
                                    <xsl:variable name="tab"
                                        select="number(substring-after(parent::tei:zone/@rend, ' '))"/>
                                    <text x="{$x-set}" y="{$y-set}" dy="{$interlinea}%" dx="{$tab}%"
                                        style="font-size:{if (contains(parent::tei:zone/@style, 'font-size')) then substring-after(parent::tei:zone/@style, 'font-size:') else '22'}px;font-family:Verdana;">
                                        <xsl:apply-templates/>
                                        <xsl:apply-templates select=".//tei:add[@place = 'above']"
                                            mode="interlinear"/>
                                        <xsl:apply-templates select=".//tei:add[@place = 'below']"
                                            mode="interlinear"/>
                                    </text>
                                </xsl:for-each>
                                <xsl:if test="//tei:zone/tei:delSpan">
                                    <xsl:apply-templates select="tei:delSpan"/>
                                </xsl:if>
                                <xsl:apply-templates select="tei:metamark[svg:svg]"/>
                            </g>
                        </xsl:for-each>

                    </g>
                </svg>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <!-- template per i <del> -->
    <xsl:template match="tei:del">
        <xsl:choose>
            <xsl:when test="@type">
                <xsl:text>[...]</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <tspan style="text-decoration:line-through" xmlns="http://www.w3.org/2000/svg">
                    <xsl:apply-templates/>
                </tspan>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:add[@place, 'above']/tei:del" mode="interlinear">
        <xsl:variable name="font-size">
            <xsl:choose>
                <xsl:when test="number(substring-after(parent::tei:zone/@style, 'font-size:24'))"
                    >18</xsl:when>
                <xsl:otherwise>14</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tspan
            style="text-decoration:line-through;font-size:{if (contains(ancestor::tei:zone/@style, 'font-size:24')) then $font-size else '18'}px;font-family:Verdana"
            dy="{if (preceding-sibling::tei:del[tei:add[@place='above'] | preceding-sibling::tei:add[@place='above']] ) then -($font-size+16)  else -($font-size+16)}"
            x="{substring-after(@style, 'indent:')}" xmlns="http://www.w3.org/2000/svg">
            <xsl:apply-templates mode="interlinear"/>
        </tspan>
    </xsl:template>
    <!-- template per il testo in corsivo -->
    <xsl:template match="tei:hi" mode="#all">
        <xsl:choose>
            <xsl:when test="@style = 'italic'">
                <tspan style="font-style:italic" xmlns="http://www.w3.org/2000/svg">
                    <xsl:apply-templates/>
                </tspan>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:metamark[svg:svg]" mode="#all">
        <path xmlns="http://www.w3.org/2000/svg">
            <xsl:copy-of select="svg:svg/svg:path/@*"/>
            <xsl:copy-of select="svg:svg/svg:path/*"/>
        </path>
    </xsl:template>
    <xsl:template match="tei:metamark/tei:desc"/>
    <!-- templates per gli <add> -->
    <xsl:template mode="interlinear" match="tei:add[@place = 'above']">
        <xsl:variable name="font-size">
            <xsl:choose>
                <xsl:when test="number(substring-after(parent::tei:zone/@style, 'font-size:24'))"
                    >18</xsl:when>
                <xsl:otherwise>14</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tspan
            style="font-size:{if (contains(ancestor::tei:zone/@style, 'font-size:24')) then $font-size else '18'}px;font-family:Verdana"
            dy="{if (preceding-sibling::tei:del[tei:add[@place='above'] | preceding-sibling::tei:add[@place='above']] ) then -($font-size +16)  else -($font-size+16)}"
            x="{substring-after(@style, 'indent:')}" xmlns="http://www.w3.org/2000/svg">
            <xsl:apply-templates mode="interlinear"/>
        </tspan>
    </xsl:template>

    <xsl:template mode="interlinear" match="tei:add[@place = 'below']">
        <xsl:variable name="dy-setting">
            <xsl:choose>
                <xsl:when test="preceding-sibling::tei:add[@place = 'below']">
                    <xsl:choose>
                        <xsl:when
                            test="number(substring-after(ancestor::tei:zone/@style, 'font-size:'))"
                            >18</xsl:when>
                        <xsl:otherwise>
                            <xsl:text>14</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="ancestor::tei:del/tei:add[@place = 'above']">
                    <xsl:choose>
                        <xsl:when
                            test="number(substring-after(ancestor::tei:zone/@style, 'font-size:'))"
                            >18</xsl:when>
                        <xsl:otherwise>
                            <xsl:text>14</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when
                            test="number(substring-after(ancestor::tei:zone/@style, 'font-size:')) + number(4)"
                            >18</xsl:when>
                        <xsl:otherwise>14</xsl:otherwise>
                    </xsl:choose>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="font-size">
            <xsl:choose>
                <xsl:when test="number(substring-after(ancestor::tei:zone/@style, 'font-size:'))"
                    >18</xsl:when>
                <xsl:otherwise>14</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tspan
            style="font-size:{if (contains(ancestor::tei:zone/@style, 'font-size')) then $font-size else '14'}px;font-family:Verdana"
            dy="{$dy-setting +32}" x="{substring-after(@style, 'indent:')}"
            xmlns="http://www.w3.org/2000/svg">
            <xsl:apply-templates/>
        </tspan>
    </xsl:template>
    <xsl:template mode="#all" match="tei:add[@place = 'margin']">
        <xsl:variable name="font-size">
            <xsl:choose>
                <xsl:when test="number(substring-after(ancestor::tei:zone/@style, 'font-size:'))"
                    >18</xsl:when>
                <xsl:otherwise>14</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tspan
            style="font-size:{if (contains(ancestor::tei:zone/@style, 'font-size')) then $font-size else '14'}px;font-family:Verdana;"
            x="{substring-after(@style, 'indent:')}" xmlns="http://www.w3.org/2000/svg">
            <xsl:apply-templates/>
        </tspan>
    </xsl:template>
    <xsl:template mode="#all" match="tei:add[@place = 'superimposed']">
        <tspan xmlns="http://www.w3.org/2000/svg" dx="-4" font-weight="bold">
            <xsl:apply-templates/>
        </tspan>
    </xsl:template>
    <xsl:template match="tei:delSpan[@rend = 'horizontal line']">
        <!--(solo se è id="{@xml:id}" width="{@lrx}" height="{@lry}"
        x="{@ulx}" y="{@uly}", manca quando è @points)-->
        <xsl:variable name="span" select="substring-after(@spanTo, '#')"/>
        <xsl:variable name="d" select="number(20)"/>
        <xsl:variable name="x1" select="ancestor::tei:zone[@ulx]/@ulx"/>
        <!--  <xsl:variable name="y" select="number(ancestor::tei:zone[@lrx]/@lry) + number($d)"/>-->
        <xsl:variable name="x2"
            select="following::tei:anchor[@xml:id = $span]/ancestor::tei:zone[1][@lrx]/@lrx"/>
        <xsl:variable name="y"
            select="number(following::tei:anchor[@xml:id = $span]/ancestor::tei:zone[1][@lrx]/@lry) - number($d)"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y} {$x2},{$y}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        />
    </xsl:template>
    <xsl:template match="tei:add[@place = 'above']"/>
    <xsl:template match="tei:add[@place = 'below']"/>
<!-- templates per definire i la visualizzazione dei diversi <delSpan> al variare delvalore di @rend -->
    <xsl:template match="tei:delSpan[@rend = 'cross']">
        <xsl:variable name="span" select="substring-after(@spanTo, '#')"/>
        <xsl:variable name="x1" select="ancestor::tei:zone[@ulx]/@ulx"/>
        <xsl:variable name="y1" select="ancestor::tei:zone[@ulx]/@uly"/>
        <xsl:variable name="x2"
            select="following::tei:anchor[@xml:id = $span]/ancestor::tei:zone[1][@lrx]/@lrx"/>
        <xsl:variable name="y2"
            select="following::tei:anchor[@xml:id = $span]/ancestor::tei:zone[1][@lrx]/@lry"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1} {$x2},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1} {$x1},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        />
    </xsl:template>

    <!-- <xsl:template match="tei:zone[@rendition='#mc']">
         <xsl:variable name="h" select="number(tei:zone/@lry) div number(10)"/>
         <xsl:variable name="l" select="number(tei:zone/@lrx) div number(10)"/>
        <xsl:variable name="x1" select="ancestor::tei:zone[@ulx]/@ulx"/>
        <xsl:variable name="y1" select="ancestor::tei:zone[@ulx]/@uly"/>
        <xsl:variable name="x2" select="ancestor::tei:zone[@lrx]/@lrx"/>
        <xsl:variable name="y2" select="ancestor::tei:zone[@lrx]/@lry"/>
        <path xmlns="http://www.w3.org/2000/svg"></path>
    </xsl:template>-->
    <xsl:template match="tei:delSpan[@rend = 'multiple crosses']">
        <!--(solo se è id="{@xml:id}" width="{@lrx}" height="{@lry}"
        x="{@ulx}" y="{@uly}", manca quando è @points) -->
        <xsl:variable name="span" select="substring-after(@spanTo, '#')"/>

        <xsl:variable name="h" select="138.3"/>
        <xsl:variable name="l" select="62.6"/>
        <xsl:variable name="x1" select="ancestor::tei:zone[@ulx]/@ulx"/>
        <xsl:variable name="y1" select="ancestor::tei:zone[@ulx]/@uly"/>
        <xsl:variable name="x2"
            select="following::tei:anchor[@xml:id = $span]/ancestor::tei:zone[1][@lrx]/@lrx"/>
        <xsl:variable name="y2"
            select="following::tei:anchor[@xml:id = $span]/ancestor::tei:zone[1][@lrx]/@lry"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1} {$x2},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+$l},{$y1} {$x2},{$y1+9*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+2*$l},{$y1} {$x2},{$y1+8*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+3*$l},{$y1} {$x2},{$y1+7*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+4*$l},{$y1} {$x2},{$y1+6*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+5*$l},{$y1} {$x2},{$y1+5*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+6*$l},{$y1} {$x2},{$y1+4*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+7*$l},{$y1} {$x2},{$y1+3*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+8*$l},{$y1} {$x2},{$y1+2*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+9*$l},{$y1} {$x2},{$y1+$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+$h} {$x1+9*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+2*$h} {$x1+8*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+3*$h} {$x1+7*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+4*$h} {$x1+6*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+5*$h} {$x1+5*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+6*$h} {$x1+4*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+7*$h} {$x1+3*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+8*$h} {$x1+2*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1},{$y1+9*$h} {$x1+$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1} {$x1},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+9*$l},{$y1} {$x1},{$y1+9*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+8*$l},{$y1} {$x1},{$y1+8*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+7*$l},{$y1} {$x1},{$y1+7*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+6*$l},{$y1} {$x1},{$y1+6*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+5*$l},{$y1} {$x1},{$y1+5*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+4*$l},{$y1} {$x1},{$y1+4*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+3*$l},{$y1} {$x1},{$y1+3*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+2*$l},{$y1} {$x1},{$y1+2*$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x1+$l},{$y1} {$x1},{$y1+$h}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+$h} {$x1+$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+2*$h} {$x1+2*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+3*$h} {$x1+3*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+4*$h} {$x1+4*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+5*$h} {$x1+5*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+6*$h} {$x1+6*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+7*$h} {$x1+7*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+8*$h} {$x1+8*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"/>
        <path xmlns="http://www.w3.org/2000/svg" d="M {$x2},{$y1+9*$h} {$x1+9*$l},{$y2}"
            style="fill:none;stroke:#4c4c4c;stroke-width:2px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
        />
    </xsl:template>
</xsl:stylesheet>
