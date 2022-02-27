<?xml version="1.0" encoding="UTF-8"?>
<ctl:package xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:oereb="http://cadastre.ch/oereb">

  <ctl:suite name="oereb:oereb-test">
    <ctl:title>OEREB V2_0 test suite</ctl:title>
    <ctl:description>Checks the content of a note.</ctl:description>
    <ctl:starting-test>oereb:main</ctl:starting-test>

      <ctl:form xmlns="">
            <h3>Web Map Service 1.3.0</h3>

            <h4>Test Overview and Reference Implementations</h4>
            <p>Complete information about this test suite can be found <a href="." target="_blank">here</a>.</p>
            <p>Reference implementations can be found <a href="http://cite.opengeospatial.org/reference" target="_blank">here</a>.</p>

            <br/>
            <h4>Capabilities Setup</h4>
            <p>
               Enter a capabilities document URL below. The URL may point to a static capabilities document or a GetCapabilities request from a WMS. A typical GetCapabilities request will look as follows:
            </p>
            <pre>http://hostname/path?SERVICE=WMS&amp;REQUEST=GetCapabilities&amp;VERSION=1.3.0</pre>
            <br/>
            <blockquote>
               <table style="border: 1px solid blue;" padding="3">
                  <tr>
                     <td align="center">
                        <input name="capabilities-url" size="100" type="text" value=""/>
                     </td>
                     <td align="left">Capabilities URL</td>
                  </tr>
               </table>
            </blockquote>
            <br/>
            <h4>UpdateSequence Values</h4>
            <p>
               The WMS specification allows servers to use an UpdateSequence value for
               maintaining cache consistency as described in 
               <a href="http://cite.opengeospatial.org/OGCTestData/wms/1.3.0/spec/wms1_3.html#wmsops.getcapabilities.params.updatesequence">Section 7.2.3.5 of the specification</a>.
               If the server advertises an UpdateSequence value and the
               Automatic option is selected below, the test suite will attempt to
               test the UpdateSequence behavior automatically. However, the
               lexical ordering of UpdateSequence values is determined by the
               server, so the tests may not always be correct. If you suspect a
               problem, select the Manual option and enter the updateSequence
               values requested below.
            </p>
            <blockquote>
               <table border="3" padding="3">
                  <tr>
                     <td align="center">
                        <input checked="checked" name="updatesequence" type="radio" value="auto"/>
                     </td>
                     <td align="left">Automatic - The updateSequence tests will use automatically generated updateSequence values</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="updatesequence" type="radio" value="manual"/>
                     </td>
                     <td align="left">Manual - The updateSequence tests will use the values supplied below</td>
                  </tr>
               </table>
            </blockquote>
            <p>(Fill in these boxes if the Manual option is selected above)</p>
            <blockquote>
               <table border="3" padding="3">
                  <tr>
                     <td align="center">
                        <input name="high-updatesequence" size="25" type="text" value=""/>
                     </td>
                     <td align="left">A value that is lexically higher than the current updateSequence value</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="low-updatesequence" size="25" type="text" value=""/>
                     </td>
                     <td align="left">A value that is lexically lower than the current updateSequence value</td>
                  </tr>
               </table>
            </blockquote>
            <br/>
            <h4>Options</h4>
            <blockquote>
               <table border="3" padding="3">
                  <tr>
                     <td align="center">
                        <input name="basic" type="checkbox" value="basic" checked="checked"/>
                     </td>
                     <td align="left">BASIC - Test basic functionality that depends on the CITE dataset.  This option is required for certification.</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="queryable" type="checkbox" value="queryable" checked="checked"/>
                     </td>
                     <td align="left">QUERYABLE - Test GetFeatureInfo functionality that depends on the CITE dataset.</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="raster_elevation" type="checkbox" value="raster_elevation"/>
                     </td>
                     <td align="left">RASTER ELEVATION - Test the elevation dimension using the cite:Terrain raster dataset.</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="vector_elevation" type="checkbox" value="vector_elevation"/>
                     </td>
                     <td align="left">VECTOR ELEVATION - Test the elevation dimension using the cite:Lakes vector dataset.</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="time" type="checkbox" value="time"/>
                     </td>
                     <td align="left">TIME - Test the time dimension using the cite:Autos dataset.</td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input name="recommended" type="checkbox" value="recommended"/>
                     </td>
                     <td align="left">RECOMMENDATIONS - Test functionality which is recommended in the specification.</td>
                  </tr>
               </table>
            </blockquote>
            <br/>
            <input type="submit" value="OK"/>
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