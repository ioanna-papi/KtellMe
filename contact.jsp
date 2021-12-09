<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Contact</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link href="basics.css" type="text/css" rel="stylesheet">
    <meta name="viewport" content="width=device-width,  initial-scale=0.40, maximum-scale=5.0, minimum-scale=0.40">
    <link rel="stylesheet" type="text/css" href="profile.css">
   
</head>

<body>

    <div class="header">
    <img src="images/logo.png" width="200" height="200">
    </div>

    <div class="navbar">
        <a href="contact.jsp" class="right" style="color: rgb(141, 141, 141)"><i class="fa fa-fw fa-envelope"></i>Contact</a>
        <div class="dropdown">
	<form action = "profile.jsp">
            <button class="dropbtn"><i class="fa fa-fw fa-user"></i>Profile 
                <i class="fa fa-caret-down"></i>
            </button></form>
            <div class="dropdown-content">
                <a href="logout.jsp">Log out <i class="fa fa-sign-out"></i></a>
            </div>
        </div> 
        <a href="homepage.jsp" ><i class="fa fa-fw fa-home"></i>HOME</a>
        <a href="itineraries.jsp"><i class="fa fa-bus"></i> Itineraries</a>
        <a href="tracking.jsp"><i class="fa fa-map-marker" aria-hidden="true"></i> Track my parcel</a>
        <a href="cancel.jsp"><i class="fa fa-times" aria-hidden="true"></i> Cancel my purchase</a>
    </div>
    <div class="wrapper">
        <div class="background"></div>
        <div class="foreground"></div>
    </div>
    <section class="contact">
        <div class="content">
            <h1>Contact Us</h1>
            <br>
            <p>Επικοινωνήστε μαζί μας τώρα.<br>Η ομάδα μας βρίσκεται πάντα δίπλα σας για να λύσει κάθε σας πρόβλημα και να απαντήσει σε όλες σας τις απορίες.</p><br>
        </div>
    <div class="container">
        <div class="contactInfo">
            <div class="box">
                <div class="icon"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                <div class="text">
                    <h3><b>Address</b></h3>
                    <p>76, Patission Street, 104 34 Athens 2</p>
                </div>
            </div>
            <div class="box">
                <div class="icon"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                <div class="text">
                    <h3><b>Email</b></h3>
                    <p>info@ktellme.gr</p>
                </div>
            </div>
            <div class="box">
                <div class="icon"><i class="fa fa-phone" aria-hidden="true"></i></div>
                   <div class="text">
                       <h3><b>Phone</b></h3>
                       <p>210 8203911</p>
                   </div>
            </div>
        </div>
        <div class="contactForm">
            <form>
                <h2>Send Message</h2>
                <div class="inputBox">
                    <input type="text" name="" required="required">
                    <span>Full Name</span>
                </div>
                <div class="inputBox">
                    <input type="email" id="email" name="" class="form-control" required="required">
                    <span>Email</span>
                </div>
                <div class="inputBox">
                    <textarea required="required"></textarea>
                    <span>Type your Message...</span>
                </div>
                <div>
                    <button class="button" style="vertical-align:middle"><span>Send </span></button>
                </div>
            </form>
        </div>
    </div>
</section>

    <div class="footer">
    <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
    </div>

    </body>
    </html>
