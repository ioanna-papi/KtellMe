<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ktellmepackage.*,java.util.*,java.lang.*" %>
<%@ page import="itineraries.*" %>

<%

//String start = request.getParameter("start");
//String end = request.getParameter("end");
int id2 = (Integer)session.getAttribute("itineraryid");

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Buy a ticket</title>
    <meta charset="UTF-8">
    <link href="purchase.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=0.50, maximum-scale=5.0, minimum-scale=0.50">
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
            </button></form>
            <div class="dropdown-content">
              <a href="logout.jsp">Log out <i class="fa fa-sign-out"></i></a>
            </div>
          </div> 
        <a href="homepage.jsp"><i class="fa fa-fw fa-home"></i>HOME</a>
        <a href="itineraries.jsp" style="color: rgb(141, 141, 141)"><i class="fa fa-bus"></i> Itineraries</a>
        <a href="tracking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Track my parcel</a>
        <a href="cancel.jsp"><i class="fa fa-times" aria-hidden="true"></i> Cancel my purchase</a>
    </div>

    <div class="row">
      <div class="col-75">
          <div class="basket">
          <%
  if(request.getAttribute("purchasefail1") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("purchasefail1") %></h4>
		<% } 
    if(request.getAttribute("purchasefail2") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("purchasefail2") %></h4>
		<% }
  if(request.getAttribute("purchasefail3") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("purchasefail3") %></h4>
		<% }
  if(request.getAttribute("purchasefail4") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("purchasefail4") %></h4>
		<% }
    %>
    <br>
              <h1>Αγορά εισιτηρίου</h1>
              <form action="purchaseController.jsp" method="POST">
                  <div class="row">
                      <div class="col-50">
                          <h3>Εισαγωγή προσωπικών στοιχείων</h3>
                          <label for="name">Όνομα (*)</label>
                          <input type="text" id="name" name="name" placeholder="name" required>

                          <label for="surname">Επώνυμο (*)</label>
                          <input type="text" placeholder="surname" name="surname" required>

                          <label for="tel">Τηλέφωνο (*)</label>
                          <input type="text" placeholder="phone number" name="tel" required>

                          <label for="email">Email (*)</label>
                          <input type="text" placeholder="email" name="email" required>

                          <label for="discount">Κάρτα έκπτωσης (προαιρετικό πεδίο)</label>
                          <select id="discount" name="discount">
                            <option value="">--- Please choose your discount type ---</option>
                            <option value="1">Φοιτητικό πάσο -25%</option>
                            <option value="2">Φοιτητικό πάσο -50%</option>
                            <option value="3">Στρατιωτική ταυτότητα -15%</option>
                            <option value="4">Στρατιωτική ταυτότητα -25%</option>
                            <option value="5">Κάρτα πολυτέκνων -50%</option>
                            <option value="6">Κάρτα Α.Μ.Ε.Α. -50%</option>
                          </select>
                      </div>
                      </div>
                      <br><br>

                  
                  <center><button class="btn">Συνέχεια</button></center>
              
              </form>
          </div>
      </div>
  </div>
 
        <div class="footer">
            <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
        </div>

</body>
</html>