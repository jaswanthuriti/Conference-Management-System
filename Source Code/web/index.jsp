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
            <li class="active"><a href="index.jsp">HOME</a></li>
            <li><a href="SuperAdminLogin.jsp">Super Admin Login</a></li>
            <li><a href="AdminLogin.jsp">Admin Login</a></li>
			<li><a href="ReviewerLogin.jsp">Reviewer Login</a></li>
			<li><a href="AuthorLogin.jsp">Authors Login</a></li>
             <li><a href="Register.jsp">New User Signup Here</a></li>
          </ul>
        </div>	<%
			
	String res = request.getParameter("t1");
	if(res != null){
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		out.println("<center><font size=3 color=red>"+res+"</font></center>");
	}%>
	
        <div class="hbg"><img src="images/header_images.jpg" width="915" height="286" alt="" /></div>
       <p align="justify"><font size="3" color="black" style="font-family: Comic Sans MS">Conference Management System </p>
 
 
  </body>
</html>
