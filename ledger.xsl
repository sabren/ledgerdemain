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

<table width="817" border="1">
  <tr>
    <th width="94" scope="col">Date</th>
    <th width="94" scope="col">Eff Date</th>
    <th width="31" scope="col">Num</th>
    <th width="234" scope="col">Party</th>
    <th width="153" scope="col">Account</th>
    <th width="98" scope="col">Amount</th>
    <th width="67" scope="col">Balance</th>
    </tr>
  <xsl:for-each select="ledger/entry">
    <tr class="entry">
      <td><xsl:value-of select="en-date"/></td>
      <td><xsl:value-of select="en-date_eff"/></td>
      <td>&nbsp;</td>
      <td><xsl:value-of select="en-payee"/></td>
      <td><xsl:value-of select="en-transactions/transaction/tr-account"/></td>
      <td><xsl:value-of select="en-transactions/transaction/tr-amount/value/amount"/></td>
      <td>&nbsp;</td>
    </tr>
  </xsl:for-each>
  
</table>
</xsl:template>
</xsl:stylesheet>