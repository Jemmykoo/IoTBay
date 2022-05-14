<%-- 
    Document   : register
    Created on : 15 Mar. 2022, 8:27:38 pm
    Author     : jemima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css"/>
        <title>Registration Page</title>
    </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Home Page</a>
                <a href="login.jsp">Login</a>
            </span>
        </div>
        <h1>Registration Page</h1>
        <div class="registerform">
            <form id="form" method="POST" action="/regUser/">
                <table>
                    <tr><td>First Name:</td><td><input type="text" id="firstname" name="firstname"></td></tr>
                    <tr><td>Last Name:</td><td><input type="text" id="lastname" name="lastname"></td></tr>
                    <tr><td>Email:</td><td><input type="text" id="email" name="email"></td></tr>
                    <tr><td>Phone:</td><td><input type="text" id="phone" name="phone"></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Password:</td><td><input type="password" id="password" name="password"></td></tr>
                    <tr><td>is-Staff: (1 if staff else 0)</td><td><input type="number" id="isstaff" name="isstaff" min="0" max="1"></td></tr>
                    <tr><td><input class="button" type="submit" value="Sign up"></input></td></tr>
                </table>  
            </form>     
        </div>
        <div class="footer"><div> </div>
        </div>
    </body>
</html>
