<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="2007.xml" --><!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0"
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8"/>
<xsl:template match="/">

<table>
  <thead>
    <tr>
      <th width="75">Date</th>
      <th width="75">Eff Date</th>
      <th width="15">Clr?</th>
      <th width="150">Party</th>
      <th width="150">Account</th>
      <th width="50">Amount</th>
      <th width="50">Balance</th>
    </tr>
  </thead>
  <tbody>
  <xsl:for-each select="ledger/entry">
    <tr>
      <td><xsl:value-of select="en-date"/></td>
      <td>
        <xsl:choose>
          <xsl:when test="en-date_eff">
            <xsl:value-of select="en-date_eff"/>
          </xsl:when>
          <xsl:otherwise>&nbsp;</xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="en-transaction/transaction/tr-cleared">
            <span class="cleared">*</span>
          </xsl:when>
          <xsl:otherwise>&nbsp;</xsl:otherwise>
        </xsl:choose>
      </td>
      <td><xsl:value-of select="en-payee"/></td>
      <td><xsl:value-of select="en-transactions/transaction/tr-account"/></td>
      <td><xsl:value-of select="en-transactions/transaction/tr-amount/value/amount"/></td>
      <td>0</td>
    </tr>
  </xsl:for-each>
  </tbody>
</table>
</xsl:template>
</xsl:stylesheet>