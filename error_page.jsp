<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ page import="ktellmepackage.*" %>
	
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Error Page</title>
    <meta charset="UTF-8">
    <link href="error.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <div class="header">
        <img src="images/logo.png" width="200" height="200">
    </div>

    <div class="navbar"></div>

		<div class="basket">
        <div class="container">
            <% if(exception != null) { %>
	              <h1>Σφάλμα</h1>
                <p><b>Message: </b> <%= exception.getMessage() %></p>
				        <p><b>Class: </b> <%= exception.getClass() %></p>
            <% } %>	
        </div>
		</div>
    
    <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
    </div>

</body>
</html>