<%-- 
    Document   : Welcome1
    Created on : 03/04/2022, 9:53:46 PM
    Author     : super
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div>
        <span><a href="index.html">Home</a>
    </div>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String colour = request.getParameter("colour");
            String dob = request.getParameter("dob");
            String tos = request.getParameter("tos");
        %>
        <table id="form">
            <h1>Welcome Back <%= name%>!</h1>             
            <tr><td>Your email is <%= email%>.</td></tr>
            <tr><td><a class="button" href="index.html">Cancel</a></td></tr>
            <tr><td><a class="button" href="Main.jsp">Main</a></td></tr> 
    </body>
    <%
        User user = new User(name, email, phone, dob);
        session.setAttribute("user", user);
    %>
</html>
