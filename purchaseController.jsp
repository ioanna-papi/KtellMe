<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="ktellmepackage.*" %>
<%@ page import="itineraries.*,java.util.*,java.lang.*" %>


   <% String name = request.getParameter("name");
      String surname = request.getParameter("surname");
      String tel = request.getParameter("tel");
      String email = request.getParameter("email");
      String discount = request.getParameter("discount");     

      if (name.length()>=3 && surname.length()>=3 && email.length()>=10 && tel.length()>9) {
        session.setAttribute("name",name);
        session.setAttribute("email",email);
        session.setAttribute("disc",discount);
        session.setAttribute("tel",tel);
        session.setAttribute("surname",surname);
    %>
    <jsp:forward page ="payment.jsp"/>

    <%} %>
    <% if (name.length()<3 || surname.length()<3 || email.length()<10 || tel.length()<10) {
                    if (name.length() <=2){         
                        String mes2 = "Το όνομά σας πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("purchasefail1", mes2);
                    }
                    if (surname.length() <=2){                 
                        String mes2 = "Το επώνυμό σας πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("purchasefail2", mes2);
                    }
                    if (email.length() <10){ 
                        String mes2 = "Το email που εισάγετε πρέπει να αποτελείται από τουλάχιστον 10 χαρακτήσρες";
                        request.setAttribute("purchasefail3", mes2);                 	
					}
                    if (tel.length()<10){   
                        String mes2 = "Το τηλέφωνό σας πρέπει να αποτελείται από τουλάχιστον 10 ψηφία";
                        request.setAttribute("purchasefail4", mes2);               
                    }
                   %>
                <jsp:forward page ="purchase.jsp"/>
                    <%}%>
   
           
   