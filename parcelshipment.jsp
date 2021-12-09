<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Send a parcel</title>
    <meta charset="UTF-8">
    <link href="parcelshipment.css" type="text/css" rel="stylesheet">
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
  if(request.getAttribute("parcelfail1") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail1") %></h4>
		<% } 
    if(request.getAttribute("parcelfail2") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail2") %></h4>
		<% }
  if(request.getAttribute("parcelfail3") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail3") %></h4>
		<% }
  if(request.getAttribute("parcelfail4") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail4") %></h4>
		<% }
  if(request.getAttribute("parcelfail5") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail5") %></h4>
		<% } 
    if(request.getAttribute("parcelfail6") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail6") %></h4>
		<% }
  if(request.getAttribute("parcelfail7") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail7") %></h4>
		<% }
  if(request.getAttribute("parcelfail8") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail8") %></h4>
		<% }
  if(request.getAttribute("parcelfail9") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail9") %></h4>
		<% } 
    if(request.getAttribute("parcelfail10") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail10") %></h4>
		<% }
  if(request.getAttribute("parcelfail11") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail11") %></h4>
		<% }
  if(request.getAttribute("parcelfail12") != null) { %>
    <h4 style="color:red;margin-left:300px"><%=(String)request.getAttribute("parcelfail12") %></h4>
		<% }
    %>
            <br>
                <h1>Αποστολή δέματος</h1>
                <form action="shipmentController.jsp" method="POST">
                    <div class="row">
                        <div class="col-50">
                            <h3>Εισαγωγή προσωπικών στοιχείων</h3>
                            <label for="name">Όνομα Αποστολέα (*)</label>
                            <input type="text" id="name" name="sname" placeholder="name" required>

                            <label for="surname">Επώνυμο Αποστολέα (*)</label>
                            <input type="text" placeholder="surname" name="ssurname" required>

                            <label for="tel">Τηλέφωνο Αποστολέα (*)</label>
                            <input type="text" placeholder="phone number" name="stel" required>

                            <label for="email">Email Αποστολέα (*)</label>
                            <input type="text" placeholder="email" name="semail" required>
                            </div>

                            <br><br>
                            <div class="col-50">
                            <h3>Εισαγωγή στοιχείων παραλήπτη</h3>
                            <label for="name">Όνομα Παραλήπτη (*)</label>
                            <input type="text" placeholder="receiver's name" name="rname" required>

                            <label for="surname">Επώνυμο Παραλήπτη (*)</label>
                            <input type="text" placeholder="receiver's surname" name="rsurname" required>

                            <label for="tel">Τηλέφωνο Παραλήπτη (*)</label>
                            <input type="text" placeholder="receiver's phone number" name="rtel" required>

                            <label for="tel">Email Παραλήπτη (*)</label>
                            <input type="text" placeholder="receiver's email" name="remail" required>

                        </div>
                    </div>
                         <br><br>

                      
                    
                    <div class="row">

                            <div class="col-50">
                            <h3>Εισαγωγή στοιχείων δέματος</h3>
                            <label for="weight">Βάρος (σε Kg)*</label>
                            <input type="text" placeholder="weight" name="weight" required>

                            <label for="len">Μήκος (σε cm)*</label>
                            <input type="text" placeholder="length" name="length" required>

                            <label for="wid">Πλάτος (σε cm)*</label>
                            <input type="text" placeholder="width" name="width" required>

                            <label for="hei">Ύψος (σε cm)*</label>
                            <input type="text" placeholder="height" name="height" required>
                            
                            <label for="com">Σχόλια (προαιρετικό πεδίο)</label>
                            <textarea id="subject" name="comment" placeholder="Your comments.." style="height:200px"></textarea>
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