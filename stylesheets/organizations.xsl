<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xhtml" indent="yes" encoding="utf-8"/>

    <xsl:template match="/">
        <xsl:apply-templates/>        
    <xsl:call-template name="footer"/>
    </xsl:template>

    <xsl:template match="idno">
        <xsl:choose>
            <xsl:when test="parent::org">
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
    
    <xsl:template match="desc">
        <xsl:if test="@xml:lang = 'en'">
            <div>
                <label>Description: </label>
                <xsl:apply-templates/>
            </div>
        </xsl:if>
        <xsl:if test="@xml:lang = 'sv'">
            <div>
                <label>Beskrivning: </label>
                <xsl:apply-templates/>
            </div>
        </xsl:if>
    </xsl:template>
    <xsl:template match="orgName">
        <xsl:choose>
            <xsl:when test="parent::org">
                <xsl:if test="@xml:lang = 'en'">
                    <div>
                        <label>Name of organization (English): </label>
                        <xsl:value-of select=".[@xml:lang = 'en']"/>
                    </div>
                </xsl:if>
                <xsl:if test="@xml:lang = 'sv'">
                    <div>
                        <label>Name of organization (Swedish): </label>
                        <xsl:value-of select=".[@xml:lang = 'sv']"/>
                    </div>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <a href="../{data(substring-after(@ref, 'https://www.manuscripta.se/'))}">
                    <xsl:value-of select="normalize-space(.)"/>
                </a>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="placeName">
        <div>
            <label>Place of organization: </label>
            <xsl:value-of select="."/>
        </div>
    </xsl:template>
    <xsl:template match="title">
        <h1 class="page-header">
            <xsl:value-of select="//titleStmt/title"/>
        </h1>
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
                <a href="/org/{data(substring-after(TEI/@xml:id, 'org-'))}.xml">
                    <xsl:text>https://www.manuscripta.se/org/</xsl:text>
                    <xsl:value-of select="data(substring-after(TEI/@xml:id, 'org-'))"/>
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