package com;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import java.sql.Statement;
import java.util.ArrayList;
public class DBCon{
    private static Connection con;
	
public static Connection getCon()throws Exception {
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/conference","root","root");
    }catch(Exception e){
		e.printStackTrace();
	}
	return con;
}
public static String uploadPaper(String user,String file,String name,String desc)throws Exception{
	int paper_id = 0;
	String msg="Error in uploading paper";
    con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select max(paper_id) from uploadpapers");
    if(rs.next()){
		paper_id = rs.getInt(1);
	}
	paper_id = paper_id + 1;
	PreparedStatement stat=con.prepareStatement("insert into uploadpapers values(?,?,?,?,?,?,?)");
	stat.setInt(1,paper_id);
	stat.setString(2,user);
	stat.setString(3,file);
	stat.setString(4,name);
	stat.setString(5,desc);
	stat.setString(6,"Pending");
        stat.setString(7,"Waiting");
	int i=stat.executeUpdate();
	stat.close();
	if(i > 0){
		msg = "success";
	}
    rs.close();stmt.close();con.close();
    return msg;
}

public static String updateStatus(String paper, String feedback,String rid)throws Exception{
	String msg = "Error in updating feedback";
	con = getCon();
        Statement s=con.createStatement();
        s.executeUpdate("update assignpaper set status='Done',feedback='"+feedback+"' where id='"+rid+"'");                
	PreparedStatement stat = con.prepareStatement("update uploadpapers set paper_status=? where paper_id=?");
	stat.setString(1,feedback);
	stat.setString(2,paper);
	stat.executeUpdate();
	return "Feedback Updated";
}
public static String updateAdminStatus(String paper, String feedback)throws Exception{
	String msg = "Error in updating feedback";
	con = getCon();
                
	PreparedStatement stat = con.prepareStatement("update uploadpapers set admin_feed=? where paper_id=?");
	stat.setString(1,feedback);
	stat.setString(2,paper);
	stat.executeUpdate();
	return "Feedback Updated";
}

public static String payment(String input[])throws Exception{
	String msg = "Error in making payment";
	java.util.Date dd = new java.util.Date();
	java.sql.Timestamp time = new java.sql.Timestamp(dd.getTime());
	PreparedStatement stat=con.prepareStatement("insert into payment values(?,?,?,?,?,?)");
	stat.setString(1,input[0]);
	stat.setString(2,input[1]);
	stat.setString(3,input[2]);
	stat.setString(4,input[3]);
	stat.setString(5,input[4]);
	stat.setTimestamp(6,time);
	int i=stat.executeUpdate();
	stat.close();
	if(i > 0){
		msg = "Payment process completed";
		stat = con.prepareStatement("update uploadpapers set paper_status=? where paper_id=?");
		stat.setString(1,"Paper Accepted & Payment Completed");
		stat.setString(2,input[0]);
		stat.executeUpdate();
	}
    return msg;
}

public static String register(String[] input)throws Exception{
    String msg="Error in registration";
    con = getCon();
	Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select username from signup where username='"+input[0]+"'");
    if(rs.next()){
        msg = "Username already exist";
    }else{
		PreparedStatement stat=con.prepareStatement("insert into signup values(?,?,?,?,?,?,?,?)");
		stat.setString(1,input[0]);
		stat.setString(2,input[1]);
		stat.setString(3,input[2]);
		stat.setString(4,input[3]);
		stat.setString(5,input[4]);
		stat.setString(6,input[5]);
		stat.setString(7,input[6]);
		stat.setString(8,input[7]);
		int i=stat.executeUpdate();
		stat.close();
		if(i > 0){
			msg = "Signup process completed";
		}
    }
	rs.close();stmt.close();con.close();
    return msg;
}
public static String userLogin(String input[])throws Exception{
    String msg="invalid login";
	con = getCon();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select usertype from signup where username='"+input[0]+"' and password='"+input[1]+"' and usertype='"+input[2]+"'");
    if(rs.next()){
	    msg = rs.getString(1);		
    }
	rs.close();stmt.close();
	return msg;
}
}
