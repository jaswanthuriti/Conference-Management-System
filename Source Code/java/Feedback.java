package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Feedback extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String paper=request.getParameter("t1").trim();
	String feedback=request.getParameter("t2").trim();
	String status=request.getParameter("t3").trim();
        String rid=request.getParameter("rid");
	try{
		if (!feedback.equals("Accepted")) {
			feedback = feedback+" Comments : "+status;
		}
		String res = DBCon.updateStatus(paper, feedback,rid);
		RequestDispatcher rd=request.getRequestDispatcher("ReviewerScreen.jsp?t1="+res);
		rd.forward(request, response);		
	}catch(Exception e){
		e.printStackTrace();
	}
}
}
