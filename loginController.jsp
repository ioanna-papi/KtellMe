<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="ktellmepackage.*" %>


   <% String username = request.getParameter("email");
      String password = request.getParameter("psw");
      CustomerDAO cd = new CustomerDAO(); %>
      <%
      try{
           Customer cs = cd.authenticate(username,password); 
           session.setAttribute("customobj",cs);
           //response.sendRedirect("dashboard_ex2_8180099.jsp");
      %>
      <jsp:forward page = "itineraries.jsp"/>

      <% } catch(Exception exception){
		   request.setAttribute("loginfail","Wrong username or password");
           //response.sendRedirect("login_ex2_8180099.jsp");
      %>
      <jsp:forward page="login.jsp"/>
      <% } %>