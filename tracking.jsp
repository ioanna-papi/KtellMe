<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="ktellmepackage.*,java.util.*,java.lang.*" %>
        <%@ page import="itineraries.*" %>


            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Tracking</title>
                <meta charset="UTF-8">
                <link href="tracking.css" type="text/css" rel="stylesheet">
                <link href="basics.css" type="text/css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <meta name="viewport" content="width=device-width, initial-scale=0.41, maximum-scale=5.0, minimum-scale=0.41">
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
                    <a href="itineraries.jsp"><i class="fa fa-bus"></i> Itineraries</a>
                    <a href="tracking.jsp" style="color: rgb(141, 141, 141)"><i class="fa fa-map-marker" aria-hidden="true"></i> Track my parcel</a>
                    <a href="cancel.jsp"><i class="fa fa-times" aria-hidden="true"></i> Cancel my purchase</a>
                </div>

		

                <div class="basket">
                    <form action="showTracking.jsp" method="POST">
                        <div class="container">

				<% if(request.getAttribute("fail") != null) { %>
					<h3 style="color:red;"><%=(String)request.getAttribute("fail") %></h3><br><br>
					<% } %>
			     
                            <h1>Παρακολούθηση διαδρομής δέματος</h1>
                            <p>Παρακαλούμε εισάγετε τον κωδικό δέματος που σας στάλθηκε στο email προκειμένου να παρακολουθήσετε την εξέλιξη της διαδρομής του.</p>
                            <hr><br>
                            <div class="col-25">
                                <label for="id"><b>Κωδικός δέματος:</b></label></div>
                            <div class="col-50">
                                <input type="text" placeholder="parcel id" name="id" required></div><br>


                            <input type="checkbox" name="agree" style="margin-bottom:15px" required> Αποδέχομαι τους όρους σχετικά με την πολιτική προστασίας προσωπικών δεδομένων της KtellMe

                            <div class="clearfix">
                                <center><button class="btn">Παρακολούθηση διαδρομής</button></center>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="footer">
                    <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
                </div>

            </body>

            </html>