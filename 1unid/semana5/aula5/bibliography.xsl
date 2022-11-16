<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Bibliography</title>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Category</th>
                            <th>Title</th>
                            <th>Year</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="bibliography/book">
                            <xsl:sort select="year" data-type="number"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <xsl:choose>
            <xsl:when test="year &lt; 2008">
                <tr style="background-color: bisque">
                    <td>
                        <xsl:value-of select="@category"/>
                    </td>
                    <td>
                        <xsl:value-of select="title" />
                    </td>
                    <td>
                        <xsl:value-of select="year" />
                    </td>
                    <td>
                        <xsl:value-of select="price" />
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test="year &gt;= 2008 and year &lt; 2010">
                <tr style="background-color: lightsalmon">
                    <td>
                        <xsl:value-of select="@category"/>
                    </td>
                    <td>
                        <xsl:value-of select="title" />
                    </td>
                    <td>
                        <xsl:value-of select="year" />
                    </td>
                    <td>
                        <xsl:value-of select="price" />
                    </td>
                </tr>
            </xsl:when>
            <xsl:otherwise>
                <tr style="background-color: lightblue">
                    <td>
                        <xsl:value-of select="@category"/>
                    </td>
                    <td>
                        <xsl:value-of select="title" />
                    </td>
                    <td>
                        <xsl:value-of select="year" />
                    </td>
                    <td>
                        <xsl:value-of select="price" />
                    </td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:transform>