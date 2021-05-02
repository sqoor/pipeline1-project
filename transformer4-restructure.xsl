<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <ARTISTES>
            <xsl:apply-templates select="invoices/invoice">
                <xsl:sort select="ACTNOM" />
            </xsl:apply-templates>
        </ARTISTES>
    </xsl:template>

    <xsl:template match="invoice">
        <INVOICES>
            <INVOICE>
                <NUMBER>
                    <xsl:value-of select="@number" />
                </NUMBER>
                <DATE>
                    <xsl:value-of select="@date" />
                </DATE>
                <PATIENT>
                    <xsl:apply-templates select="patient" />
                </PATIENT>
                <INSURANCE>
                    <xsl:apply-templates select="insurance" />
                </INSURANCE>
                <PROCEDURES>
                    <xsl:apply-templates select="procedure" />
                </PROCEDURES>
            </INVOICE>
        </INVOICES>
    </xsl:template>

    <xsl:template match="patient">
        <NAME>
            <FIRSTNAME>
                <xsl:value-of select="@firstname" />
            </FIRSTNAME>
            <LASTNAME>
                <xsl:value-of select="@familyname" />
            </LASTNAME>
        </NAME>
        <PHONE>
            <xsl:apply-templates select="phone" />
        </PHONE>
        <ADDRESS>
            <xsl:apply-templates select="address" />
        </ADDRESS>
        <ADDRESS>
            <xsl:apply-templates select="address" />
        </ADDRESS>
    </xsl:template>

    <xsl:template match="phone">
        <xsl:for-each select="@*">
            <xsl:element name="{name()}">
                <xsl:value-of select="." />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="address">
        <xsl:for-each select="@*">
            <xsl:element name="{name()}">
                <xsl:value-of select="." />
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="insurance">
        <xsl:for-each select="@*">
            <xsl:element name="{name()}">
                <xsl:value-of select="." />
            </xsl:element>
        </xsl:for-each>
        <PHONE>
            <xsl:apply-templates select="phone" />
        </PHONE>
        <ADDRESS>
            <xsl:apply-templates select="address" />
        </ADDRESS>
    </xsl:template>

    <xsl:template match="procedure">
        <PROCEDURE>
        <xsl:for-each select="@*">
            <xsl:element name="{name()}">
                <xsl:value-of select="." />
            </xsl:element>
        </xsl:for-each>
    </PROCEDURE>
    </xsl:template>
</xsl:stylesheet>

