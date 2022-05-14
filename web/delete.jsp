<%-- Document : main Created on : 22 Mar. 2022, 7:10:41 pm Author : jemima --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="labcss.css" />
        <title>Remove profile</title>
    </head>
    <body>
        <% try {
                User user = (User) session.getAttribute("loggedIn");%>
        <div id="bar">
            <span id="links">
                <a href="../index.jsp">Home Page</a>
                <a href="../editProfile.jsp">Edit profile</a>
                <a href="../delete.jsp">Remove profile</a>
                <a href="../viewLog.jsp">View log</a>
                <a href="/lgtUser/">Logout</a>
            </span>
        </div>
        <div>
            <h2>
                You are now logged in to <%= user.getFirstName()%>'s IoTBay Account.
            </h2>
            <h4>Remove profile section : </h4>
            <div class="registerform">
                <form id="form" method="POST" action="/rmUser/">
                    <table>
                        <tr><td>First Name:</td><td><input type="text" id="firstname" name="firstname" value="<%= user.getFirstName()%>" readonly="readonly"></td></tr>
                        <tr><td>Last Name:</td><td><input type="text" id="lastname" name="lastname" value="<%= user.getLastName()%>" readonly="readonly"></td></tr>
                        <tr><td>Email:</td><td><input type="text" id="email" name="email" value="<%= user.getEmail()%>" readonly="readonly"></td></tr>
                        <tr><td>Phone:</td><td><input type="text" id="phone" name="phone" value="<%= user.getPhone()%>" readonly="readonly"></td></tr>
                        <tr><td><span></span></td></tr>
                        <tr><td>Password:</td><td><input type="password" id="password" name="password" value="<%= user.getPassword()%>" readonly="readonly"></td></tr>
                        <tr><td>is-Staff: (1 if staff else 0)</td><td><input type="number" id="isstaff" name="isstaff" min="0" max="1" value="0" readonly="readonly"></td></tr>
                        <tr><td><input class="button" type="submit" value="Remove"></input></td></tr>
                    </table>  
                </form>     
            </div>
        </div>
        <%
        } catch (Exception e) { %>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home Page</a>
                <a href="register.jsp">Register</a>
                <a href="Login.jsp">Login</a>
            </span>
        </div>
        <div>
            <h1>User does not exist.</h1>
        </div>
        <% }%>
        <div class="footer"><div></div></div>
    </body>
</html>
