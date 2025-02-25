package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class SuperAdminLogin extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	String user=request.getParameter("t1");
	String pass=request.getParameter("t2");
	try{
		if(user.equals("superadmin") && pass.equals("superadmin")){
			RequestDispatcher rd=request.getRequestDispatcher("SuperAdminScreen.jsp?t1=Welcome "+user);
			rd.forward(request, response);
		} else{
			response.sendRedirect("SuperAdminLogin.jsp?t1=Invalid User");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
