package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.controller.*;
import uts.isd.model.*;
import uts.isd.model.dao.*;

/**
 *
 * @author George
 */
public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserValidator validator = new UserValidator();

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phoneNo");
        boolean isStaff = Boolean.parseBoolean(request.getParameter("isStaff"));

        UserManagementDAO users = (UserManagementDAO) session.getAttribute("users");
        User user = null;

        UserValidator.clear(session);

        try {
            users.addUser(email, firstName, lastName, password, phoneNo, isStaff);
            System.out.println("I JUST ADDED A PRODUCT");
            ArrayList<User> usersList = users.fetchUsers();
            session.setAttribute("users", users);
            session.setAttribute("usersList", usersList);
            request.getRequestDispatcher("userManagement.jsp").include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
