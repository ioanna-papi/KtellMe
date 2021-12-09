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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
       	
        <div class="row d-flex justify-content-center">
            <div class="col-12">

		

		<% ProductDAO pdao = new ProductDAO();
 		   try {
			int itinid = pdao.getItinid(parcid);
		 try {
		
			ItineraryDAO stdao = new ItineraryDAO();
			Itinerary st = stdao.findById(itinid);  
			
			Date d = pdao.getDate(parcid);
			 %>

			<div class="row d-flex justify-content-between px-5 top">
			<h5 align="left" id="demo"></h5></div><br>
			<h3 align = "center">  ΚΩΔΙΚΟΣ ΔΕΜΑΤΟΣ: <span class="text-primary font-weight-bold"> #<%=parcid%></span></h3><br>
			<h5 align="center" id="message"></h5> 

			
			<script>
			var d = new Date();
			var flag;
			var d2 = d.setFullYear("<%= d %>".toString().substr(0,4), parseInt("<%= d %>".toString().substr(5,6).substr(0,2))-1,"<%= d %>".toString().substr(8,9) );
			var today = new Date();
			if (today <= d2) {
				flag = "true";
			} else if (today > d2) {
				flag = "false";
			} else {
				flag = "true";
			}
			var mes = (flag == "true")? "Παρακολουθήστε την διαδρομή του δέματος σας": "Το δέμα σας έχει ήδη φτάσει στον προορισμό του!";
			document.getElementById("message").innerHTML = mes;
			</script>

			

			<script>
			var td = new Date();
			var days = ["Κυριακή","Δευτέρα","Τρίτη","Τετάρτη","Πέμπτη","Παρασκευή","Σάββατο"];
			var months = ["Ιανουαρίου","Φεβρουαρίου","Μαρτίου","Απριλίου","Μαϊου","Ιουνίου","Ιουλίου","Αυγούστου","Σεπτεμβρίου","Οκτωβρίου","Νοεμβρίου","Δεκεμβρίου"];
			var all = [" ", days[td.getDay()]," ",  td.getDate()," ", months[td.getMonth()], " ", td.getFullYear()];
			var result= all[0]+ all[1]+ all[2] + all[3] + all[4] + all[5] + all[6] + all[7]  ;
			document.getElementById("demo").innerHTML = result;	
			</script>

			<br><br>
			<%
			
			
			int[] ls = pdao.getList(parcid);
			int from = ls[0];
			int to = ls[1];
			int time = ls[2];
			
			String[] stations = {st.getBeginning(),st.getStation1(),st.getStation2(),st.getStation3(),st.getStation4(),st.getEnding()};
			int[] flag = {0,0,0,0,0,0}; 
			String[] times = {st.getTime1(),st.getTime2(),st.getTime3(),st.getTime4()}; 
			int counter = 0; 
			int counter2 = 0;
			Date td = new Date();
			int today = td.getDate();
			int tmonth = td.getMonth() + 1;
			int tyear = td.getYear();
			int dep_day = d.getDate();
			int dep_month = d.getMonth() + 1;
			int dyear = d.getYear();
			
			if (tyear > dyear) { %>
				<ul id="progressbar" class="text-center">
				<li class="active step0"><br><br><h5 id = "beg"></h5> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></li>
			        <li class="active step0"><br><br><h5 id = "stat1"> </h5></li> 
				<li class="active step0"><br><br><h5 id = "stat2"> </h5><br><br><br><img class="icon" src="https://i.imgur.com/TkPm63y.png"></li>
			 	<li class="active step0"><br><br><h5 id = "stat3"></h5> </li>
				<li class="active step0"><br><br><h5 id = "stat4"></h5> </li>
				<li class="active step0"><br><br><h5 id = "end"> </h5><br><br><i class="fa fa-check-circle" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></li> 
				</ul>
			<% } 

			
			if (tmonth > dep_month && tyear <= dyear) { %>
				<ul id="progressbar" class="text-center">
				<li class="active step0"><br><br><h5 id = "beg"></h5> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></li>
			        <li class="active step0"><br><br><h5 id = "stat1"> </h5></li> 
				<li class="active step0"><br><br><h5 id = "stat2"> </h5><br><br><br><img class="icon" src="https://i.imgur.com/TkPm63y.png"></li>
			 	<li class="active step0"><br><br><h5 id = "stat3"></h5> </li>
				<li class="active step0"><br><br><h5 id = "stat4"></h5> </li>
				<li class="active step0"><br><br><h5 id = "end"> </h5><br><br><i class="fa fa-check-circle" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></li> 
				</ul>
			<% } 


			if (tmonth == dep_month && today > dep_day && tyear <= dyear) { %>
				<ul id="progressbar" class="text-center">
				<li class="active step0"><br><br><h5 id = "beg"></h5> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></li>
			        <li class="active step0"><br><br><h5 id = "stat1"> </h5></li> 
				<li class="active step0"><br><br><h5 id = "stat2"> </h5><br><br><br><img class="icon" src="https://i.imgur.com/TkPm63y.png"></li>
			 	<li class="active step0"><br><br><h5 id = "stat3"></h5> </li>
				<li class="active step0"><br><br><h5 id = "stat4"></h5> </li>
				<li class="active step0"><br><br><h5 id = "end"> </h5><br><br><i class="fa fa-check-circle" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></li> 
				</ul>
			<% } %>






			<ul id="progressbar" class="text-center">
			<% for(String stat : stations) {
			    counter ++ ;

			
			if (tyear <= dyear && (tmonth < dep_month || (tmonth == dep_month && today <= dep_day)) ) {

			   if ( counter < (from - 1) || (counter == from && counter == 1) ) { %>
				
				 <% if (counter == 1 && counter == from) {%>

				   <li class=" step0"><br><br><h5><span class="text-primary font-weight-bold"><%= stat %></span> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>

				<% } else if (counter == 1) { %>

				   <li class=" step0"><br><br><h5><%= stat %> <br><br><br><i class="fa fa-map-marker" aria-hidden="true" style="font-size:60px; color:#1e90ff;"></i></h5></li>

				<% } else { %>

				 <li class=" step0"><br><br><h5><%=stat%></h5></li> <% } %>

			 <%  } else if (counter == (from-1)) { %>

				<li class="step0"><br><br><h5><%= stat %> <br><br><br><br><img class="icon" src="https://i.imgur.com/TkPm63y.png"></h5></li> 



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
			      }
				  }%> </ul>


			


                        <script>
			document.getElementById("beg").innerHTML = ("<%= st.getBeginning()%>").toString();
			document.getElementById("stat1").innerHTML =("<%= st.getStation1()%>").toString();
			document.getElementById("stat2").innerHTML =("<%= st.getStation2()%>").toString();
			document.getElementById("stat3").innerHTML =("<%= st.getStation3()%>").toString();
			document.getElementById("stat4").innerHTML =("<%= st.getStation4()%>").toString();
			document.getElementById("end").innerHTML = ("<%= st.getEnding()%>").toString();
			</script>       
            </div>
        </div>
       <br><br>    
			

			<div ng-app="myApp" ng-controller="myCtrl">
			<h5 align = "center"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> ΗΜΕΡΟΜΗΝΙΑ ΑΝΑΧΩΡΗΣΗΣ:
			{{ fday + " " + day + " " + months[mon-1]  + " " + year + " " }}
			</h5>
			</div>

			<script>
			var app = angular.module("myApp", []);
			app.controller("myCtrl", function($scope) {
			  $scope.d = new Date();
			  $scope.days = ["Κυριακή","Δευτέρα","Τρίτη","Τετάρτη","Πέμπτη","Παρασκευή","Σάββατο"];
			  $scope.d2 = d.setFullYear("<%= d %>".toString().substr(0,4), parseInt("<%= d %>".toString().substr(5,6).substr(0,2))-1,"<%= d %>".toString().substr(8,9) );
			  $scope.fday = days[d.getDay()];
  			  $scope.mon = parseInt("<%= d %>".toString().substr(5,6).substr(0,2));
			  $scope.day = parseInt("<%= d %>".toString().substr(8,9));
			  $scope.year = parseInt("<%= d %>".toString().substr(0,4));
			  $scope.months = ["Ιανουαρίου","Φεβρουαρίου","Μαρτίου","Απριλίου","Μαϊου","Ιουνίου","Ιουλίου","Αυγούστου","Σεπτεμβρίου","Οκτωβρίου","Νοεμβρίου","Δεκεμβρίου"];
			});
			</script>

		
			<script>
			var d = new Date();
			d.setFullYear("<%= d %>".toString().substr(0,4), parseInt("<%= d %>".toString().substr(5,6).substr(0,2))-1,"<%= d %>".toString().substr(8,9) );
			var days = ["Κυριακή","Δευτέρα","Τρίτη","Τετάρτη","Πέμπτη","Παρασκευή","Σάββατο"];
			var mon = parseInt("<%= d %>".toString().substr(5,6).substr(0,2));
			var months = ["Ιανουαρίου","Φεβρουαρίου","Μαρτίου","Απριλίου","Μαϊου","Ιουνίου","Ιουλίου","Αυγούστου","Σεπτεμβρίου","Οκτωβρίου","Νοεμβρίου","Δεκεμβρίου"];
			var d2 = days[d.getDay()]+ " " + months[mon-1] ;
			document.getElementById("demo5").innerHTML = d2;
			</script>



			
			<% for (String t : times) {
				counter2 ++;
				if (counter2 == time) { %>
            				<br>
	   				<h5 align = "center"><i class="fa fa-clock-o" aria-hidden="true"></i> ΏΡΑ ΑΝΑΧΩΡΗΣΗΣ ΑΠΟ ΣΤΑΘΜΟ: <%= t%></h5>
			<% }
				}%>


			 				   
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
