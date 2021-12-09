<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>

<% session.invalidate(); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Logout</title>
    <meta charset="UTF-8">
    <link href="logout.css" type="text/css" rel="stylesheet">
    <link href="basics.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="refresh" content="3;url=<%=request.getContextPath() %>/ktellme2/first.jsp" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <div class="header">
        <img src="images/logo.png" width="200" height="200">
    </div>

    <div class="navbar"></div>

    <div class="basket">
        <div class="container">
            <h2 style="color:#2B3856;"><i class="fa fa-refresh fa-spin" style="font-size:24px;"></i> Η έξοδός σας πραγματοποιήθηκε με επιτυχία.</h2>
        </div>       
    </div>

    <div class="footer">
        <p>Copyright &copy; 2020, KtellME. All Rights Reserved</p>
    </div>
</body>
</html>