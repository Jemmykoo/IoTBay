package uts.isd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.*;
import uts.isd.model.*;

public class ConnServlet extends HttpServlet {

    private DBConnector db;

    private DBManager manager;

    private Connection conn;

    private ProductsDAO products;
    
    private DBManagerDavid users;

    private ArrayList<Product> productsList;
    
    private ArrayList<User> usersList;

    private ArrayList<Product> productsList;

    @Override //Create and instance of DBConnector for the deployment session

    public void init() {

        System.out.println("Initializing DBConnector");
        try {

            db = new DBConnector();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

    @Override //Add the DBConnector, DBManager, Connection instances to the session

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Initial DoGet");

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        conn = db.openConnection();

        try {
            
            manager = new DBManager(conn);
            products = new ProductsDAO(conn);
            users = new DBManagerDavid(conn);
            productsList = products.fetchProducts();
            usersList = users.fetchUsers();
            

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        //export the DB manager to the view-session (JSPs)
        session.setAttribute("manager", manager);
        session.setAttribute("products", products);
        session.setAttribute("productsList", productsList);
        session.setAttribute("usersList", usersList);

    }

    @Override //Destroy the servlet and release the resources of the application (terminate also the db connection)

    public void destroy() {

        try {

            db.closeConnection();

        } catch (SQLException ex) {

            Logger.getLogger(ConnServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}