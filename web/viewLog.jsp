<%-- Document : main Created on : 22 Mar. 2022, 7:10:41 pm Author : jemima --%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="uts.isd.model.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="labcss.css" />
        <title>Main</title>
    </head>
    <body>
        <%
            try {
                ArrayList<Log> logList = (ArrayList<Log>) session.getAttribute("log");

        %>
        <div id="bar">
            <span id="links">
                <a href="../index.jsp">Home Page</a>
                <a href="../editProfile.jsp">Edit profile</a>
                <a href="../delete.jsp">Remove profile</a>
                <a href="../viewLog.jsp">View Log</a>
                <a href="/lgtUser/">Logout</a>
            </span>
        </div>
        <div>
            <h4>Log details section : </h4>
            <table id="form">
                <tbody>
                <% for (Log log : logList) {%>
                <tr>
                    <td>ID:</td>
                    <td><%= log.getId()%>&emsp;</td>

                    <td>Date:</td>
                    <td><%= log.getDate()%>&emsp;</td>

                    <td>Details:</td>
                    <td><%= log.getDescription()%>&emsp;</td>
                </tr>
                <% }%>
                </tbody>
            </table>
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
