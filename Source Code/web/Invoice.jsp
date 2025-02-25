

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
     
try{
   Connection con=DBCon.getCon();
   Statement st=con.createStatement();
   ResultSet r=st.executeQuery("select max(id) from payment where author_name='"+user+"'");
   int id=0;
   while(r.next()){
       id=r.getInt(1);
   }
   %>
    <centeR><a href="AuthorScreen.jsp">BACK</a></center>
    <center>
      
        <embed src="ViewPDF.jsp?id=<%=id%>" width="800" height="700"/>
    </center>
   <%
}catch(Exception e){
    System.out.println(e);
}
      

      
      %>
    </body>
</html>
