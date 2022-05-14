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
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ProductValidator validator = new ProductValidator();

        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        float unitPrice = Float.parseFloat(request.getParameter("unitPrice"));
        String productType = request.getParameter("productType");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productDescription = request.getParameter("productDescription");

        ProductsDAO products = (ProductsDAO) session.getAttribute("products");
        Product product = null;

        ProductValidator.clear(session);

        try {
            products.updateProductByID(productId, productName, unitPrice, productType, quantity, productDescription);
            System.out.println("I JUST UPDATED A PRODUCT");
            ArrayList<Product> productsList = products.fetchProducts();
            session.setAttribute("product", product);
            session.setAttribute("productsList", productsList);
            request.getRequestDispatcher("products.jsp").include(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
