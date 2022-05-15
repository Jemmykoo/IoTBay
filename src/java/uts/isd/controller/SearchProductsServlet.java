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
public class SearchProductsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        ProductValidator validator = new ProductValidator();

        String productName = request.getParameter("searchProductString");

        ProductsDAO products = (ProductsDAO) session.getAttribute("products");
        Product product = null;

        ProductValidator.clear(session);

//        try {
//            products.addProduct(productName, unitPrice, productType, quantity, productDescription);
            System.out.println("I JUST FOUND A PRODUCT");
           // ArrayList<Product> searchedProducts = products.fetchProducts();
            //session.setAttribute("searchedProducts", searchedProducts);
            request.getRequestDispatcher("searchproducts.jsp").include(request, response);

//        } catch (SQLException ex) {
//            Logger.getLogger(SearchProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }
}
