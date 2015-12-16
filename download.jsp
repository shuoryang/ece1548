<html>
<head>
  <title>Echoing HTML Request Parameters</title>
</head>
<body>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
  <%
  String url = request.getParameter("URL");
  String vtype = request.getParameter("type");
  String fileName = request.getParameter("fileName");
  String downloadFileName = fileName.split("[/]")[1];
  String s1 = downloadFileName.split("[.]")[0];
  String s2 = downloadFileName.split("[.]")[1];
  StringBuilder ext = new StringBuilder("ext");
  ext.setCharAt(0, s2.charAt(0));
  ext.setCharAt(1, s2.charAt(1));
  ext.setCharAt(2, s2.charAt(2));
  response.setContentType("application/octet-stream");
  response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
  
  File file = new File("/var/lib/tomcat7/webapps/ece1548/data",s1 + "." + ext);
  
  FileInputStream fileIn = new FileInputStream(file);
  ServletOutputStream out1 = response.getOutputStream();

  byte[] outputByte = new byte[4096];
  //copy binary contect to output stream
  while(fileIn.read(outputByte, 0, 4096) != -1)
  {
	out1.write(outputByte, 0, 4096);
  }
  fileIn.close();
  out1.flush();
  out1.close();

  %>

  

	

</body>
</html>
