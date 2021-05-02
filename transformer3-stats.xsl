<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Procedures Statistics</title>
                <link rel="stylesheet" href="styles.css" />
            </head>
            <body>
                <h1>Statistics</h1>
                <p>
                    <hr />
                </p>
                <table>
                    <tr>
                        <th>Client SSN</th>
                        <th>Client Name</th>
                        <th>Insurance Plan</th>
                        <th>Procedure Count</th>
                        <th>Procedure Total Cost</th>
                        <th>Procedure Average</th>
                        <th>Insurance Count</th>
                        <th>Insurance Total Cost</th>
                        <th>Insurance Coverage Average</th>
                        <th>Reimbursement Rate</th>
                    </tr>
                    <xsl:apply-templates select="invoices/invoice"></xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="invoice">
        <xsl:variable name="cost_sum" select="sum(procedure/@cost)" />
        <xsl:variable name="cost_count" select="count(procedure/@cost)" />
        <xsl:variable name="insurance_sum" select="sum(procedure/@insurance_estimate)" />
        <xsl:variable name="insurance_count" select="count(procedure/@insurance_estimate)" />
        <xsl:variable name="cost_avg" select="round($cost_sum div $cost_count)" />
        <xsl:variable name="insurance_avg" select="round($insurance_sum div $insurance_count)" />
        <tr>
            <td>
                <xsl:value-of select="patient/@SSN" />
            </td>
            <td>
                <xsl:value-of select="patient/@firstname" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="patient/@familyname" />
            </td>
            <td>
                <xsl:value-of select="insurance/@name" />
            </td>
            <td>
                <xsl:value-of select="$cost_count" />
            </td>
            <td>
                <xsl:value-of select="$cost_sum" />
            </td>
            <td>
                <xsl:value-of select="$cost_avg" /> 
            </td>
            <td>
                <xsl:value-of select="$insurance_count" />
            </td>
            <td>
                <xsl:value-of select="$insurance_sum" />
            </td>
            <td>
                <xsl:value-of select="$insurance_avg" /> 
            </td>
            <td>
                <xsl:value-of select="round($insurance_avg div $cost_avg * 100)" /> %
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
