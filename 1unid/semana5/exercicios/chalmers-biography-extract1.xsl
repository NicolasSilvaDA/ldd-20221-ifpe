<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Chalmer's Biography Extract</title>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Century</th>
                            <th>Number of Births</th>
                            <th>Number of Deaths</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="dictionary/entry">
                            <xsl:sort select="floor(@born div 100)" data-type="number"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="entry">
        <xsl:for-each select=".">
            <xsl:variable name="birthCen" select="floor(@born div 100)"/>
            <xsl:variable name="deathCen" select="floor(@died div 100)"/>
            <xsl:if test="count(preceding-sibling::entry[floor(@born div 100) = $birthCen]) = 0 and count(preceding-sibling::entry[floor(@died div 100) = $birthCen]) = 0">
                <tr>
                    <td>
                        <xsl:value-of select="$birthCen"/>
                    </td>
                    <td>
                        <xsl:value-of select="count(//entry[floor(@born div 100) = $birthCen])"/>
                    </td>
                    <td>
                        <xsl:value-of select="count(//entry[floor(@died div 100) = $birthCen])"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="$birthCen != $deathCen">
                <xsl:if test="count(preceding-sibling::entry[floor(@born div 100) = $deathCen]) = 0 and count(preceding-sibling::entry[floor(@died div 100) = $deathCen]) = 0">
                <tr>
                    <td>
                        <xsl:value-of select="$deathCen"/>
                    </td>
                    <td>
                        <xsl:value-of select="count(//entry[floor(@born div 100) = $deathCen])"/>
                    </td>
                    <td>
                        <xsl:value-of select="count(//entry[floor(@died div 100) = $deathCen])"/>
                    </td>
                </tr>
            </xsl:if>
        </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>