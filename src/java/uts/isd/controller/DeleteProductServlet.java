package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.controller.ProductValidator;
import uts.isd.model.*;
import uts.isd.model.dao.*;

/**
 *
 * @author George
 */
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ProductValidator validator = new ProductValidator();

        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductsDAO products = (ProductsDAO) session.getAttribute("products");

        ProductValidator.clear(session);

        try {
            products.deleteProduct(productId);
            ArrayList<Product> productsList = products.fetchProducts();
            session.setAttribute("productsList", productsList);
            request.getRequestDispatcher("products.jsp").include(request, response);
            System.out.println("Successfully deleted product from the database");
        } catch (SQLException ex) {
            Logger.getLogger(DeleteProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
