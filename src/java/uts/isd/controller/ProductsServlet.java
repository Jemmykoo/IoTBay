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

public class ProductsServlet extends HttpServlet {

    private DBConnector db;
    private ProductsDAO products;
    private Connection conn;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();


        products = (ProductsDAO) session.getAttribute("products");
        ProductValidator validator = new ProductValidator();
        validator.clear(session);
        try {
            ArrayList<Product> productsList  = products.fetchProducts();
            if (productsList != null) {
                System.out.println("List Created");
                session.setAttribute("productsList", productsList);
                request.getRequestDispatcher("products.jsp").include(request, response);
            } else {
                request.getRequestDispatcher("products.jsp").include(request, response);
                session.setAttribute("existErr", "Products Do Not Exist In The Database");
            }
        } catch (SQLException | NullPointerException ex) {
            System.out.println(ex.getMessage() == null ? "Products cannot be loaded" : "welcome");
            Logger.getLogger(ProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("products.jsp").include(request, response);
        }
    }
}
