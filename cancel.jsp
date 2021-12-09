<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ktellmepackage.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Cancel my purchase</title>
    <meta charset="UTF-8">
    <link href="cancel.css" type="text/css" rel="stylesheet">
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
	 <form action = "profile.jsp">
            <button class="dropbtn"><i class="fa fa-fw fa-user"></i>Profile
              <i class="fa fa-caret-down"></i>
            </button> </form>
            <div class="dropdown-content">
              <a href="logout.jsp">Log out <i class="fa fa-sign-out"></i></a>
            </div>
          </div> 
        <a href="homepage.jsp"><i class="fa fa-fw fa-home"></i>HOME</a>
        <a href="itineraries.jsp"><i class="fa fa-bus"></i> Itineraries</a>
        <a href="tracking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Track my parcel</a>
        <a href="cancel.jsp" style="color: rgb(141, 141, 141)"><i class="fa fa-times" aria-hidden="true"></i> Cancel my purchase</a>
    </div>

    <div class="basket">
    <%
    if(request.getAttribute("cancelfail2") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("cancelfail2") %></h4>
		<% }
    if(request.getAttribute("cancelfail1") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("cancelfail1") %></h4>
		<% }
    %>
    <br>
        <form action="confirmcancel.jsp">
            <div class="container">
              <h1>Ακύρωση προϊόντος</h1>
              <p>Εάν επιθυμείτε να ακυρώσετε το εισιτήριο ή την αποστολή του δέματός σας, παρακαλούμε συμπληρώστε τα παρακάτω πεδία:</p>
              <hr><br>
              <div class="col-25">
              <label for="id"><b>Κωδικός προϊόντος:</b></label></div>
              <div class="col-50">
              <input type="text" placeholder="product id" name="id" required></div><br>
               <div class="col-25">
              <label for="account"><b>Τραπεζικός λογαριασμός:</b></label></div>
               <div class="col-50">
                  <input type="text" placeholder="bank account" name="acc" required></div><br>
                  <input type="checkbox" name="agree" style="margin-bottom:15px" required> Αποδέχομαι τους όρους σχετικά με την πολιτική αγοράς και προστασίας προσωπικών δεδομένων της KtellMe
          
              <div class="clearfix">
                <center><button class="button1">Πραγματοποίηση ακύρωσης</button></center>
              </div>
            </div>
          </form> 
    </div>

    <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
    </div>
</body>

</html>