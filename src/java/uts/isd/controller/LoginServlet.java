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
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserValidator validator = new UserValidator();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        DBManager manager = (DBManager) session.getAttribute("manager");
        User user = null;

        UserValidator.clear(session);

        try {
            manager.findUser(email, password);
            System.out.println("FINDING A USER");
            user = manager.findUser(email, password);
            session.setAttribute("LoggedInUser",user);
            request.getRequestDispatcher("index.jsp").include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
