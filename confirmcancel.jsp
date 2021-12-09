<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ktellmepackage.*" %>
<%@ page import="java.sql.*" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>Confirm cancel</title>
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
            <a href="itineraries.jsp"><i class="fa fa-bus"></i> Itineraries</a>
            <a href="tracking.jsp">Track my parcel</a>
            <a href="cancel.jsp" style="color: rgb(141, 141, 141)">Cancel my purchase</a>
        </div>

        <%
        String id2 = request.getParameter("id");
        String account = request.getParameter("acc");
        int id = Integer.parseInt(id2);

        ProductDAO pd = new ProductDAO();

        if (account.length()<16 || !(pd.findProdById(id))) {
            if (account.length()<16) {
                request.setAttribute("cancelfail1", "Παρακαλώ εισάγετε έγκυρο τραπεζικό λογαριασμό.");
            } 
            if (!(pd.findProdById(id))) {
                request.setAttribute("cancelfail2", "Παρακαλώ εισάγετε έγκυρο κωδικό προιόντος.");
            }
        %>
        <jsp:forward page ="cancel.jsp"/>
    <% } %>
    <%
        pd.cancel(id);
        %>

        <div class="basket">
            <div class="container">
                <h2>Η ακύρωση προιόντος με κωδικό <b style="color:#2554C7"><%=id%></b> πραγματοποιήθηκε με επιτυχία και τα χρήματά σας έχουν επιστραφεί στο λογαριασμό <b style="color:#2554C7"><%=account%></b>.</h2><br><br>
                <h4>Η γνώμη σας σημαίνει πολλά για εμάς. Πως αξιολογείτε τη διαδικασία ακύρωσης προϊόντος;</h4>
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