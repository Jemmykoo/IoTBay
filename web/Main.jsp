<%-- 
    Document   : Main
    Created on : 03/04/2022, 7:35:45 PM
    Author     : super
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    </head>
    <body>
        <div>
            <span><a href="index.html">Home</a>
        </div>
        <h1>User Profile</h1>
        <%
            User user = (User) session.getAttribute("user");
        %>
            <p>You are logged in as ${ user.name } and your email is ${ user.email }</p>  
            <p>Your phone number is ${ user.phone }.</p>
            <p>Your date of birth is ${ user.dob }.</p>   
            <a href="Logout.jsp">Logout</a>
        <%
            session.setAttribute("user", user);
        %>
    </body>
</html>
