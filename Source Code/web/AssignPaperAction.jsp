<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DBCon"%>
<%
String pid=request.getParameter("pid");
String pname=request.getParameter("pname");
String reviewer=request.getParameter("reviewer");

try{
    Connection con = DBCon.getCon();
    Statement stmt = con.createStatement();
    ResultSet r=stmt.executeQuery("select count(*) from assignpaper where reviewer='"+reviewer+"'and pid='"+pid+"'");
    int ic=0;
    while(r.next()){
        ic=r.getInt(1);
    }
    if(ic==0){
    Statement stmt1 = con.createStatement();
    int i=stmt1.executeUpdate("insert into assignpaper values(null,'"+pid+"','"+pname+"','"+reviewer+"','waiting','waiting')");
    if(i>0){
       %>
       <script type="text/javascript">
           window.alert("Paper Assigned Successfully..!!");
           window.location="AViewPapers.jsp";
           
       </script>
       <%
    }else{
 %>
       <script type="text/javascript">
           window.alert("Paper Assigning Failed..!!");
           window.location="AViewPapers.jsp";
           
       </script>
       <%
}
}else{
%>
       <script type="text/javascript">
           window.alert("This Paper is Already Assigned to This User..!!");
           window.location="AViewPapers.jsp";
           
       </script>
       <%
}
}catch(Exception e){
    System.out.println(e);
}


%>