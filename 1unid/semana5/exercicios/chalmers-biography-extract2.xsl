<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Chalmer's Biography Extract</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select="dictionary/entry/title/csc">
                        <xsl:sort select="." order="descending"/>
                    </xsl:apply-templates>
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="title/csc">
        <xsl:for-each select=".[not(.=preceding::*)]">
            <xsl:variable name="biographedName" select="." />
            <xsl:if test="count(preceding-sibling::csc[. = $biographedName]) = 0">
                <li><xsl:value-of select="." /> | <xsl:value-of select="count(//title/csc[. = $biographedName])"/></li>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:transform>