<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="itineraries.*, java.util.List" %>

<% String itinid1 = request.getParameter("itinid");
	int itinid = Integer.parseInt(itinid1);
  session.setAttribute("itineraryid", itinid);
	 %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Choose Station</title>
    <meta charset="UTF-8">
    <link href="station.css" type="text/css" rel="stylesheet">
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
        <form action="stationController.jsp" method="POST">
            <div class="container">
              <h3>* Η συμπλήρωση των παρακάτω πεδίων είναι απαραίτητη σε περίπτωση που επιθυμείτε να πραγματοποιήσετε αγορά εισιτηρίου ή αποστολή δέματος</h3>
              <hr><br><br><br><br>

              <div class="row">
                      <div class="col-75">
                       <label for="start"><b>ΣΤΑΘΜΟΣ ΑΝΑΧΩΡΗΣΗΣ:</b></label>
                          <select id="start" name="start" required>
                            <option value="">--- Επιλέξτε σταθμό αναχώρησης ---</option>
            <%     String stname = request.getParameter("stname");
		    stname = new String(stname.getBytes("ISO-8859-1"), "UTF-8");
				ItineraryDAO stdao = new ItineraryDAO();
				try {
				Itinerary st = stdao.printStations(stname);
			    %>
                            <option value="1"><%= st.getBeginning() %></option>
                            <option value="2"><%= st.getStation1() %></option>
                            <option value="3"><%= st.getStation2() %></option>
                            <option value="4"><%= st.getStation3() %></option>
                            <option value="5"><%= st.getStation4() %></option>
                            
 			<% 				   
			   }catch (Exception e) {
				   throw new Exception(e.getMessage());
			   }	
			%> </select>


        </div>
   
                <div class="col-75">
                <br><br><br>
                <label for="end"><b>ΣΤΑΘΜΟΣ ΑΦΙΞΗΣ:</b></label>
                           <select id="end" name="end" required>
                            <option value="">--- Επιλέξτε σταθμό άφιξης ---</option>
                            <%  String stname2 = request.getParameter("stname");
				stname2 = new String(stname2.getBytes("ISO-8859-1"), "UTF-8");
				ItineraryDAO stdao2 = new ItineraryDAO();
				try {
				Itinerary st2 = stdao2.printStations(stname2);
			    %>
                            <option value="2"><%= st2.getStation1() %></option>
                            <option value="3"><%= st2.getStation2() %></option>
                            <option value="4"><%= st2.getStation3() %></option>
                            <option value="5"><%= st2.getStation4() %></option>
                            <option value="6"><%= st2.getEnding() %></option>
 			<% 				   
			   }catch (Exception e) {
				   throw new Exception(e.getMessage());
			   }	
			%> </select>



		</div>

   	 <div class="col-75">
   	 <br><br><br>
              <label><b>ΗΜΕΡΟΜΗΝΙΑ ΑΝΑΧΩΡΗΣΗΣ:</b></label>
     	 <input type="date" name = "myDate" id = "myDate" required ><br><br>
	</div>

 
       <div class="col-75">
       <br><br><br>
       <label for="discount"><b>ΏΡΑ ΑΝΑΧΩΡΗΣΗΣ:</b></label>
                          <select id="time" name="myTime" required>
                            <option value="">--- Επιλέξτε μία από τις διαθέσιμες ώρες ---</option>
			    <%  String stname3 = request.getParameter("stname");
				stname3 = new String(stname3.getBytes("ISO-8859-1"), "UTF-8");
				ItineraryDAO stdao3 = new ItineraryDAO();
				try {
				Itinerary st3 = stdao3.printStations(stname3);
			    %>

                            <option value="1"><%= st3.getTime1() %></option>
                            <option value="2"><%= st3.getTime2() %></option>
                            <option value="3"><%= st3.getTime3() %></option>
                            <option value="4"><%= st3.getTime4() %></option>
                            <% 				   
			   }catch (Exception e) {
				   throw new Exception(e.getMessage());
			   }	
			%> </select>



   </div>
 </div>  
       <br><br><br><br><br>
       <hr><br><br>
	
       <center>
       <div class="row">
		<div class="col-50">  
		 <center><button class="btn"> Συνέχεια </button></center>

		</div>
</div>
</center>
</div>
</form>
</div>
</div>
</div>

<div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
</div>


  </body>

</html>


