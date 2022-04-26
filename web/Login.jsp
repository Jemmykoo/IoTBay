<%-- 
    Document   : Login
    Created on : 03/04/2022, 5:00:23 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <div>
            <span><a href="index.html">Home</a>
        </div>
        <title>Login Page</title>
</head>
<body>
    <form method="POST" action="Welcome1.jsp">
        <table>
            <tr><td>Email: </td><td><input type="text" name="email"></td></tr>
            <tr><td>Password:</td><td><input type="password" name="password"></td></tr>
            <tr><td></td><td><input class="button" type="submit" value="Login"></td></tr>
            <tr><td><a class="button" href="index.html">Cancel</a></td></tr>
        </table>
    </form>
</body>
</html>
