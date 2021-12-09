<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error_page.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=0.55, maximum-scale=5.0, minimum-scale=0.55">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="login-signin.css">
<link rel="stylesheet" type="text/css" href="basics.css">
</head>
<body>

<div class="row">
  <div class="side">

  <% if(request.getAttribute("signupfail1") != null) { %>
    <h5 style="color:red;"><%=(String)request.getAttribute("signupfail1") %></h5>
	<% } if(request.getAttribute("signupfail2") != null) { %>
    <h5 style="color:red;"><%=(String)request.getAttribute("signupfail2") %></h5>
	<% } if(request.getAttribute("signupfail3") != null) { %>
    <h5 style="color:red;"><%=(String)request.getAttribute("signupfail3") %></h5>
	<% } if(request.getAttribute("signupfail4") != null) { %>
    <h5 style="color:red;"><%=(String)request.getAttribute("signupfail4") %></h5>
	<% } if(request.getAttribute("signupfail5") != null) { %>
    <h4 style="color:red;"><%=(String)request.getAttribute("signupfail5") %></h4>
  <% } %>

    <br>
    <h1>Sign up to KtellME!</h1>
    <p>Please fill in this form to create an account.</p>
      <hr>

      <form action="signupController.jsp" method="POST">
        <div class="input-container">
          <i class="fa fa-user icon"></i>
          <input class="input-field" type="text" placeholder="Name" name="name" required>
        </div>

        <div class="input-container">
          <i class="fa fa-user icon"></i>
          <input class="input-field" type="text" placeholder="Surname" name="surname" required>
        </div>
      
        <div class="input-container">
          <i class="fa fa-envelope icon"></i>
          <input class="input-field" type="text" placeholder="Email" name="email" required>
        </div>
        
        <div class="input-container">
          <i class="fa fa-key icon"></i>
          <input class="input-field" type="password" placeholder="Password" name="password" required>
        </div>

        <div class="input-container">
          <i class="fa fa-key icon"></i>
          <input class="input-field" type="password" placeholder="Repeat Password" name="confirm" required>
        </div>
      
        <label for="name">Ημερομηνία γέννησης:</label>
        <div class="input-container">
          <i class="fa fa-calendar icon"></i>
          <input class="input-field" type="date" name="birthdate" placeholder="birthdate" required>
        </div>

        <button type="submit" class="btn">Εγγραφή</button>
      </form>
  </div>
  <div class="main"></div>
</div>


</body>
</html>