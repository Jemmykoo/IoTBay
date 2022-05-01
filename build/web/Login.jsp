<%-- 
    Document   : login
    Created on : 22 Mar. 2022, 6:45:38 pm
    Author     : jemima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="labcss.css"/>
        <title>Login</title>
    </head>
    <body>
        <div id="bar">
            <span id="links">
                <a href="index.jsp">Index</a>
                <a href="register.jsp">Register</a>
            </span>
        </div>

        <h1>Login</h1>
        <form id="form" method="POST" action="main.jsp">
            <table>   
                <tr><td>Email:</td><td><input type="text" id="email" name="email"></td></tr>
                <tr><td>Password:</td><td><input type="password" id="password" name="password"></td></tr>
                <tr><td><input class="button" type="submit" value="Login"></input></td></tr>
            </table>
        </form>
        <div class="footer"><div> </div>
        </div>
    </body>
</html>
