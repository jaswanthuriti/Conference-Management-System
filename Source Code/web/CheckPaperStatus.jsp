<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBCon"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Conference Management System</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="logo">
        <h1><span>Conference Management System</span><small></small></h1>
      </div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="menu_nav">
        <ul>
            <li><a href="UploadPaper.jsp">Upload Paper</a></li>
            <li><a href="CheckPaperStatus.jsp">Check Paper Status</a></li>
              <li><a href="Download.jsp">Download Invoice</a></li>
			  	<li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.jpg" width="915" height="286" alt="" /></div>
      				<center>

   <h2><b>Check Your Paper Status Screen</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
			<table border="1" align="center" width="100%">
			<tr><th><font size="3" color="black">Paper ID</th><th><font size="3" color="black">Author Name</th><th><font size="3" color="black">File Name</th>
			<th><font size="3" color="black">Paper Title</th><th><font size="3" color="black">Description</th><th><font size="3" color="black">Paper Status</th><tr>
	<%
	String user = session.getAttribute("user").toString();
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from uploadpapers where author_name='"+user+"'");
	while(rs.next()){%>
	<tr><td><font size="3" color="black"><%=rs.getString(1)%></td>
	<td><font size="3" color="black"><%=rs.getString(2)%></td>
	<td><font size="3" color="black"><%=rs.getString(3)%></td>
	<td><font size="3" color="black"><%=rs.getString(4)%></td>
	<td><font size="3" color="black"><%=rs.getString(5)%></td>
	<%if(rs.getString(6).equals("Accepted")) {%>
	<td><a href="Payment.jsp?t11=<%=rs.getString(1)%>&t2=<%=rs.getString(2)%>&t3=<%=rs.getString("paper_name")%>"><font size="" color="white"><font size="" color="black">Accepted! Click Here to Make Payment</font></a></td>
	<%} else {%>
	<td><font size="3" color="black"><%=rs.getString(6)%></td>
	<%}}%>
	</tr>
	</table>
	</body>
</html>