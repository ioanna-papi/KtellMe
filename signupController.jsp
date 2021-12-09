<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="ktellmepackage.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.util.Date, java.time.LocalDate" %>

<%
String name = request.getParameter("name");
String srname = request.getParameter("surname");
String em = request.getParameter("email");
String pswd = request.getParameter("password");
String confirm = request.getParameter("confirm");
String date = request.getParameter("birthdate");
//Date date = new SimpleDateFormat("dd/MM/yyyy").parse(birthdate);
name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
srname = new String(srname.getBytes("ISO-8859-1"), "UTF-8");

int x=0;
%>

<%
if (name.length()>2 && srname.length()>2 && pswd.length()>4 && pswd.equals(confirm)){
    
    CustomerDAO cd = new CustomerDAO();
    int id = cd.maxofcust();
    String phone = null;
    Customer cust = new Customer(++id,name,srname,em,pswd,date,phone);
    cd.register(cust);
    String mes = "Η εγγραφή σας πραγματοποιήθηκε με επιτυχία, " +name+"! Συνδεθείτε για να επιβεβαιώσετε τον λογαριασμό σας.";
    request.setAttribute("signupsuccess", mes);
    %>
    <jsp:forward page ="login.jsp"/>
    <%  

} else {
                    if (name.length() <=2){         
                        String mes2 = "Το όνομά σας πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("signupfail1", mes2);
                    }
                    if (srname.length() <=2){                 
                        String mes2 = "Το επώνυμό σας πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήρες";
                        request.setAttribute("signupfail2", mes2);
                    }
                    if (pswd.length() <=4){ 
                        String mes2 = "Ο κωδικός που εισάγετε πρέπει να αποτελείται από τουλάχιστον 3 χαρακτήσρες";
                        request.setAttribute("signupfail3", mes2);                 	
					}
                    if (!(confirm.equals(pswd))){   
                        String mes2 = "Ο κωδικός σας πρέπει να συμφωνεί με το πεδίο 'repeat password'";
                        request.setAttribute("signupfail4", mes2);               
                    }
                   %>
                <jsp:forward page ="signup.jsp"/>
                    <%}%>
             



