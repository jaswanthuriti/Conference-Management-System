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
       <ul>  <li><a href="AdminScreen.jsp">Home</a></li>
           <li><a href="ViewAuthors.jsp">View Authors</a></li>
             <li><a href="ViewReviewers.jsp">View Reviewers</a></li>
            <li><a href="SendAdminRequest.jsp">Send Request to Super Admin</a></li>
             <li><a href="AViewPapers.jsp">View Papers</a></li>
            <li><a href="SendFeedback.jsp">Send Feedback to Author</a></li>
			  	<li><a href="Logout.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="hbg"><img src="images/header_images.jpg" width="915" height="286" alt="" /></div>
      				<center>

   <h2><b>View All Papers And Assign to Reviews</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=red>"+res+"</center></font>");
	}%>
			<table border="1" align="center" width="100%">
			<tr><th><font size="3" color="black">Paper ID</th><th><font size="3" color="black">Author Name</th><th><font size="3" color="black">File Name</th>
			<th><font size="3" color="black">Paper Title</th><th><font size="3" color="black">Description</th>
                        <th><font size="3" color="black">Paper Status</th>
                          <th><font size="3" color="black">Select&Assign</th>
                        </tr>
                            
	<%
	
	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from uploadpapers where paper_status='Pending'");
	while(rs.next()){%>
	<tr><td><font size="3" color="black"><%=rs.getString(1)%></td>
	<td><font size="3" color="black"><%=rs.getString(2)%></td>
	<td><font size="3" color="black"><%=rs.getString(3)%></td>
	<td><font size="3" color="black"><%=rs.getString(4)%></td>
	<td><font size="3" color="black"><%=rs.getString(5)%></td>
	<td><font size="3" color="black"><%=rs.getString(6)%></td>
        <td><font size="3" color="black"><a href="AViewPapers.jsp?id=<%=rs.getString(1)%>&fname=<%=rs.getString(3)%>">Select</a></td>
	</tr>
	<%}%>
	</table>
        
        <%String id=request.getParameter("id");
        String fname=request.getParameter("fname");
        
        if(id!=null){%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h2>Select Reviewer and Assign Paper</h2>
        <form action="AssignPaperAction.jsp" method="post">
        <table border="1" align="center">
            <tr><th><font size="3" color="black">Paper ID</th>
                <td><font size="3" color="black"><input type="text" name="pid" value="<%=id%>" readonly=""/></font></td></td></tr>
            <tr><th><font size="3" color="black">Paper Name</th>
                <td><font size="3" color="black"><input type="text" name="pname" value="<%=fname%>" readonly=""/></font></td></td></tr>
                <tr><th><font size="3" color="black">Select Reviewer</th>
                <td><font size="3" color="black"><select name="reviewer" required>
                            <option></option>
                            <%
                           
	Statement stmt1 = con.createStatement();
	ResultSet rs1 = stmt1.executeQuery("select * from signup where usertype='Reviewers'");
        while(rs1.next()){
            %>
            <option value="<%=rs1.getString("username")%>"><%=rs1.getString("username")%></option> 
            
            <%
        }                   
                            %>
                        </select></td></tr>   
             <tr><th><font size="3" color="black"></th>
                <td><font size="3" color="black"><input type="submit"  value="Assign"/></font></td></td></tr>
        </table>
                                </form>
<%}%>
	</body>
</html>