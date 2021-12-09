<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="itineraries.*,java.util.*,java.lang.*" %>
<%@ page import= "java.util.Date"%>
<%@ page import= "java.text.SimpleDateFormat"%>
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
	 <div class="container">

<% String start1 = request.getParameter("start");
   int start = Integer.parseInt(start1);
   session.setAttribute("from",start);
   //String itinid3 = request.getParameter("itinid2");
   String end1 = request.getParameter("end");
   int end = Integer.parseInt(end1);
   session.setAttribute("to",end);
   String date1 = request.getParameter("myDate");  
   String time1 = request.getParameter("myTime");
   int time = Integer.parseInt(time1);
   session.setAttribute("date",date1);
   session.setAttribute("time",time);
   int diafora = end-start;
   session.setAttribute("diafora", diafora);

   //int id2 = (Integer)request.getAttribute("itineraryid");
   %>
   <%
   boolean result = false;
   try {
    Date today = new Date();
    Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);

    result = today.before(date);
  } catch (Exception e) {
    System.out.println(e.getMessage());

  }
   %>
   
 <% if (end <= start && !(result)) { %>
	<div class="alert alert-danger" role="alert">
		<h3 align ="center"> Παρακαλούμε επιλέξτε έγκυρο δρομολόγιο και ημερομηνία. </h3>	
	</div>
	<br><br><br><br>
	<center><button class="btn"><a href="itineraries.jsp" role="button"> <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>  Επιστροφή στη σελίδα δρομολογίων</a></button></center>

   <% } else if (!(result)) { %>
	<div class="alert alert-danger" role="alert">
		<h3 align ="center"> Παρακαλούμε επιλέξτε έγκυρη ημερομηνία. </h3>	
	</div>
   	<br><br><br><br>
	<center><button class="btn"><a href="itineraries.jsp" role="button"> <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>  Επιστροφή στη σελίδα δρομολογίων</a></button></center>

   <% } else if (end <= start) { %>
	<div class="alert alert-danger" role="alert">
		<h3 align ="center"> Παρακαλούμε επιλέξτε έγκυρο δρομολόγιο. </h3>	
	</div>
	<br><br><br><br>
	<center><button class="btn"><a href="itineraries.jsp" role="button"> <i class="fa fa-arrow-circle-left" aria-hidden="true"></i>  Επιστροφή στη σελίδα δρομολογίων</a></button></center>
  
  <% } else { %>
       <h3>Επιλέξτε την ενέργεια που επιθυμείτε να πραγματοποιήσετε</h3>
       <hr><br><br>
       <center>
       <div class="row">
		<div class="col-50">
		<center><button class="btn"><a href="purchase.jsp?start=<%=request.getParameter("start")%>&amp;end=<%=request.getParameter("end")%>"> ΑΓΟΡΑ ΕΙΣΙΤΗΡΙΟΥ </a></button></center>
		</div>
  		<div class="col-50">
		<center><button class="btn"><a href="parcelshipment.jsp"> ΑΠΟΣΤΟΛΗ ΔΕΜΑΤΟΣ </a></button></center>
 		</div>
	</div>
    </div>
</center>

<% } %>
</div>
</div>
</div>
</div>
   <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
</div>


  </body>

</html>




