/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import uts.isd.model.Product;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Jemima
 */
public class ProductsDAO {

    private Statement st;
    private PreparedStatement readSt;
    private PreparedStatement updateSt;
    private PreparedStatement deleteSt;
    private String readQuery = "SELECT * FROM PRODUCTS WHERE PRODUCTID=?";
    private String updateQueryByID = "UPDATE PRODUCTS SET PRODUCTNAME=?,UNITPRICE=?,PRODUCTTYPE=?,QUANTITY=?,PRODUCTDESCRIPTION=? WHERE PRODUCTID=?";
    private String deleteQuery = "DELETE FROM PRODUCTS WHERE PRODUCTID= ?";

    public ProductsDAO(Connection conn) throws SQLException {
        st = conn.createStatement();
        conn.setAutoCommit(true);
        st = conn.createStatement();
        readSt = conn.prepareStatement(readQuery);
        updateSt = conn.prepareStatement(updateQueryByID);
        deleteSt = conn.prepareStatement(deleteQuery);
    }

    public void addProduct(String productName, float unitPrice, String productType, int quantity, String productDescription) throws SQLException {
        String columns = "INSERT INTO PRODUCTS(PRODUCTNAME,UNITPRICE,PRODUCTTYPE,QUANTITY,PRODUCTDESCRIPTION)";
        String unitPriceStr = Float.toString(unitPrice);
        String quantityStr = Integer.toString(quantity);
        String values = "VALUES('" + productName + "'," + unitPriceStr + ",'" + productType + "'," + quantityStr + ",'" + productDescription + "')";
        st.executeUpdate(columns + values);
    }

    public ArrayList<Product> fetchProducts() throws SQLException {
        String fetch = "SELECT * FROM PRODUCTS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> products = new ArrayList();

        while (rs.next()) {
            int productId = Integer.parseInt(rs.getString(1));
            String productName = rs.getString(2);
            Float unitPrice = Float.parseFloat(rs.getString(3));
            String productType = rs.getString(4);
            int quantity = Integer.parseInt(rs.getString(5));
            String productDescription = rs.getString(6);
            products.add(new Product(productId, productName, unitPrice, productType, quantity, productDescription));
        }
        return products;
    }

//update a product details in the database   
    public void updateProductByID(int productId, String productName, float unitPrice, String productType, int quantity, String productDescription) throws SQLException {
        updateSt.setString(1, productName);
        updateSt.setFloat(2, unitPrice);
        updateSt.setString(3, productType);
        updateSt.setInt(4, quantity);
        updateSt.setString(5, productDescription);
        updateSt.setInt(6, productId);
        int row = updateSt.executeUpdate();
        System.out.println("row " + row + " updated successfuly");
    }

//delete a product from the database   
    public void deleteProduct(int productID) throws SQLException {
        deleteSt.setString(1, Integer.toString(productID));
        int row = deleteSt.executeUpdate();
        System.out.println("row " + row + " deleted successfuly");
    }
}
