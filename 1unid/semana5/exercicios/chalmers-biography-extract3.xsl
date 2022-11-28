<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Chalmer's Biography Extract</title>
            </head>
            <body>
                <xsl:apply-templates select="dictionary/entry/@birthplace">
                    <xsl:sort select="." order="ascending" />
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="@birthplace">
        <xsl:variable name="birthPlace" select=".[not(.=preceding::*)]" />
        <xsl:for-each select=".">
            <xsl:if test="count(preceding::entry/@birthplace[. = $birthPlace]) = 0">
                <h1><xsl:value-of select="." /></h1>
            </xsl:if>
            
            <ul>
                <xsl:for-each select="../title/csc">
                    <li><xsl:value-of select="." /></li>
                </xsl:for-each>
            </ul>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>