<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ktellmepackage.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>My profile</title>
    <meta charset="UTF-8">
    <link href="profile.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=0.40, maximum-scale=5.0, minimum-scale=0.40">
</head>

<body>
    <div class="header">
        <img src="images/logo.png" width="200" height="200">
    </div>

    <div class="navbar">
        <a href="contact.jsp" class="right"><i class="fa fa-fw fa-envelope"></i>Contact</a>
        <div class="dropdown">
            <button href="profile.jsp" class="dropbtn" style="color: rgb(141, 141, 141)"><i class="fa fa-fw fa-user"></i>Profile 
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-content">
              <a href="logout.jsp">Log out <i class="fa fa-sign-out"></i></a>
            </div>
          </div> 
        <a href="homepage.jsp"><i class="fa fa-fw fa-home"></i>HOME</a>
        <a href="itineraries.jsp"><i class="fa fa-bus"></i> Itineraries</a>
        <a href="tracking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Track my parcel</a>
        <a href="cancel.jsp"><i class="fa fa-times" aria-hidden="true"></i> Cancel my purchase</a>
    </div>
    <%
    
    Customer cust = (Customer) session.getAttribute("customobj");
    
    int id = cust.getCustid();
    String firstname = cust.getFirstname();
    String email = cust.getUsername();
    String lastname = cust.getSurname();
    String birthday = cust.getBirth();

    String fname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
    String lname = new String(lastname.getBytes("ISO-8859-1"), "UTF-8");
    %>

    <div class="wrapper">
        <div class="background"></div>
        <div class="foreground"></div>
    </div>

<section class="contact">
        <div class="content">
            <h1><i class="fa fa-fw fa-user"></i> About me</h1>
            <br>
            <p>You are a member of KtellME Community! Enjoy your journey with us.. <i class="fa fa-smile-o" aria-hidden="true"></i></p><br>
        </div>
    <div class="container">
        <div class="contactInfo">
            <div class="box">
                <div class="icon"><i class="fa fa-fw fa-user" aria-hidden="true"></i></div>
                <div class="text">
                    <h3><b>Name<b></h3>
                    <p><%=firstname%> <%=lastname%></p>
                </div>
            </div>
            <div class="box">
                <div class="icon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                <div class="text">
                    <h3><b>Email</b></h3>
                    <p><%=email%></p>
                </div>
            </div>
            <div class="box">
                <div class="icon"><i class="fa fa-calendar" aria-hidden="true"></i></div>
                   <div class="text">
                       <h3><b>Birthday</b></h3>
                       <p><%=birthday%></p>
                   </div>
            </div>
        </div>

		<img src="images/profile.png" alt="Avatar" class="avatar">
            

    </div>
</section>


    <div class="footer">
            <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
        </div>

</body>
</html>
    

