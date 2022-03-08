<?xml version="1.0" encoding="UTF-8"?>
<ctl:package 
  xmlns:ctl="http://www.occamlab.com/ctl"
  xmlns:ctlp="http://www.occamlab.com/te/parsers"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:oereb="http://cadastre.ch/oereb"
>

  <ctl:suite name="oereb:oereb-test">
    <ctl:title>OEREB V2_0 test suite</ctl:title>
    <ctl:description>Checks the compliance of a ÖREB Webservice and DATA Extracts (V2.0).</ctl:description>
    <ctl:starting-test>oereb:main</ctl:starting-test>

      <ctl:form xmlns="" height="800">
          <div style="margin: 20px;">
            <h3>ÖREB Webservice 2.0</h3>

            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>

            <br/>
            <h4>ÖREB-Webservice</h4>
            <p>
               Basis-URL des ÖREB-Webservices: 
               <!--
               <br/>
               <br/>
               Richtig: <tt>https://example.com/oereb/</tt>
               <br/>
               Falsch: <tt>https://example.com/oereb/extract/xml/?EGRID=CH887722167773</tt>
               -->
            </p>
            <br/>
            <blockquote>
               <table style="border: 1px solid #D3D3D3;" padding="3">
                  <tr>
                     <td align="center">
                        <input name="base-url" size="100" type="text" value="https://prozessor-oereb.ur.ch/oereb/"/>
                     </td>
                     <td align="left">Basis-URL</td>
                  </tr>
               </table>
            </blockquote>
            <br/>
            <p>
               GetEGRID-Parameter: 
            </p>
            <br/>
            <blockquote>
               <table style="border: 1px solid #D3D3D3;" padding="3">
                  <tr>
                     <td align="center">
                        <input name="en-coord" size="100" type="text" value="2690481.2,1195464.8"/>
                     </td>
                     <td align="left">E/N-Landeskoordinaten (LV95)</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="gnss-coord" size="100" type="text" value="46.90413,8.62621"/>
                     </td>
                     <td align="left">GNSS-Positionskoordinaten (WGS84)</td>
                  </tr>
               </table>
            </blockquote>
            <br/>
            <h4>Optionen</h4>
            <blockquote>
               <table style="border: 1px solid #D3D3D3;" padding="3">
                  <tr>
                     <td align="center">
                        <input name="getegrid" type="checkbox" value="getegrid" checked="checked"/>
                     </td>
                     <td align="left">GetEGRID - Prüft die GetEgrid()-Funktion.</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="getextractbyid" type="checkbox" value="getextractbyid" checked="checked"/>
                     </td>
                     <td align="left"><strike>GetExtractById - Prüft die GetExtractById()-Funktion.</strike></td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="getcapabilities" type="checkbox" value="getcapabilities" checked="checked"/>
                     </td>
                     <td align="left"><strike>GetCapabilities - Prüft die GetCapabilities()-Funktion.</strike></td>
                  </tr>
               </table>
            </blockquote>
            <br/>
            <input type="submit" value="OK"/>
          </div>
      </ctl:form>

  </ctl:suite>


  <ctl:test name="oereb:main">
    <ctl:param name="base-url"/>
    <ctl:param name="en-coord"/>
    <ctl:assertion>OEREB Main</ctl:assertion>
    <ctl:code>
      <ctl:message>Base-URL: <xsl:value-of select="$base-url"/></ctl:message>
      <ctl:call-test name="oereb:getegrid">
              <ctl:with-param name="base-url" select="$base-url"/>
              <ctl:with-param name="en-coord" select="$en-coord"/>
      </ctl:call-test>

      <!--
      <ctl:call-test name="oereb:pass"/>
      <ctl:call-test name="oereb:fail"/>
      <ctl:call-test name="oereb:form">
              <ctl:with-param name="base-url" select="$base-url"/>
      </ctl:call-test>
      -->
      <!--
      <xsl:if test="1">
        <ctl:fail/>
      </xsl:if>
      -->
    </ctl:code>
  </ctl:test>

  <ctl:test name="oereb:getegrid">
    <ctl:param name="base-url"></ctl:param>
    <ctl:param name="en-coord"></ctl:param>

    <ctl:assertion>GetEGRID</ctl:assertion>
    <ctl:code>
      <xsl:variable name="response">

        <ctl:request>
          <ctl:url><xsl:value-of select="$base-url"/>/getegrid/xml/?en=<xsl:value-of select="$en-coord"/></ctl:url>        
          <ctl:method>GET</ctl:method>
          <ctlp:XMLValidatingParser>
            <ctlp:schemas>
              <ctlp:schema type="url">http://schemas.geo.admin.ch/V_D/OeREB/2.0/Extract.xsd</ctlp:schema>
              <!--<ctlp:schema type="file">resources/schemas/Extract.xsd</ctlp:schema>-->
            </ctlp:schemas>
          </ctlp:XMLValidatingParser>
        </ctl:request>
      </xsl:variable> 
      <xsl:if test="not($response/*)">
        <ctl:message>[FAIL] Missing or invalid response entity.</ctl:message>
        <ctl:fail />
      </xsl:if>
    </ctl:code>
  </ctl:test>




  <ctl:test name="oereb:pass">
    <ctl:assertion>Pass</ctl:assertion>
    <ctl:code>
    </ctl:code>
  </ctl:test>

  <ctl:test name="oereb:fail">
    <ctl:assertion>Fail</ctl:assertion>
    <ctl:code>
      <ctl:fail/>
    </ctl:code>
  </ctl:test>

  <ctl:test name="oereb:form">
    <ctl:param name="base-url"></ctl:param>
    <ctl:assertion>Form</ctl:assertion>
    <ctl:code>
    <!--
      <xsl:variable name="form-values">
        <ctl:form>
          <p>Select an XML file:</p>
          <input name="myupload" type="file" />
          <br/>
          <input type="submit" value="OK" />
          <ctl:parse file="myupload" />
        </ctl:form>
      </xsl:variable>
      <ctl:message>Base-URL: <xsl:value-of select="$base-url"/></ctl:message>
      <ctl:message>
        <xsl:text>The root element is named </xsl:text>
        <xsl:value-of select="name($form-values/values/value[@key='myupload']/*) "/>
      </ctl:message>
      -->
      <xsl:variable name="form-values">
        <ctl:form>
          <p>
            <img src="http://www.google.com/intl/en/images/logo.gif"/><br/>
            Do you see the Google logo?<br/>
            <input type="submit" name="answer" value="yes"/>
            <input type="submit" name="answer" value="no"/>
          </p>
        </ctl:form>
      </xsl:variable>
      <ctl:message>
        <xsl:text>The answer is </xsl:text>
        <xsl:value-of select="$form-values/values/value[@key='answer'] "/>
      </ctl:message>
      <xsl:if test="$form-values/values/value[@key='answer']='no'">
        <ctl:fail/>
      </xsl:if>
    </ctl:code>
  </ctl:test>


</ctl:package>