<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBCon"%>
<html>
<body>		
<%
try{
	String file_name = "none";
	String id = request.getParameter("t1").trim();
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select paper_name from uploadpapers where paper_id='"+id+"'");
	while(rs.next()){
		file_name = rs.getString(1);
	}
	String path = getServletContext().getRealPath("/")+"/UploadPapers/"+file_name;
	java.io.FileInputStream fin = new java.io.FileInputStream(path);
	byte b[] = new byte[fin.available()];
	fin.read(b,0,b.length);
	fin.close();
	response.setContentType("application/octet-stream");
	response.setContentLength((int)b.length);
    response.setHeader("Content-Disposition","attachment; filename=\""+file_name+"\"");
	java.io.OutputStream os = response.getOutputStream();
	os.write(b,0,b.length);
	os.flush();
	os.close();
	
}catch(Exception e){
	out.println("Exception :"+e);
}
		
		
		
%>

</body>
</html>