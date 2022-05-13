/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.PaymentHistory;
import uts.isd.model.dao.DBPaymentManager;

/**
 *
 * @author Patrick
 */
public class paymentedit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer paymentID = Integer.parseInt(request.getParameter("paymentID"));
        DBPaymentManager paymentManager = (DBPaymentManager) session.getAttribute("paymentManager");
        
        PaymentHistory payment = null;
            if(paymentID != null){
                session.setAttribute("paymentID", paymentID);              
                request.getRequestDispatcher("paymentdetails.jsp").include(request, response);
                response.sendRedirect("paymentupdate.jsp");
            }
            else{
                session.setAttribute("existErr", "Payment does not exist in database");
                request.getRequestDispatcher("paymentupdate.jsp").include(request, response);
            }
        } 
    }    
