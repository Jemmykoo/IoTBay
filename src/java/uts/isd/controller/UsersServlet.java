/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

import uts.isd.model.*;
import uts.isd.model.dao.*;

public class UsersServlet extends HttpServlet {

    private DBConnector db;
    private UserManagementDAO users;
    private Connection conn;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        try {
            ArrayList<User> usersList = users.fetchUsers();

            if (usersList != null) {
                System.out.println("List Created");
                session.setAttribute("usersList", usersList);
                request.getRequestDispatcher("userManagement.jsp").include(request, response);
            } else {
                request.getRequestDispatcher("userManagement.jsp").include(request, response);
                session.setAttribute("existErr", "Users Do Not Exist In The Database");
            }

        } catch (SQLException | NullPointerException ex) {
            System.out.println(ex.getMessage() == null ? "Users cannot be loaded" : "welcome");
            Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("users.jsp").include(request, response);
        }
    }
}
