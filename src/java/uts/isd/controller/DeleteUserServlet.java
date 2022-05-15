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
import uts.isd.controller.UserValidator;
import uts.isd.model.*;
import uts.isd.model.dao.*;

/**
 *
 * @author George
 */
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserValidator validator = new UserValidator();

        int ID = Integer.parseInt(request.getParameter("id"));

        UserManagementDAO users = (UserManagementDAO) session.getAttribute("users");

        UserValidator.clear(session);

        try {
            users.deleteUserByID(ID);
            ArrayList<User> usersList = users.fetchUsers();
            session.setAttribute("usersList", usersList);
            request.getRequestDispatcher("userManagement.jsp").include(request, response);
            System.out.println("Successfully deleted User from the database");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
