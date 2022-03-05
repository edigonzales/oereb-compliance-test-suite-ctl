<?xml version="1.0" encoding="UTF-8"?>
<ctl:package xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:oereb="http://cadastre.ch/oereb">

  <ctl:suite name="oereb:oereb-test">
    <ctl:title>OEREB V2_0 test suite</ctl:title>
    <ctl:description>Checks the compliance of a ÖREB Webservice and DATA Extracts (V2.0).</ctl:description>
    <ctl:starting-test>oereb:main</ctl:starting-test>

      <ctl:form xmlns="">
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
                        <input name="capabilities-url" size="100" type="text" value="https://oereb-ur-proc.geocloud.ch/oereb/"/>
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
    <ctl:assertion>The heading contains more than whitespace.</ctl:assertion>
    <ctl:code>
      <xsl:if test="1">
        <ctl:fail/>
      </xsl:if>
    </ctl:code>
  </ctl:test>

</ctl:package>