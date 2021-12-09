<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ktellmepackage.*,java.util.*,java.lang.*,java.io.*" %>
<%@ page import="itineraries.*" %>


<%
String d = (String)session.getAttribute("disc");
//String itinid = request.getParameter("itinid4");
int id3 = (Integer)session.getAttribute("itineraryid");
int diaf = (Integer)session.getAttribute("diafora");
int time = (Integer)session.getAttribute("time");
String date = (String)session.getAttribute("date");
int from = (Integer)session.getAttribute("from");
int to = (Integer)session.getAttribute("to");




//name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
//surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");

ProductDAO pd = new ProductDAO();
int id = pd.maxofprod();
ItineraryDAO st = new ItineraryDAO();
Double price = st.findPriceById(id3);


Double disc = 0.0;
    if (!(d.equals(""))) {
        if (d.equals("1") || d.equals("4")) {
            disc = 0.25;
        } else if (d.equals("3")) {
            disc = 0.15;
        } else {
            disc = 0.5;
        }
    }  

String name = (String)session.getAttribute("name"); 
String surname = (String)session.getAttribute("surname");
String email = (String)session.getAttribute("email");
String tel = (String)session.getAttribute("tel");
Ticket ticket = new Ticket(++id,price,time,date,from,to,name,surname,email,tel,disc);
Double finalprice2 = ticket.calculatetPrice(price,diaf,disc);
Double finalprice = Math.round(finalprice2*100.0)/100.0;
ticket.setPrice(finalprice);

session.setAttribute("finalprice",finalprice);
session.setAttribute("ticketobj", ticket);

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Payment</title>
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
        <a href="#" class="right"><i class="fa fa-fw fa-envelope"></i>Contact</a>
        <div class="dropdown">
            <button class="dropbtn"><i class="fa fa-fw fa-user"></i>Profile 
              <i class="fa fa-caret-down"></i>
            </button>
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
              <form action="confirmbuy.jsp" method="POST">
                      <br><br>
                    <div class="row">
                        <div class="col-50">
                        <% if (request.getAttribute("paymentfail") != null) {%>
                        <h3 style="color:red;">Oops! Κάτι πήγε στραβά. <%=(String)request.getAttribute("paymentfail")%></h3> <%}%><br>
                        <h3>Η τιμή του εισιτηρίου σας είναι: <%=finalprice%>&euro;</h3><br>
                            <h3>Εισαγωγή στοιχείων πληρωμής</h3><br>
          
                            <label for="card">Αριθμός πιστωτικής/χρεωστικής κάρτας (*)</label>
                            <input type="text" placeholder="credit/debit card number" name="card" required>

                            <label for="card">Ονοματεπώνυμο κατόχου κάρτας (*)</label>
                            <input type="text" placeholder="card owner's name" name="owner" required>

                            <label for="exp">Ημερομηνία λήξης (*)</label>
                            <input type="text" name="exp" placeholder="expiration date (mm/yyyy)"required>
                            
                            <label for="cvv">CVV (*)</label>
                            <input type="text" name="cvv" placeholder="CVV number" required> 
                                <center><div class="icon-container">
                                <label for="fname">Accepted Cards</label>
                                <i class="fa fa-cc-visa" style="color:navy;"></i>
                                <i class="fa fa-cc-amex" style="color:blue;"></i>
                                <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                <i class="fa fa-cc-discover" style="color:orange;"></i>
                            </div></center>  
                        </div>
                        
                    </div>

                  
                  <center><button class="btn">Ολοκλήρωση αγοράς</button></center>
              
              </form>
          </div>
      </div>
  </div>
 
        <div class="footer">
            <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
        </div>

</body>
</html>