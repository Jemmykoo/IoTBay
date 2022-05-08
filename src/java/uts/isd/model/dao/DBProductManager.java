/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.model.dao;

import uts.isd.model.Product;
import java.sql.*;

/**
 *
 * @author Jemima
 */
public class DBProductManager {

    private Statement st;

    public DBProductManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public String findProductIDByName(String productName) throws SQLException {
        // returns the product id when given just the name
        return null;
    }

    public Product findProductByName(String productName) throws SQLException {
        //setup the select sql query string       
        //execute this query using the statement field       
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters               
        return null;
    }

    public Product findProductByID(String productId) throws SQLException {
        //setup the select sql query string       
        //execute this query using the statement field       
        //add the results to a ResultSet       
        //search the ResultSet for a user using the parameters               
        return null;
    }

//Add a user-data into the database   
    public void addProduct(String productName, float unitPrice, String productType, int quantity, String productDescription) throws SQLException {                   //code for add-operation       
        st.executeUpdate("sql query");
    }

//update a user details in the database   
    public void updateProductByName(String productName, float unitPrice, String productType, int quantity, String productDescription) throws SQLException {
        //code for update-operation  
// find the product id using the name  
    }

//delete a user from the database   
    public void deleteProduct(String productID) throws SQLException {
        //code for delete-operation   

    }

}
