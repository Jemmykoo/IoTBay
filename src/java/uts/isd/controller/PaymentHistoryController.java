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
import uts.isd.model.User;
import uts.isd.model.dao.DBPaymentManager;

/**
 *
 * @author Patrick
 */
public class PaymentHistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("LoggedInUser");
        if (loggedInUser != null) {
            String email = loggedInUser.getEmail();

            String password = loggedInUser.getPassword();
            System.out.println(email);
            System.out.println(password);
            DBPaymentManager paymentManager = (DBPaymentManager) session.getAttribute("paymentManager");

            try {
                if (email != null && password != null) {
                    ArrayList<String> temp = new ArrayList();
                    int ID;
                    ID = paymentManager.getID(email, password);
                    System.out.println(ID);
                    Integer orderID = paymentManager.getOrderID();
                    session.setAttribute("orderId", orderID);
                    System.out.println(orderID);
                    temp = paymentManager.fetchPayment(ID);
                    System.out.println(temp);
                    if (!temp.isEmpty()) {
                        session.setAttribute("listOfPayments", temp);
                    } else {
                        session.setAttribute("fetchMessage", "There is no record in database");
                    }
                } else {
                    request.getRequestDispatcher("paymenthistoryforanon.jsp").include(request, response);
                }
                response.sendRedirect("paymenthistory.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(PaymentHistoryController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.getRequestDispatcher("paymenthistoryforanon.jsp").include(request, response);
        }
    }
}
