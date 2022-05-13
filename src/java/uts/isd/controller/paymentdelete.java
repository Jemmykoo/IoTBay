/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class PaymentDelete extends HttpServlet {

@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer paymentID = Integer.parseInt(request.getParameter("paymentID"));
        DBPaymentManager paymentManager = (DBPaymentManager) session.getAttribute("paymentManager");
        
        Payment payment = null;
        try{
            if(paymentID != null){
                paymentManager.deletePayment(paymentID);
                session.setAttribute("paymentDeleteWork","Payment successfully deleted");
            }
            else{
                session.setAttribute("paymentDeleteErr","Payment was not deleted");
            }
        }
        catch(SQLException ex){
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
        request.getRequestDispatcher("payment.jsp").include(request, response);
    }
}
