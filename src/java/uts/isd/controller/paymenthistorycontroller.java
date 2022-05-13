/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class PaymentHistoryController extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = Integer.parseInt(request.getParameter("userID")); 
       DBPaymentManager paymentManager = (DBPaymentManager) session.getAttribute("paymentManager");
           
       if(userID != null){
           ArrayList<String> temp = new ArrayList();
           try {
               System.out.println(userID);
               temp = paymentManager.fetchPayment(userID);
           } catch (SQLException ex) {
               Logger.getLogger(PaymentHistoryController.class.getName()).log(Level.SEVERE, null, ex);
           }
                if(temp != null){
                    session.setAttribute("listOfPayments", temp);
                }  else {
                    session.setAttribute("fetchMessage", "There is no record in database");
                }
                response.sendRedirect("paymenthistory.jsp");
           
       } else {
            request.getRequestDispatcher("paymentsistoryforanon.jsp").include(request, response);
       }
    }
    
}