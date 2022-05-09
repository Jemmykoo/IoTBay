<%-- 
    Document   : userEdit
    Created on : Apr 1, 2022, 5:33:25 PM
    Author     : Justin
--%>

<%@page import="uts.isd.model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="labcss.css" />
    <title>Edit</title>
  </head>
    <body>
        
        <div id="bar">
      <span id="links">
        <a href="index.jsp">Home Page</a>
        
        </div>
        <%
            User user = (User)session.getAttribute("user");
        %>
        <form method="post" action="Edit.jsp">
        <table>
            <tr><td>First Name:</td><td><input type="text" id="firstname" name="firstname" value="${user.firstName}" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Last Name:</td><td><input type="text" id="firstname" name="lastname" value="${user.lastName}" required></td></tr>
                    <tr><td><span></span></td></tr>
                    <tr><td>Email:</td><td><input type="text" id="firstname" name="email" value="${user.email}" required></td></tr>
                    <tr><td><span></span></td></tr><!-- comment -->
                    <tr><td>phone:</td><td><input type="text" id="firstname" name="phone" value="${user.phone}" required></td></tr>
                    <tr><td><span></span></td></tr><!-- comment -->
                    <tr><td>password:</td><td><input type="text" id="firstname" name="password" value="${user.password}" required></td></tr>
                    <tr><td><span></span></td></tr><!-- comment -->
                    <tr>
                        <td>
                            <a href="newMain.jsp">Main</a>
                            <input class="button" type="submit" value="Update">
                        </td>
                    </tr>
                </table>
        </form>
                    <%
                        String firstname = request.getParameter("firstname");
                        String lastname = request.getParameter("lastname");
                        String email = request.getParameter("email");
                        String phone = request.getParameter("phone");
                        String password = request.getParameter("password");
                        user = new User(firstname, lastname, email, phone, password);
                        session.setAttribute("user", user);
                    %>
    </body>
</html>
