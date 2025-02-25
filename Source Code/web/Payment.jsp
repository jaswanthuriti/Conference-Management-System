<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Conference Management System</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function validate(formObj)
	{
	if(formObj.t3.value.length==0)
	{
	alert("Please Enter Card No");
	formObj.t3.focus();
	return false;
	}
	if(formObj.t4.value.length==0)
	{
	alert("Please Enter CVV No");
	formObj.t4.focus();
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
            <li><a href="UploadPaper.jsp">Upload Paper</a></li>
            <li><a href="CheckPaperStatus.jsp">Check Paper Status</a></li>
            <li><a href="Download.jsp">Download Invoice</a></li>
			<li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.jpg" width="915" height="286" alt="" /></div>
      				<center>
<form name="f1" method="post" action="PaymentAction.jsp" onsubmit="return validate(this);"><br/>
   <h2><b>Payment Screen</b></h2>
			<br/>
			<%
			
	String res = request.getParameter("t1");
	if(res != null){
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		out.println("<center><font size=3 color=red>"+res+"</font></center>");
	}%>
	
		
			<table align="center">
<tr><td><font size="3" color="black">Paper&nbsp;ID</td><td><input type="text" name="t1" size="15" value="<%=request.getParameter("t11")%>" readonly/></td></tr>

<tr><td><font size="3" color="black">Author&nbsp;Name</td><td><input type="text" name="t2" size="40" value="<%=request.getParameter("t2")%>" readonly/></td></tr>
<tr><td><font size="3" color="black">Paper&nbsp;Name</td><td><input type="text" name="t3" size="40" value="<%=request.getParameter("t3")%>" readonly/></td></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>
<tr><TH></TH><td><font size="4" color="black"><B>PAYMENT SECTION</B></font></td></tr>
<tr></tr><tr></tr><tr></tr><tr></tr>
<tr><th>Choose Payment Section.</th><td><input type="radio" name="payment" value="Scopus Index mode" size="15"/> Scopus Index mode 
    <input type="radio" name="payment" value="IEEE Digital Library" size="15"/> IEEE Digital Library 
    <input type="radio" name="payment" value="Google Scholar" size="15"/> Google Scholar </td></tr>


<tr><td></td><td><input type="submit" value="Submit"></td>
</td></tr></table>
</form>
			</table>
			</center><br /><div class="post">
				
				<div class="entry">
					
				</div>
			</div>
		</div>
		<!-- end content -->
		<!-- start sidebars -->
		
		<!-- end sidebars -->
		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end page -->
</div>
</body>
</html>


