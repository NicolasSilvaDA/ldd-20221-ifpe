<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Futebol</title>
                <style>
                    table {
                        border: 1px solid black;
                        border-collapse: collapse;
                    }

                    th, tr {
                        margin: 5px;
                        padding: 5px;
                        border: 1px solid black;
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th>Colocação</th>
                            <th>Nome</th>
                            <th>Pontos</th>
                            <th>Vitórias</th>
                            <th>Empates</th>
                            <th>Derrotas</th>
                            <th>Nº de Gols Marcados</th>
                            <th>Nº de Gols Sofridos</th>
                            <th>Saldo de Gols</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="cb/rodada">

                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="rodada">
        <xsl:for-each select="//time">
            <xsl:variable name="timeAtual" select=".[not(.=preceding::*)]" />
            <xsl:variable name="qtdGolsMarc" select="sum(//gols[../time = $timeAtual])" />
            <xsl:variable name="qtdVit" select="count(gols[../time=$timeAtual] &gt; 0)" />
            <tr>
                <td>a</td>
                <td><xsl:value-of select="$timeAtual" /></td>
                <td>c</td>
                <td><xsl:value-of select="$qtdVit" /></td>
                <td>e</td>
                <td>f</td>
                <td><xsl:value-of select="$qtdGolsMarc" /></td>
                <td>h</td>
                <td>i</td>
            </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:transform>