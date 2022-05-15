/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uts.isd.controller;


import java.io.IOException;

import java.sql.Connection;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//import uts.isd.controller.Validator;
import uts.isd.model.User;
import uts.isd.model.dao.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManagerDavid;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;



/**
 *
 * @author DavidPhung
 */
@WebServlet(name = "userManagementServet", urlPatterns = {"/userManagementServet/*"})
public class userManagementView extends HttpServlet{
    
    //@Override
    private DBUserManagementManager DBUserManagementManager;
    
    public void init() {
        
        //DBUserManagementManager = new DBUserManagementManager();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManagerDavid db = new DBManagerDavid(conn);
        
            response.setContentType("text/html");
            
            HttpSession session = request.getSession();
            
            String email = request.getParameter("ID");
        
            //DBUserManagementManager = (DBUserManagementManager) session.getAttribute("DBUserManagementManager");
            db.deleteUser(email);
            //request.getRequestDispatcher("userManagementCreate.jsp").forward(request, response);
            connector.closeConnection();
            //response.sendRedirect("index.jsp");
            response.sendRedirect("userManagementViewEdit.jsp");
        } 
        catch (IOException |ClassNotFoundException | SQLException theException) {
            System.out.println(theException);
        }
            /*
            try{
                //DBUserManagementManager.addUser(email, firstName, lastName, password, phoneNo, isStaff);
                //User user = new User(email, firstName, lastName, password, phoneNo, isStaff);
                //request.getRequestDispatcher("userManagementCreate.jsp");
                //response.sendRedirect("userManagementCreate.jsp");
                

            }
            catch(Exception e2){
                System.out.println(e2.getMessage() == null ? "Cannot open Mongo Connection" : "welcome");
            }*/
            
            
        
    }
}
