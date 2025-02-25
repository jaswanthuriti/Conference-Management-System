<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Conference Management System</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function validate(formObj)
	{
	if(formObj.t1.value.length==0)
	{
	alert("Please Enter Username");
	formObj.t1.focus();
	return false;
	}
	if(formObj.t2.value.length==0)
	{
	alert("Please Enter Password");
	formObj.t2.focus();
	return false;
	}
	if(formObj.t3.value.length==0)
	{
	alert("Please Enter Qualification");
	formObj.t3.focus();
	return false;
	}
	if(formObj.t5.value.length==0)
	{
	alert("Please Enter Contact No");
	formObj.t5.focus();
	return false;
	}
	if(isNaN(formObj.t5.value)){
		alert("Contact no  must be numeric");
		formObj.t5.focus();
		return false;
	}
	if(formObj.t5.value.length != 10){
		alert("Contact number must be 10 digits long");
		formObj.t5.focus();
		return false;
	}
	if(formObj.t6.value.length==0)
	{
	alert("Please enter email id");
	formObj.t6.focus();
	return false;
	}
	var filter = /^([a-zA-Z0-9_\.\-])+\@([a-z]+\.)+(com)+$/;
    if (!filter.test(formObj.t6.value)) {
		window.alert('Please enter valid email address');
		formObj.t6.focus();
		return false;
	}
	if(formObj.t7.value.length==0)
	{
	alert("Please Enter Address");
	formObj.t7.focus();
	return false;
	}
	formObj.actionUpdateData.value="update";
	return true;
	}
	</script>
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
        </div>
        <div class="hbg"><img src="images/header_images.jpg" width="915" height="286" alt="" /></div>
      				<center>
<form name="f1" method="post" action="Register" onsubmit="return validate(this);"><br/>
   <h2><b>New User Registration Screen</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
						
						<table align="center" width="40" >
			 <tr><td><font size="3" color="black">Username</b></td><td><input type="text" name="t1" style="font-family: Comic Sans MS" size="40"/></td></tr>
         
		  <tr><td><font size="3" color="black">Password</b></td><td><input type="password" name="t2" style="font-family: Comic Sans MS" size="40"/></td></tr>

		   <tr><td><font size="3" color="black">Qualification</b></td><td><input type="text" name="t3" style="font-family: Comic Sans MS" size="40"/></td></tr>

		   <tr><td><font size="3" color="black">Interested&nbsp;Subjects</b></td><td><select name="t4" style="font-family: Comic Sans MS">
		   <option value="Computer Science">Computer Science</option>
		   <option value="Electronics">Electronics</option>
		   <option value="VLSI">VLSI</option>
		   <option value="Matlab Simulation">Matlab Simulation</option>
		   <option value="Other">Other</option>
		   </select>
		   </td></tr>

		   <tr><td><font size="3" color="black">Contact&nbsp;No</b></td><td><input type="text" name="t5" style="font-family: Comic Sans MS" size="20"/></td></tr>

		   <tr><td><font size="3" color="black">Email&nbsp;ID</b></td><td><input type="text" name="t6" style="font-family: Comic Sans MS" size="40"/></td></tr>

		   <tr><td><font size="3" color="black">Address</b></td><td><textarea name="t7" style="font-family: Comic Sans MS" rows="6" cols="50"></textarea></td></tr>

		    <tr><td><font size="3" color="black">User&nbsp;Type</b></td><td><select name="t8" style="font-family: Comic Sans MS">
		   <option value="Reviewers">Reviewers</option>
		   <option value="Authors">Authors</option>
		   </select>
		   </td></tr>
         
			<tr><td></td><td><input type="submit" value="Register"></td>
			</table>
				</div>	
					
				</div>
				
					
	</body>
</html>