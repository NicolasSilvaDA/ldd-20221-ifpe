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
                            <th>Name</th>
                            <th>Death</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="dictionary/entry">
                            <xsl:sort select="@born" data-type="number"/>
                    </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="entry">
        <xsl:for-each select="title/csc">
            <tr>
                <td><xsl:value-of select="." /></td>
                <td><xsl:value-of select="../../@died" /></td>
            </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>