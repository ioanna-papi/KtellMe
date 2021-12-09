<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ktellmepackage.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Confirm my parcel shipment</title>
    <meta charset="UTF-8">
    <link href="confirm.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=0.25, maximum-scale=5.0, minimum-scale=0.25">
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

    <% 
    String card = request.getParameter("card");
    String owner = request.getParameter("owner");
    String exp = request.getParameter("exp");
    String cvv = request.getParameter("cvv");
%>
<%
    if (card.length()<16 || owner.length()<5 || exp.length()<7 || cvv.length()<3) {
        request.setAttribute("paymentfail", "Παρακαλώ συμπληρώστε σωστά τα στοιχεία πληρωμής.");
        %>
        <jsp:forward page ="paymentparcel.jsp"/>
    <% } %>
    <%
    String sname = (String)session.getAttribute("sname");
  
    String semail = (String)session.getAttribute("semail");

    //Double fprice = (Double)session.getAttribute("finalprice");

   

    sname = new String(sname.getBytes("ISO-8859-1"), "UTF-8");
    //String firstname2 = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
    
    int itinid = (Integer)session.getAttribute("itineraryid");
    //int from = (Integer)session.getAttribute("from");
    //int to = (Integer)session.getAttribute("to");

    ProductDAO pd = new ProductDAO();
    Customer cust = (Customer) session.getAttribute("customobj");
    Parcel parcel = (Parcel) session.getAttribute("parcelobj");
    pd.send(parcel,cust,itinid); 

    %>

    <div class="basket">
        <div class="container">
            <h2>Σας ευχαριστούμε πολύ για την προτίμησή σας, <b style="color:#2554C7"><%=sname%></b> !</h2>
            <h3>Όταν το δέμα σας δρομολογηθεί για αποστολή, θα σας σταλεί επιβεβαιωτικό μήνυμα στο email : <b style="color:#2554C7"><%=semail%></b>.</h3>
            <h4>Ο κωδικός του δέματός σας είναι: <b style="color:#2554C7"><%=parcel.getProductid()%></b></h4><br><br>
            <br><br>
            <h4>Η γνώμη σας σημαίνει πολλά για εμάς. Πως αξιολογείτε την αποστολή που μόλις πραγματοποιήσατε;</h4>
            <div class="rate">
                <input type="radio" id="star5" name="rate" value="5" />
                <label for="star5" title="5 stars">5 stars</label>
                <input type="radio" id="star4" name="rate" value="4" />
                <label for="star4" title="4 stars">4 stars</label>
                <input type="radio" id="star3" name="rate" value="3" />
                <label for="star3" title="3 stars">3 stars</label>
                <input type="radio" id="star2" name="rate" value="2" />
                <label for="star2" title="2 stars">2 stars</label>
                <input type="radio" id="star1" name="rate" value="1" />
                <label for="star1" title="1 star">1 star</label>
              </div>
        </div>
    </div>

    <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
    </div>
</body>

</html>