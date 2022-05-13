/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
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
public class paymentcontroller extends HttpServlet {
    private DBPaymentManager paymentManager;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {     
        HttpSession session = request.getSession();
        PaymentValidator validator = new PaymentValidator();
        String paymentMethod = request.getParameter("paymentMethod");
        String nameOnCard = request.getParameter("nameOnCard");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        int CVV = Integer.parseInt(request.getParameter("CVV"));
        String orderDate = request.getParameter("orderDate"); 
        double orderPrice = Double.parseDouble(request.getParameter("orderPrice")); 
        if (!validator.validateCardNumber("cardNumber")) {
            session.setAttribute("cardNumberErr", "Error: Card Number format incorrect");
            request.getRequestDispatcher("payment.jsp").include(request, response);
        } else if (!validator.validateExpiryDate("cardNumber")) {
            session.setAttribute("expiryDateErr", "Error: Expiry Date format incorrect");
            request.getRequestDispatcher("payment.jsp").include(request, response);    
        } else if (!validator.validateCVV("CVV")) {
            session.setAttribute("CVVErr", "Error: CVV format incorrect");
            request.getRequestDispatcher("payment.jsp").include(request, response);    
        } else {
        try {
            session.setAttribute("paymentManager", paymentManager);
            Integer orderID = paymentManager.getOrderID();
            session.setAttribute("orderID", orderID);
            Integer paymentID = paymentManager.getPaymentID();
            session.setAttribute("paymentID", paymentID);
            paymentManager.addPayment(paymentMethod,nameOnCard,cardNumber,expiryDate,CVV);
            request.getRequestDispatcher("payment.jsp").include(request, response);
            response.sendRedirect("paymentdetails.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(paymentcontroller.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
