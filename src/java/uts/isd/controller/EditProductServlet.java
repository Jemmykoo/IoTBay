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

        System.out.println("I AM TRYING TO UPDATE A PRODUCT" + request.getParameterMap() + " NOOOO");

        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String unitPrice = request.getParameter("unitPrice");
        String productType = request.getParameter("productType");
        String quantity = request.getParameter("quantity");
        String productDescription = request.getParameter("productDescription");

        ProductsDAO products = (ProductsDAO) session.getAttribute("products");
        Product product = null;

        ProductValidator.clear(session);
        if (!validator.validateString(productName)) {
            session.setAttribute("productNameErr", "Error: Name format is incorrect");
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        } else if (!validator.validateFloat(unitPrice)) {
            session.setAttribute("unitPriceErr", "Error: Enter Unit Price");
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        } else if (!validator.validateString(productType)) {
            session.setAttribute("productTypeErr", "Error: Enter Product Type");
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        } else if (!validator.validateInt(quantity)) {
            session.setAttribute("quantityErr", "Error: Enter Quantity");
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        } else if (!validator.validateString(productDescription)) {
            session.setAttribute("productDescriptionErr", "Error: Enter Description");
            request.getRequestDispatcher("editProduct.jsp").include(request, response);
        } else {
            ProductValidator.clear(session);
            try {
                products.updateProductByID(productId, productName, Float.parseFloat(unitPrice), productType, Integer.parseInt(quantity), productDescription);
                ArrayList<Product> productsList = products.fetchProducts();
                session.setAttribute("product", product);
                session.setAttribute("productsList", productsList);
                request.getRequestDispatcher("products.jsp").include(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(EditProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
