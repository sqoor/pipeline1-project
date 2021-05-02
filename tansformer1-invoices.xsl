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
                <h1>Invoices</h1>
                <p>
                    <hr />
                </p>
                <xsl:apply-templates select="invoices/invoice"></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="invoice">
        <table border="0">
            <tr>
                <td>
                    <h3>
                        Invoice #
                        <xsl:value-of select="@number" />
                        ,
                        <xsl:value-of select="@date" />
                    </h3>
                </td>
            </tr>
        </table>

        <table border="0">
            <tr valign="top">
                <td>
                    <xsl:apply-templates select="patient"></xsl:apply-templates>
                </td>
                <td>
                    <xsl:apply-templates select="insurance"></xsl:apply-templates>
                </td>
            </tr>
        </table>

        <P></P>
        <table>
            <caption>Client Procedures</caption>
            <tr>
                <th>Code</th>
                <th>Name</th>
                <th>Cost</th>
                <th>Insurance estimate</th>
                <th>Submitted</th>
            </tr>
            <xsl:apply-templates select="procedure" />
        </table>
        <p style="padding:10px">
            <hr />
        </p>
    </xsl:template>

    <xsl:template match="patient">
        To:
        <xsl:value-of select="@firstname" />
        <xsl:text> </xsl:text>
        <xsl:value-of select="@familyname" />
        <br />
        Account #
        <xsl:value-of select="@SSN" />
        <br />
        <xsl:value-of select="address/@line1" />
        <br />
        <xsl:if test="address/@line2!=''">
            <xsl:value-of select="address/@line2" />
            <br />
        </xsl:if>
        <xsl:value-of select="address/@city" />
        ,
        <xsl:value-of select="address/@state" />
        <xsl:value-of select="address/@zip" />
        <br />
    </xsl:template>

    <xsl:template match="insurance">
        <xsl:value-of select="@name" />
        <br />
        <xsl:value-of select="@planname" />
        <br />
        Plan #
        <xsl:value-of select="@plannumber" />
        <br />
        <xsl:value-of select="address/@line1" />
        <br />
        <xsl:if test="address/@line2!=''">
            <xsl:value-of select="address/@line2" />
            <br />
        </xsl:if>
        <xsl:value-of select="address/@city" />
        ,
        <xsl:value-of select="address/@state" />
        <xsl:value-of select="address/@zip" />
        <br />
        <xsl:value-of select="phone/@number" />
        <br />
    </xsl:template>

    <xsl:template match="procedure">
        <tr>
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
            <td>
                <xsl:value-of select="@submitted" />
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>