<html>
<head>
  <title>Echoing HTML Request Parameters</title>
</head>
<body>
  <%@ page import="java.io.*,java.util.*,java.lang.*" %>
  <%
  String url = request.getParameter("source");
  String vtype = request.getParameter("vformat");
  String extract = request.getParameter("extract");
  String aformat = request.getParameter("aformat");
  
  Runtime rt = Runtime.getRuntime();
  String command = "python /usr/local/bin/youtube-dl -F " + url;
  String s;
  try{
  Process p = rt.exec(command);
  
  BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
  int flag0 = 0;
  int flaga = 0;
  int flag1 = 0;
  int flag2 = 0; 
  int flag3 = 0;
  p.waitFor();
  if (p.exitValue() != 0 ){
	  %>
	  <h1 align="center">Invalid URL! please verify and retry...</h1>
	  <div align="center">
	  <input type="button" value="Return to URL validation" onclick="location.href='input.html'" />
	  </div>
  <%
  }else{
  while ((s = br.readLine()) != null){
    String format = s.split(" ", 3)[0];
  if (format.equals("140")){
	flag0 = 1;
  }
  if (format.equals("5")){
	flag1 = 1;
  }
  if (format.equals("18")){
	flag2 = 1;
  }
  if (format.equals("22")){
	flag3 = 1;
  }
  }%>
  <h1> Almost ready to go... <h1>
  <form method="post" action="process.php">
	<font size="3">Select file type to download </font>
	<select name = "type">
	  <%if (flag0 == 1){%>
	<option value="140">m4a</option>
	<%}
	if (flag1 == 1){%>
	<option value="5">flv</option>
	<%}
	if (flag2 == 1){%>
	<option value="18">mp4</option>
	<%}
	if (flag3 == 1){%>
	<option value="22">mp4-HQ</option>
	<%}%>
  </select>
	<input type="hidden" name="URL" value=<%=url%> />
	<input type="submit" value="DOWNLOAD" /><br></br>
	<input type="button" value="CANCEL" onclick="location.href='input.html'" />
	</form>
  
    
  	

  <%
	  }
  p.destroy();
  }catch (IllegalThreadStateException  e)
  {out.println(e.getMessage());}


  %>


	

</body>
</html>
