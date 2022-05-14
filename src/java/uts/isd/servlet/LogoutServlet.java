package uts.isd.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/lgtUser/*"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            HttpSession session = request.getSession(true);
            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBManager db = new DBManager(conn);

            User user = (User) session.getAttribute("loggedIn");
            db.addLog(user.getId(), user.getFirstName() + " " + user.getLastName() + " logged out.");

            response.sendRedirect("../Logout.jsp");

        } catch (IOException | ClassNotFoundException | SQLException theException) {
            System.out.println(theException);
        }
    }
}
