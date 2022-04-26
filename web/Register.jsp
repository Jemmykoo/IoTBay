<%-- 
    Document   : Register.jsp
    Created on : 15/03/2022, 8:32:49 PM
    Author     : super
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <div>
            <span><a href="index.html">Home</a>
        </div>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>Register</h1>
        <form method="POST" action="Welcome.jsp">
            <table>
                <tr><td>Email: </td><td><input type="text" name="email"></td></tr>
                <tr><td>Password:</td><td><input type="password" name="password"></td></tr>
                <tr><td>Name: </td><td><input type="text" name="name"></td></tr>
                <tr><td>Phone: </td><td><input type="text" name="phone"></td></tr>
                <tr><td>Favourite Colour: </td><td><input type="text" name="colour"></td></tr>
                <tr><td>Date of Birth: </td><td><input type="date" name="dob"></td></tr>
                <tr><td>Gender: </td><td><input type="text" name="gender"></td></tr>
                <tr><td>TOS: </td><td><input type="checkbox" name="tos"></td></tr>
                <tr><td></td><td><input class="button" type="submit" value="Sign Up"></td></tr>
                <tr><td><a class="button" href="index.html">Cancel</a></td></tr>
            </table>
        </form>
    </body>
</html>
