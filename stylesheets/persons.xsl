<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xhtml" indent="yes" encoding="utf-8"/>
    <xsl:template match="/">
        <xsl:apply-templates/>
        <xsl:call-template name="footer"/>
    </xsl:template>
    <xsl:template match="addName">
        <div>
            <label>Additional name: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="birth">
        <div>
            <label>Birth: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="death">
        <div>
            <label>Death: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="forename">
        <div>
            <label>Forename: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="genName">
        <div>
            <label>Generational name: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="idno">
        <xsl:choose>
            <xsl:when test="parent::person">
                <div>
                    <label>
                        <xsl:value-of select="@subtype"/>: </label>
                    <a href="{.}">
                        <xsl:value-of select="."/>
                    </a>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="nameLink">
        <div>
            <label>Name link: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>

    <xsl:template match="note">
        <xsl:if test="@xml:lang = 'en'">
            <div>
                <label>Note: </label>
                <xsl:apply-templates/>
            </div>
        </xsl:if>
        <xsl:if test="@xml:lang = 'sv'">
            <div>
                <label>Anteckning: </label>
                <xsl:apply-templates/>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="occupation">
        <div>
            <label>Occupation: </label>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="persName">
        <xsl:choose>
            <xsl:when test="parent::person">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <a href="../{data(substring-after(@ref, 'https://www.manuscripta.se/'))}">
                    <xsl:value-of select="normalize-space(.)"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="residence">
        <div>
            <label>Residence: </label>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="roleName">
        <div>
            <label>Role name: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>

    <xsl:template match="surname">
        <div>
            <label>Surname: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>

    <xsl:template match="title">
        <h2 class="page-header">
            <xsl:value-of select="//titleStmt/title"/>
        </h2>
    </xsl:template>

    <xsl:template name="footer">
        <div>
            <div>
                <label>Manuscripta ID: </label>
                <xsl:value-of select="/TEI/@xml:id"/>
            </div>
            <div>
                <label>Stable URI: </label>
                <xsl:value-of select="//publicationStmt/idno[@subtype = 'Manuscripta']"/>
            </div>
            <div>
                <label>XML: </label>
                <a href="/person/{data(substring-after(TEI/@xml:id, 'person-'))}.xml">
                    <xsl:text>https://www.manuscripta.se/person/</xsl:text>
                    <xsl:value-of select="data(substring-after(TEI/@xml:id, 'person-'))"/>
                    <xsl:text>.xml</xsl:text>
                </a>
            </div>
            <div>
                <label>License: </label>
                <a rel="license" href="https://creativecommons.org/publicdomain/zero/1.0/">CC0 1.0 Universal</a>
            </div>
            <div>
                <label>Last revision: </label>
                <xsl:value-of select="//change/@when"/>

            </div>
        </div>
    </xsl:template>
    <xsl:template match="avalibility"/>

    <xsl:template match="funder"/>

    <xsl:template match="licence"/>

    <xsl:template match="publisher"/>

    <xsl:template match="respStmt"/>

    <xsl:template match="revisionDesc"/>

    <xsl:template match="sourceDesc"/>

    <xsl:template match="sponsor"/>

</xsl:stylesheet>