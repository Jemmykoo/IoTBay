<%-- 
    Document   : Logout
    Created on : 03/04/2022, 8:11:30 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div>
        <span><a href="index.html">Home</a>
    </div>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <h1>Logging out</h1>
        <%
            session.invalidate();
        %>
        <p> You have been logged out. Click <a href="index.html">Home</a> to return to the main page.</p>
    </body>
</html>
