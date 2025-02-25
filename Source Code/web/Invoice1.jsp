

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Invoice</title>
    </head>
    <body>
      <%
      String user=(String)session.getAttribute("user");
    String id=request.getParameter("id"); 
%>
    <centeR><a href="AuthorScreen.jsp">BACK</a></center>
    <center>
      
        <embed src="ViewPDF.jsp?id=<%=id%>" width="800" height="700"/>
    </center>
   
    </body>
</html>
