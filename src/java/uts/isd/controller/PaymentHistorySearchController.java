package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.PaymentHistory;
import uts.isd.controller.PaymentValidator;
import uts.isd.model.dao.DBPaymentManager;

public class PaymentHistorySearchController extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session;
        session = request.getSession();
        PaymentValidator paymentValidator = new PaymentValidator();
        String paymentID = request.getParameter("paymentID");
        String orderDate = request.getParameter("orderDate");
        DBPaymentManager paymentManager;
        paymentManager = (DBPaymentManager) session.getAttribute("paymentManager");
        PaymentHistory paymenthistory = null;

        try {
            paymenthistory = paymentManager.findPayment(paymentID, orderDate);

            if (paymenthistory != null) {
                session.setAttribute("paymenthistory", paymenthistory);
                request.getRequestDispatcher("paymenthistorysearch.jsp").include(request, response);
            } else if (!paymentValidator.validatePaymentID(paymentID)) {
                session.setAttribute("existErr", "Payment does not exist in the Datebase");
                request.getRequestDispatcher("paymenthistory.jsp").include(request, response);
            } else if (!paymentValidator.validateOrderDate(orderDate)) {
                session.setAttribute("existErr", "Payment does not exist in the Datebase");
                request.getRequestDispatcher("paymenthistory.jsp").include(request, response);
            } else {
                session.setAttribute("existErr", "Payment does not exist in the Datebase");
                request.getRequestDispatcher("paymenthistory.jsp").include(request, response);
            }

        } 
        catch(SQLException ex){
            System.out.println(ex.getErrorCode() + " and " + ex.getMessage());
        }
    }
}
