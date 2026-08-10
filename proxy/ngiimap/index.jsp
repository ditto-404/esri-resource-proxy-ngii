<%@ page contentType="application/xml;charset=UTF-8" %><%@ page import="java.io.*" %><%
    // Some clients (observed with ArcGIS Enterprise Portal) reconstruct a KVP style
    // GetCapabilities request such as /ngiimap/?request=GetCapabilities&service=WMTS&version=1.0.0
    // instead of replaying the RESTful capabilities URL the layer was originally added with.
    // This file answers any request to /ngiimap/ with the same capabilities document, regardless
    // of query string, so that reconstruction still works.
    String path = application.getRealPath("/ngiimap/1.0.0/WMTSCapabilities.xml");
    BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"));
    String line;
    while ((line = br.readLine()) != null) {
        out.println(line);
    }
    br.close();
%>
