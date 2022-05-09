<%-- 
    Document   : userEdit
    Created on : Apr 1, 2022, 5:33:25 PM
    Author     : Justin
--%>

<%@page import="uts.isd.model.User"%>
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
        
      </span>
    </div>
        <%
            User user = (User)session.getAttribute("user");
        %>
        <div class="container">
            <form class="edit-form" action="Edit.jsp" method="POST">
                
                <div class='edit-container'>
                    <div class='edit-item'>
                        <h1 class="edit-title"> Edit Details </h1>
                    </div>
                    <div class='edit-item'>
                        <table class="edit-table">
                            <tbody>
                                <tr>
                                    <td> <label for="fname">First Name</label> </td>
                                    
                                </tr>
                                <tr>
                                    <td> <label for="lname">Last Name</label> </td>
                                   
                                </tr>
                                <tr>
                                    <td> <label for="email">Email</label> </td>
                                    
                                </tr>
                                <tr>
                                    <td> <label for="phonenum">Phone Number</label> </td>
                                   
                                </tr>
                                
                                <tr>
                                    <td> <label for="psw">Password</label> </td>
                                    
                                </tr>
                                <tr>
                                    <td> <label for="psw">Confirm Password</label> </td>
                                   
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class='edit-item'>
                        <p class='edit-txt'> <a href="newMain.jsp"> Go Back </a></p>
                        <button type="submit" class="update-btn">Update Details</button>
                    </div>
                </div>
            </form>
            <%
                String firstName = request.getParameter("fname");
                String lastName = request.getParameter("lname");
                String email = request.getParameter("email");
                String password = request.getParameter("pass");
                String phoneNumber = request.getParameter("phonenum");
                
                user = new User(firstName,lastName,email,password,phoneNumber);
                session.setAttribute("user",user);
            %>
        </div>
    </body>
</html>
