/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBPaymentManager;

/**
 *
 * @author Patrick
 */
public class PaymentUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer paymentID = Integer.parseInt(request.getParameter("paymentID"));
        String paymentMethod = request.getParameter("paymentMethod");
        String nameOnCard = request.getParameter("nameOnCard");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        int CVV = Integer.parseInt(request.getParameter("CVV"));
        DBPaymentManager paymentManager = (DBPaymentManager) session.getAttribute("paymentManager");

        try {
            if (paymentID != null) {
                session.setAttribute("paymentID", paymentID);
                paymentManager.updatePayment(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV);
                request.getRequestDispatcher("paymentupdate.jsp").include(request, response);
                response.sendRedirect("paymentdetails.jsp");

            } else {
                request.getRequestDispatcher("paymentupdate.jsp").include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
