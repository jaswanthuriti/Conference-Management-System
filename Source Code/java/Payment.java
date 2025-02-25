package com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Payment extends HttpServlet {
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	boolean flag=false;
	PrintWriter out = response.getWriter();
	String paper=request.getParameter("t1").trim();
	String author=request.getParameter("t2").trim();
	String card=request.getParameter("t3").trim();
	String cvv=request.getParameter("t4").trim();
	String amount=request.getParameter("t5").trim();
	try{
		String input[] = {paper, author, card, cvv, amount};
		String res = DBCon.payment(input);
		RequestDispatcher rd=request.getRequestDispatcher("AuthorScreen.jsp?t1="+res);
		rd.forward(request, response);		
	}catch(Exception e){
		e.printStackTrace();
	}
}
}
