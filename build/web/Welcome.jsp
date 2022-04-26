<%-- 
    Document   : Welcome
    Created on : 22/03/2022, 6:34:28 PM
    Author     : super
--%>
<%@page import="uts.isd.model.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <div>
        <span><a href="index.html">Home</a>
    </div>
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
        <%if(tos != null) { %>
                <tr><td>Welcome, <%= name%>!</td></tr>
                <tr><td>Your email is <%= email%>.</td></tr>
                <tr><td>Your password is <%= password%>.</td></tr>
                <tr><td>Your gender is <%= gender%>.</td></tr>
                <tr><td>Click <a href="Main.jsp">here</a> to proceed to the main page.</td></tr>
                <tr><td><a class="button" href="index.html">Cancel</a></td></tr>
            <% } else { %>
            <tr><td>Sorry, you must agree to the Terms of Service.</td></tr>
            <tr><td>Click <a href="register.jsp">here</a> to go back.</td</tr>
            <% } %>    
        </table>
        <%
            User user = new User(name, email, phone, dob);
            session.setAttribute("user", user);
        %>
</body>
</html>
