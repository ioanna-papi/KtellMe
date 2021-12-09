<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="itineraries.*, ktellmepackage.*, java.util.List, java.util.Date" %>
<%@ page errorPage="error_page.jsp"%>


<%
String id = request.getParameter("id");
int parcid = Integer.parseInt(id);
%>

<% ProductDAO pd = new ProductDAO();
   if (! pd.findParcelById(parcid)) {
		request.setAttribute("fail", "Παρακαλώ εισάγετε έγκυρο κωδικό δέματος."); %>
        <jsp:forward page ="tracking.jsp"/>
    <% } %>



<!DOCTYPE html>
    <html lang="en">

    <head>
        <title>Show Tracking</title>
        <meta charset="UTF-8">
        <link href="showtracking2.css" type="text/css" rel="stylesheet">
        
        <meta name="viewport" content="width=device-width, initial-scale=0.50, maximum-scale=5.0, minimum-scale=0.50">

   	
	<link rel="stylesheet" href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
	<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
	<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    </head>

    <body>

        <div class="header">
        <img src="images/logo.png" width="200" height="200">
        </div>

        <nav class="navbar navbar-light" style="background-color: #2B3856;">
 		 <a class="navbar-brand text-white" href="tracking.jsp"><i class="fa fa-arrow-left"></i> Back</a>
	</nav>	


<div class="container px-1 px-md-4 py-5 mx-auto">
    <div class="card">
        <div class="row d-flex justify-content-between px-3 top">
                       
        </div> <!-- Add class 'active' to progress -->
	<h3 align = "center">  ΚΩΔΙΚΟΣ ΔΕΜΑΤΟΣ: <span class="text-primary font-weight-bold"> #<%=parcid%></span></h3><br><br>
        <div class="row d-flex justify-content-center">
            <div class="col-12">

		<% ProductDAO pdao = new ProductDAO();
 		   try {
			int itinid = pdao.getItinid(parcid);
		 try {
		
			ItineraryDAO stdao = new ItineraryDAO();
			Itinerary st = stdao.findById(itinid);  
			
			Date d = pdao.getDate(parcid);
			
			int[] ls = pdao.getList(parcid);
			int from = ls[0];
			int to = ls[1];
			int time = ls[2];

			String[] stations = {st.getBeginning(),st.getStation1(),st.getStation2(),st.getStation3(),st.getStation4(),st.getEnding()};
			int[] flag = {0,0,0,0,0,0}; 
			String[] times = {st.getTime1(),st.getTime2(),st.getTime3(),st.getTime4()}; 
			int counter = 0; 
			int counter2 = 0; %>
			<ul id="progressbar" class="text-center">


			<% for(String stat : stations) {
			    counter ++ ;
			    if ( counter < (from - 1) || (counter == from && counter == 1) ) { %>
				
				 <% if (counter == 1 && counter == from) {%>

					<li class="active step0"><br><br><h5><span class="text-primary font-weight-bold"><%= stat %></span> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>

				<% } else if (counter == 1) { %>

				   <li class="active step0"><br><br><h5><%= stat %> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>

				<% } else { %>

				 <li class="active step0"><br><br><h5><%=stat%></h5></li> <% } %>

			 <%  } else if (counter == (from-1)) { %>

				<li class="active step0"><br><br><h5><%= stat %> <br><br><br><br><img class="icon" src="https://i.imgur.com/TkPm63y.png"></h5></li> 



			<%  } else if (counter >= from && counter <= to) { %>
				
				<% if (counter == 6 && counter == to) { %>
					
					<li class="step0"><br><br><h5><span class="text-primary font-weight-bold"><%= stat %></span><br><br><br><i class="fa fa-check-circle" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>


				<% } else if (counter == 6) { %>

					 <li class="step0"><br><br><h5><%= stat %><br><br><br><i class="fa fa-check-circle" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>

				<% } else { %>

				<li class="step0"><br><br><h5><span class="text-primary font-weight-bold"><%= stat %> </span></h5></li> <% } %>

			
			<% } else if (counter > to) { %>
				 
				<% if (counter == 6) { %>

					 <li class="step0"><br><br><h5><%= stat %><br><br><br><i class="fa fa-check-circle" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>

				<% } else { %>


				<li class="step0"><br><br><h5><%= stat %></h5></li> <% } %>
			
			<% } 
				}%> </ul>

                                  
            </div>
        </div>
       <br><br>    
			<% for (String t : times) {
				counter2 ++;
				if (counter2 == time) { %>
            
	   				<h5 align = "center"><i class="fa fa-clock-o" aria-hidden="true"></i> ΏΡΑ ΑΝΑΧΩΡΗΣΗΣ ΑΠΟ ΣΤΑΘΜΟ: <%= t%></h5><br>
			<% }
				}%>
					<h5 align = "center"><i class="fa fa-calendar" aria-hidden="true"></i> ΗΜΕΡΟΜΗΝΙΑ ΑΝΑΧΩΡΗΣΗΣ: <%= d%></h5>

					
			 				   
			 <%  }catch (Exception e) {
				   throw new Exception(e.getMessage());
			   }	
 
		  }catch (Exception e) {
			 throw new Exception(e.getMessage());
		   }%>
		

                
        </div>
    </div>
</div>


<footer class=" navbar-light" style="background-color: #2B3856;">
 		<center> <p class="navbar-brand text-white">Copyright &copy; 2020, KtellME. All Rights Reserved</p> </center>
	</footer>	


       </body>
    </html>
