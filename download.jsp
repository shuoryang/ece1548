<html>
<head>
  <title>Echoing HTML Request Parameters</title>
</head>
<body>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
  <%
  response.setContentType("application/octet-stream");
  response.setHeader("Content-Disposition", "attachment;filename=111111.txt");
  
  File file = new File("C:\\Users\\Shuo\\Desktop\\1.txt");
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
