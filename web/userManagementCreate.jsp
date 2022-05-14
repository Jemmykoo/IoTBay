<%-- 
    Document   : userManagementCreate
    Created on : 13 May 2022, 4:41:12 pm
    Author     : DavidPhung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="labcss.css"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Users</title>
        <div id="bar">
            <span id="links">
              <a href="userManagement.jsp">Back</a> <%-- fix the href later --%>
            </span>
        </div>
    </head>
    <body>
        <h1>Add Users</h1>
        <div class="registerform">
            <form id="form" method="POST" action="userManagementServet">
                <table>
                    <tr><td>Email:</td><td><input type="text" id="email" name="email"></td></tr>
                    <tr><td>First Name:</td><td><input type="text" id="firstname" name="firstname"></td></tr>
                    <tr><td>Last Name:</td><td><input type="text" id="lastname" name="lastname"></td></tr>
                    <tr><td>Password:</td><td><input type="password" id="password" name="password"></td></tr>
                    <tr><td>Phone:</td><td><input type="text" id="phone" name="phone"></td></tr>
                    <tr><td><input type="radio" name="isStaff" value="FALSE" checked />Customer</td><td><input type="radio" name="isStaff" value="TRUE"/>Staff</td></tr>
                    <tr><td><input class="button" type="submit" value="Create"></input></td></tr>
                </table>  
            </form>     
        </div>
    </body>
</html>
