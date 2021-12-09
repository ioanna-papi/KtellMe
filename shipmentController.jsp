<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="ktellmepackage.*" %>
<%@ page import="itineraries.*,java.util.*,java.lang.*" %>


   <% String sname = request.getParameter("sname");
      String ssurname = request.getParameter("ssurname");
      String stel = request.getParameter("stel");
      String semail = request.getParameter("semail");
       String rname = request.getParameter("rname");
      String rsurname = request.getParameter("rsurname");
      String rtel = request.getParameter("rtel");
      String remail = request.getParameter("remail");
      String weight = request.getParameter("weight");
      String length = request.getParameter("length");
      String width = request.getParameter("width");
      String height = request.getParameter("height");
      String comments = request.getParameter("comment");

      Double wg = Double.parseDouble(weight);
      Double l = Double.parseDouble(length);
      Double wd = Double.parseDouble(width);
      Double h = Double.parseDouble(height);




        
//+elegxos weight klp
      if (sname.length()>=3 && ssurname.length()>=3 && semail.length()>=10 && stel.length()>9 && rname.length()>=3 && rsurname.length()>=3 && remail.length()>=10 && rtel.length()>9) {
          if (wg>0 && wg<=30 && l>0 && l<=90 && wd>0 && wd<=50 && h>0 && h<=70) {
        session.setAttribute("sname",sname);
        session.setAttribute("semail",semail);
        session.setAttribute("stel",stel);
        session.setAttribute("ssurname",ssurname);
        session.setAttribute("rname",rname);
        session.setAttribute("remail",remail);
        session.setAttribute("rtel",rtel);
        session.setAttribute("rsurname",rsurname);
        //Double vol = (l*wd*h)/5000;
        session.setAttribute("weight",wg);
        session.setAttribute("length",l);
        session.setAttribute("width",wd);
        session.setAttribute("height",h);
        session.setAttribute("com",comments);
    
        
    %>
    <jsp:forward page ="paymentparcel.jsp"/>

    <%} 
      }%>
    <% if (sname.length()<3 || ssurname.length()<3 || semail.length()<10 || stel.length()<10 || rname.length()<3 || rsurname.length()<3 || remail.length()<10 || rtel.length()<10 || wg<=0 || wg>30 || l<=0 || l>90 || wd<=0 || wd>50 || h<=0 || h>70) {
                    if (sname.length() <=2){         
                        String mes2 = "Το όνομα αποστολέα πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("parcelfail1", mes2);
                    }
                    if (ssurname.length() <=2){                 
                        String mes2 = "Το επώνυμο αποστολέα πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("parcelfail2", mes2);
                    }
                    if (semail.length() <10){ 
                        String mes2 = "Το email αποστολέα πρέπει να αποτελείται από τουλάχιστον 10 χαρακτήσρες";
                        request.setAttribute("parcelfail3", mes2);                 	
					}
                    if (stel.length()<10){   
                        String mes2 = "Το τηλέφωνό αποστολέα πρέπει να αποτελείται από τουλάχιστον 10 ψηφία";
                        request.setAttribute("parcelfail4", mes2);               
                    }
                    if (rname.length() <=2){         
                        String mes2 = "Το όνομα παραλήπτη πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("parcelfail5", mes2);
                    }
                    if (rsurname.length() <=2){                 
                        String mes2 = "Το επώνυμο παραλήπτη πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("parcelfail6", mes2);
                    }
                    if (remail.length() <10){ 
                        String mes2 = "Το email παραλήπτη πρέπει να αποτελείται από τουλάχιστον 10 χαρακτήσρες";
                        request.setAttribute("parcelfail7", mes2);                 	
					}
                    if (rtel.length()<10){   
                        String mes2 = "Το τηλέφωνό παραλήπτη πρέπει να αποτελείται από τουλάχιστον 10 ψηφία";
                        request.setAttribute("parcelfail8", mes2);               
                    }
                    if (wg<=0 || wg>30){   
                        String mes2 = "Το βάρος που εισάγετε πρέπει να είναι θετική τιμή μέχρι 30";
                        request.setAttribute("parcelfail9", mes2);
                    }
                    if (l<=0 || l>90){   
                        String mes2 = "Το μήκος που εισάγετε πρέπει να είναι θετική τιμή μέχρι 90";
                        request.setAttribute("parcelfail10", mes2);
                    }
                    if (wd<=0 || wd>50){   
                        String mes2 = "Το πλάτος που εισάγετε πρέπει να είναι θετική τιμή μέχρι 50";
                        request.setAttribute("parcelfail11", mes2);
                    }
                    if (h<=0 || h>70){   
                        String mes2 = "Το ύψος που εισάγετε πρέπει να είναι θετική τιμή μέχρι 70";
                        request.setAttribute("parcelfail12", mes2);
                    }
                   %>
                <jsp:forward page ="parcelshipment.jsp"/>
                    <%}%>
   
           
   