<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Random"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DBCon"%>
<%@page import="java.sql.PreparedStatement"%>
<%


String paper_id=request.getParameter("t1");
String authorname=request.getParameter("t2");
String papername=request.getParameter("t3");
String amount=request.getParameter("amount");
String months=request.getParameter("months");
String emi=request.getParameter("emi");
String cardno=request.getParameter("cardno");
String cvv=request.getParameter("cvv");

String payment=(String)session.getAttribute("payment");
String status=(String)session.getAttribute("status");

try{
 java.util.Date dd = new java.util.Date();
	java.sql.Timestamp time = new java.sql.Timestamp(dd.getTime());
        Connection con=DBCon.getCon();
	 Random r=new Random();
            int i=r.nextInt(1000000000+900)+700000;
        
 FileOutputStream fos = new FileOutputStream("C:\\usr\\"+authorname+"Invoice.pdf");
 Document doc = new Document();
 PdfWriter writer = PdfWriter.getInstance(doc, fos);     
 doc.open();     
 
 doc.add(new Paragraph("                                               PAYMENT INVOICE ")); 
doc.add(new Paragraph("-----------------------------------------------------------------------------------------------------------------------"));
doc.add(new Paragraph("                                       "));  
doc.add(new Paragraph("                                       ")); 
 
doc.add(new Paragraph("Hello"));  
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));  
doc.add(new Paragraph("Dear: "+authorname+"."));  
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("Payment Status: SUCCESS"));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("Transaction ID: "+i));    
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       Date:"+time));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("You have successfuly published your paper with title ' "+papername+" ', in "+payment+"."));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("Total Amount: "+amount));
if(emi!=null){
doc.add(new Paragraph("EMI: "+emi));
}else{
 doc.add(new Paragraph("EMI: No EMI"));   
}
if(months!=null){
doc.add(new Paragraph("Total Months: "+months));
}else{
doc.add(new Paragraph("Total Months: 0"));  
}
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("THANK YOU"));
doc.close();  
fos.close(); 
FileInputStream fis=new FileInputStream("C:\\usr\\"+authorname+"Invoice.pdf");

InputStream inputStream = (InputStream)fis;
        
        PreparedStatement stat=con.prepareStatement("insert into payment values(null,?,?,?,?,?,?,?,?,?,?)");
	stat.setString(1,paper_id);
	stat.setString(2,authorname);
	stat.setString(3,cardno);
	stat.setString(4,cvv);
	stat.setString(5,amount);
	stat.setTimestamp(6,time);
        stat.setString(7,payment);
        if(status.equals("Yes")){
        stat.setString(8,months); 
        stat.setString(9,emi); 
        stat.setBlob(10,inputStream);
        }else{
        stat.setString(8,"0"); 
        stat.setString(9,"No EMI"); 
        stat.setBlob(10,inputStream);
        }
        
	int ii=stat.executeUpdate();
	stat.close();
	if(ii > 0){
		stat = con.prepareStatement("update uploadpapers set paper_status=? where paper_id=?");
		stat.setString(1,"Paper Accepted & Payment Completed");
		stat.setString(2,paper_id);
		stat.executeUpdate();
                response.sendRedirect("Invoice.jsp");
	}  else{
            response.sendRedirect("CheckPaperStatus.jsp?msg=Payment Failed..!!");
        }
    
    
}catch(Exception e){
    System.out.println(e);
}

%>