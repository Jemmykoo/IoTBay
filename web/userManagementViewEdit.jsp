<%-- 
    Document   : userManagementViewEdit
    Created on : 13 May 2022, 4:41:29 pm
    Author     : DavidPhung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="uts.isd.model.*" %>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="labcss.css"/>
    <head>
        <div id="bar">
            <span id="links">
              <a href="userManagement.jsp">Back</a> <%-- fix the href later --%>
            </span>
        </div>
       <title>View & Delete Users</title>
    </head>
    <body>
        <h1>View & Delete Users</h1>
        <table border="1">
        <tr>
            
        <th>ID</th>
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>PhoneNo</th>
        <th>Staff</th>
        </tr>
        <%  ArrayList<User> al = (ArrayList<User>) session.getAttribute("usersList"); %>
        <%if (al != null) {
                        for (User users : al) {
                %>
        <tr>
            <td><%=users.getID()%></td>
            <td><%=users.getFirstName()%></td>
            <td><%=users.getEmail()%></td>
            <td><%=users.getLastName()%></td>
            <td><%=users.getPassword()%></td>
            <td><%=users.getIsStaff()%></td>
        </tr>
                <%}
                    }
                else{
                    %> <p> some stuff </p> <%
                }
                %>
            
        <form id="form" method="POST" action="userManagementView">
                <table>
                    <tr><td>Delete User by Email:</td></tr>
                    <tr><td><input type="text" id="ID" name="ID"></input></td></tr>
                    <tr><td><input class="button" type="submit" value="Delete"></input></td></tr>
                </table>
        </form>
                
                
    </body>
    
</html>
