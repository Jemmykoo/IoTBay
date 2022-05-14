package uts.isd.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Log;
import uts.isd.model.User;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/cklogin/*"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            User user = db.findUser(request.getParameter("email"), request.getParameter("password"));

            db.addLog(user.getId(), user.getFirstName() + " " + user.getLastName() + " logged in.");

            ArrayList<Log> loglist = db.findLog(user.getId());

            HttpSession session = request.getSession(true);
            session.setAttribute("loggedIn", user);

            session.setAttribute("log", loglist);
            request.setAttribute("password", request.getParameter("password"));
            request.setAttribute("email", request.getParameter("email"));

            if (!user.getPassword().equals("")) {
                request.getRequestDispatcher("../Main.jsp").forward(request, response);
            } else {
                response.sendRedirect("../Login.jsp");
            }

        } catch (IOException | ClassNotFoundException | SQLException theException) {
            System.out.println(theException);
        }
    }
}
