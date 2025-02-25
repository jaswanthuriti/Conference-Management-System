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
<form name="f1" method="post" action="PaymentAction2.jsp" onsubmit="return validate(this);"><br/>
   <h2><b>Payment Screen</b></h2>
			<br/>
			<%
	String amount =request.getParameter("amount");
         String status=request.getParameter("status");  
         session.setAttribute("status",status);
         int months=0;
         if(status.equals("Yes")){
            months=Integer.parseInt(request.getParameter("months"));   
         }
         float aa=Float.parseFloat(amount);
         
         float t=aa/months;
         %>
	
		
			<table align="center">
<tr><td><font size="3" color="black">Paper&nbsp;ID</td><td><input type="text" name="t1" size="15" value="<%=request.getParameter("t1")%>" readonly/></td></tr>
<tr><td><font size="3" color="black">Author&nbsp;Name</td><td><input type="text" name="t2" size="40" value="<%=request.getParameter("t2")%>" readonly/></td></tr>
<tr><td><font size="3" color="black">Paper&nbsp;Name</td><td><input type="text" name="t3" size="40" value="<%=request.getParameter("t3")%>" readonly/></td></tr>
<tr><td><font size="3" color="black">Total&nbsp;Amount</td><td><input type="text" name="amount" size="40" value="<%=amount%>" readonly/></td></tr>
<%if(status.equals("Yes")){%>
<tr><td><font size="3" color="black">Months</td><td><input type="text" name="months" size="40" value="<%=months%>" readonly/></td></tr>
<tr><td><font size="3" color="black">Every Months</td><td><input type="text" name="emi" size="40" value="<%=t%>" readonly/></td></tr>
<tr><td><font size="3" color="black">Card&nbsp;No</td><td><input type="number" name="cardno" size="40" required/></td></tr>
<tr><td><font size="3" color="black">Card&nbsp;CVV</td><td><input type="number" name="cvv" size="40" required/></td></tr>
<%}else{%>
<tr><td><font size="3" color="black">Card&nbsp;No</td><td><input type="number" name="cardno" size="40" required/></td></tr>
<tr><td><font size="3" color="black">Card&nbsp;CVV</td><td><input type="number" name="cvv" size="40" required/></td></tr>
<%}%>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script>
     $('input[name="status"]').on('click', function() {
    if ($(this).val() === 'Yes') {
        $('#skey').removeProp("disabled");
    }
    else {
        $('#skey').prop("disabled", "disabled");
    }
});
     
 </script>
</body>
</html>


