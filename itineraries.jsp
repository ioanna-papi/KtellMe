<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8180099.jsp"%>
<%@ page import="itineraries.*, java.util.List" %>

<% 
if (session.getAttribute("customobj")!=null) {
  %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Itineraries</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.50, maximum-scale=5.0, minimum-scale=0.50">
    <link href="itinerariesnew2.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
   
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		  <script type="text/javascript" src="<%=request.getContextPath() %>/js/calendarDate.js"></script>
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

    <div class="basket">

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #2b3856;
  text-align: center;
  color: #2b3856;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<h2 style="color:#2b3856">ΠΙΝΑΚΑΣ ΔΡΟΜΟΛΟΓΙΩΝ</h2>
<br><br>
<table>
  <tr>
    <th><h3><b>Κωδικός</b></h3></th>
    <th><h3><b>Δρομολόγιο</b></h3></th>
  </tr> 
	<% ItineraryDAO std = new ItineraryDAO();
	   try {
	       List<Itinerary> stations = std.getStations();
		int counter = 0;
		for(Itinerary st : stations) {
			counter++;
	         %>
		
		<tr>
		<td><b><%= counter %></b></td>
		<td><a href="<%=request.getContextPath() %>/ktellme2/choose_station.jsp?stname=<%=st.getName()%>&amp;itinid=<%=counter%>"><b><%= st.getName() %></b> </a></td>
		</tr>
		<%  } 
		} catch(Exception e) {
			throw new Exception(e.getMessage());
		}%>
  </table>

<br>
<h3 align = "left" style="color:#2b3856">* Επιλέξτε δρομολόγιο προκειμένου να μεταβείτε σε αγορά εισιτηρίου ή αποστολή δέματος</h3>
 </div>

      <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
      </div>

   
<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>

  </body>

</html>

<% } else { %>



<!DOCTYPE html>
<html lang="en">

<head>
    <title>Itineraries</title>
    <meta charset="UTF-8">
    <link href="itinerariesnew2.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=0.50, maximum-scale=5.0, minimum-scale=0.50">
   
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		  <script type="text/javascript" src="<%=request.getContextPath() %>/js/calendarDate.js"></script>
</head>

<body>
    <div class="header">
        <img src="images/logo.png" width="200" height="200">
    </div>

    <div class="navbar">
        <a href="signup.jsp" class="right"><i class="fa fa-user"></i> Sign Up</a>
        <a href="login.jsp" class="right"><i class="fa fa-sign-in"></i> Log In</a>
        <a href="first.jsp"><i class="fa fa-arrow-left"></i> Back</a>
        <a href="homepage.jsp"><i class="fa fa-fw fa-home"></i>HOME</a>
        <a href="itineraries.jsp" style="color: rgb(141, 141, 141)"><i class="fa fa-bus"></i> Itineraries</a>
    </div>
<div class="basket">

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #2b3856;
  text-align: center;
  color: #2b3856;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
<h2 style="color:#2b3856">ΠΙΝΑΚΑΣ ΔΡΟΜΟΛΟΓΙΩΝ</h2>
<br><br>
<table>
  <tr>
    <th><h3><b>Κωδικός</b></h3></th>
    <th><h3><b>Δρομολόγιο</b></h3></th>
  </tr> 
	<% ItineraryDAO std = new ItineraryDAO();
	   try {
	       List<Itinerary> stations = std.getStations();
		int counter = 0;
		for(Itinerary st : stations) {
			counter++;
	         %>
		
		<tr>
		<td><b><%= counter %></b></td>
		<td><b><%= st.getName() %></b></td>
		</tr>
		<%  } 
		} catch(Exception e) {
			throw new Exception(e.getMessage());
		}%>
  </table>

<br>

 </div>

      <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
      </div>

   
<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>

  </body>

</html>
  

<% } %>















