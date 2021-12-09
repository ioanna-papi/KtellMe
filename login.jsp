<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.65, maximum-scale=5.0, minimum-scale=0.65">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="login-signin.css">
<link rel="stylesheet" type="text/css" href="basics.css">
</head>
<body>

<div class="row">
  <div class="side">

  <% if(request.getAttribute("loginfail") != null) { %>		
			<h3 style="color:red;margin-left:-300px"><%=(String)request.getAttribute("loginfail") %></h3><br>
		  <br>
    <% } 
  if(request.getAttribute("signupsuccess") != null) { %>
    <h3 style="color:green"><%=(String)request.getAttribute("signupsuccess") %></h3><br>
		<% } %>
  
  
    <h1>Login to KtellME!</h1>
    <hr>
    <br>
    <form action="loginController.jsp" method="post">
  
      <div class="input-container">
        <i class="fa fa-envelope icon"></i>
        <input class="input-field" type="text" placeholder="Email" name="email" required>
      </div>
    
      <div class="input-container">
        <i class="fa fa-key icon"></i>
        <input class="input-field" type="password" placeholder="Password" name="psw" required>
      </div>

      <button type="submit" class="btn">Σύνδεση</button>
      <br>
      <br>
      <p>Σε περίπτωση που δε διαθέτετε λογαριασμό, πατήστε <a href="signup.jsp">εδώ</a>.</p>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
    </form>
   
  </div>
    <div class="main"></div>
  </div>


</body>
</html>