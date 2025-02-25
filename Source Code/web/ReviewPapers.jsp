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
            <li><a href="ReviewPapers.jsp">Review Papers</a></li>
            <li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.jpg" width="915" height="286" alt="" /></div>
      				<center>

   <h2><b>Review Papers & Update Feedback Screen</b></h2>
   
	<%
            String user=(String)session.getAttribute("user");
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
			<table border="1" align="center" width="100%">
			<tr><th><font size="3" color="black">Paper ID</th><th><font size="3" color="black">Author Name</th><th><font size="3" color="black">File Name</th>
			<th><font size="3" color="black">Paper Title</th><th><font size="3" color="black">Description</th><th><font size="3" color="black">Download Paper for Review</th><th><font size="3" color="black">Update Status</th><tr>
	<%
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from uploadpapers u,assignpaper a where u.paper_id=a.pid and u.paper_status='Pending' and a.status='waiting' and a.reviewer='"+user+"'");
	while(rs.next()){%>
	<tr><td><font size="3" color="black"><%=rs.getString(1)%></td>
	<td><font size="3" color="black"><%=rs.getString(2)%></td>
	<td><font size="3" color="black"><%=rs.getString(3)%></td>
	<td><font size="3" color="black"><%=rs.getString(4)%></td>
	<td><font size="3" color="black"><%=rs.getString(5)%></td>
	<td><a href="DownloadFile.jsp?t1=<%=rs.getString(1)%>"><font size="" color="white"><font size="" color="black">Click Here</font></a></td>
	<td><a href="Feedback.jsp?t11=<%=rs.getString(1)%>&rid=<%=rs.getString("a.id")%>"><font size="" color="white"><font size="" color="black">Update Feedback</font></a></td>
	</tr>
	<%}%>
	</table>
	</body>
</html>