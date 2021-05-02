<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Procedures Table</title>
                <link rel="stylesheet" href="styles.css" />
            </head>
            <body>
                <h1>Procedures</h1>
                <p>
                    <hr />
                </p>
                <table>
                    <tr>
                        <th>Client SSN</th>
                        <th>Client Name</th>
                        <th>Insurance Plan</th>
                        <th>Procedure Code</th>
                        <th>Procedure Name</th>
                        <th>Procedure Cost</th>
                        <th>Insurance estimate</th>
                    </tr>
                    <xsl:apply-templates select="invoices/invoice"></xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="invoice">
        <xsl:apply-templates select="procedure" />
    </xsl:template>

    <xsl:template match="procedure">
        <tr>
            <td>
                <xsl:value-of select="../patient/@SSN" />
            </td>
            <td>
                <xsl:value-of select="../patient/@firstname" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="../patient/@familyname" />
            </td>
            <td>
                <xsl:value-of select="../insurance/@name" />
            </td>
            <td>
                <xsl:value-of select="@code" />
            </td>
            <td>
                <xsl:value-of select="@name" />
            </td>
            <td>
                <xsl:value-of select="@cost" />
            </td>
            <td>
                <xsl:value-of select="@insurance_estimate" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
