package com;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
public class UploadPaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       byte b[]=null;
       String author,names,desc,title,file;
public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
	response.setContentType("text/html");
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1*1024*1024);
	factory.setRepository(new File("C:/usr"));
    ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(10*1024*1024);
	try{
		List fileItems = upload.parseRequest(request);
		Iterator itr = fileItems.iterator();
		while(itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			if(item.isFormField()){
				String name = item.getFieldName();
		           String value = item.getString();
		             if(name.equals("t1")){
			           	  names=value;
		              }		
					   if(name.equals("t2")){
			           	  desc=value;
		              }	
				}else{
					file = item.getName();
					InputStream in=item.getInputStream();
					b = new byte[in.available()];
					in.read(b,0,b.length);
				}
		   }
		   HttpSession session=request.getSession();
		   String user = session.getAttribute("user").toString();
		   String res = DBCon.uploadPaper(user,file,names,desc);
		   if(res.equals("success")){
		   	   String path = getServletContext().getRealPath("/")+"/UploadPapers/"+file;
			   File fname = new File(path);
			   FileOutputStream fout = new FileOutputStream(fname);
			   fout.write(b,0,b.length);
			   fout.close();
			   RequestDispatcher rd=request.getRequestDispatcher("UploadPaper.jsp?t1=Your paper sent to admin for review");
			   rd.forward(request, response);
		   }else{
			   RequestDispatcher rd=request.getRequestDispatcher("UploadPaper.jsp?t1=Error in uploading paper");
			   rd.forward(request, response);
		   }
	}catch(Exception e){
		e.printStackTrace();
	}
}
}
