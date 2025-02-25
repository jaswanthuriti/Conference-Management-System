package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class AuthorLogin extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	HttpSession session=request.getSession();
	PrintWriter out = response.getWriter();
	String user=request.getParameter("t1");
	String pass=request.getParameter("t2");
        String type=request.getParameter("t0");
	try{
		String input[] = {user,pass,type};
		String msg = DBCon.userLogin(input);
		if(msg.equals("Reviewers")){
			session.setAttribute("user", user);
			RequestDispatcher rd=request.getRequestDispatcher("ReviewerScreen.jsp?t1=Welcome "+user);
			rd.forward(request, response);
		} else if(msg.equals("Authors")){
			session.setAttribute("user", user);
			RequestDispatcher rd=request.getRequestDispatcher("AuthorScreen.jsp?t1=Welcome "+user);
			rd.forward(request, response);
		} else{
			response.sendRedirect("index.jsp?t1=Invalid User");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
}

}
