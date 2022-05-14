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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBPaymentManager;

/**
 *
 * @author Patrick
 */
public class PaymentController extends HttpServlet {
    private DBPaymentManager paymentManager;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {     
        HttpSession session = request.getSession();
        PaymentValidator validator = new PaymentValidator();
        String paymentMethod = request.getParameter("paymentMethod");
        String nameOnCard = request.getParameter("nameOnCard");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String CVV = request.getParameter("CVV"); 
        
        Payment payment = new Payment(paymentMethod,nameOnCard,cardNumber,expiryDate,CVV);
        DBPaymentManager manager = (DBPaymentManager) session.getAttribute("manager");
        
        if (!validator.validateCardNumber(cardNumber)) {
            session.setAttribute("cardNumberErr", "Error: Card Number format incorrect");
            request.getRequestDispatcher("payment.jsp").include(request, response);
        } else if (!validator.validateCVV(CVV)) {
            session.setAttribute("CVVErr", "Error: CVV format incorrect");
            request.getRequestDispatcher("payment.jsp").include(request, response);       
        } else if (!validator.validateCardNumber(cardNumber)) {
            session.setAttribute("cardNumberErr", "Error: Card Number format incorrect");
            request.getRequestDispatcher("payment.jsp").include(request, response);
        } else {
        try {
            if(payment != null){
            session.setAttribute("payment", payment);
            Integer orderId = manager.getOrderID();
            session.setAttribute("orderId", orderId);
            manager.addPayment(paymentMethod, cardNumber, CVV, nameOnCard, expiryDate);
            Integer paymentId = manager.getPaymentID();
            session.setAttribute("paymentId", paymentId);
            request.getRequestDispatcher("paymentdetails.jsp").include(request, response);
            response.sendRedirect("paymentdetails.jsp");
            } else {
                 request.getRequestDispatcher("index.jsp").include(request, response);
             }
        } catch (Exception ex) {
            Logger.getLogger(PaymentEdit.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
