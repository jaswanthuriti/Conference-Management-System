package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String user=request.getParameter("t1").trim();
	String pass=request.getParameter("t2").trim();
	String qualification=request.getParameter("t3").trim();
	String subjects=request.getParameter("t4").trim();
	String contact=request.getParameter("t5").trim();
	String email=request.getParameter("t6").trim();
	String address=request.getParameter("t7").trim();
	String type=request.getParameter("t8").trim();
	try{
		String input[] = {user,pass,qualification,subjects,contact,email,address,type};
		String res = DBCon.register(input);
		RequestDispatcher rd=request.getRequestDispatcher("Register.jsp?t1="+res);
		rd.forward(request, response);		
	}catch(Exception e){
		e.printStackTrace();
	}
}
}
