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
            <form id="form" method="POST" action="welcome.jsp">
                <table>
                    <tr><td>First Name:</td><td><input type="text" id="firstname" name="firstname" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Last Name:</td><td><input type="text" id="lastname" name="lastname" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Email:</td><td><input type="text" id="email" name="email" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Phone:</td><td><input type="text" id="phone" name="phone" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Password:</td><td><input type="password" id="password" name="password" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td><input class="button" type="submit" value="Sign up"></td></tr>
                </table>
                
                <div class='register-item'>
                        <p class='register-txt'> Already have an account? <a href="Login.jsp"> Login here! </a> </p>
                </div>
            </form>     
        </div>
        <div class="footer"><div> </div>
        </div>
    </body>
</html>
