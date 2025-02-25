
<%@page import="com.DBCon"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

String id=request.getParameter("id");


  Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con=DBCon.getCon();
        stmt=con.createStatement();
           rs = stmt.executeQuery("select invoice from payment where id = '" +id + "' ");
        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given image>");
            return;
        }
response.setContentType("application/pdf");
response.setContentLength( (int) image.length());
InputStream is = image.getBinaryStream();
OutputStream os = response.getOutputStream();
byte buf[] = new byte[(int) image.length()];
is.read(buf);
os.write(buf);
os.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
