/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.Product;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.ProductsDAO;

/**
 *
 * @author Jemima
 */
public class TestCRUDProductsDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            ProductsDAO db = new ProductsDAO(conn);

            System.out.println("Please enter a number indicating which function you want to test: ");
            System.out.println("1. Create a new product to the database.\n2. Read the contents of the products database.");
            System.out.println("3. Update a product in the database.\n4. Delete a product from the database.");
            System.out.println("5. Exit\n");

            int selectedNumber = Integer.parseInt(in.nextLine());

            switch (selectedNumber) {
                case 1:
                    createProduct(db);
                    readProducts(db);
                    main(null);
                    break;
                case 2:
                    readProducts(db);
                    main(null);
                    break;

                case 3:
                    updateProduct(db);
                    readProducts(db);
                    main(null);
                    break;

                case 4:
                    deleteProduct(db);
                    readProducts(db);
                    main(null);
                    break;

                case 5:
                    System.out.println("Exiting, Thank you for your time.");
                    break;

                default:
                    System.out.println("Please one of the numbers suggested.");
                    main(null);
            }
            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestCRUDProductsDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    private static void createProduct(ProductsDAO db) {
        try {
            System.out.print("Product Name: ");

            String productName = in.nextLine();

            System.out.print("Product Unit Price: ");

            float unitPrice = Float.parseFloat(in.nextLine());

            System.out.print("Product Type: ");

            String productType = in.nextLine();

            System.out.print("Product quantity: ");

            int quantity = Integer.parseInt(in.nextLine());

            System.out.print("Product Description: ");

            String productDescription = in.nextLine();

            db.addProduct(productName, unitPrice, productType, quantity, productDescription);

            System.out.println("Product " + productName + " has been added to the database.\n");
        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDProductsDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void readProducts(ProductsDAO db) {
        try {
            System.out.println("The Products in the database are: ");
            ArrayList<Product> products = db.fetchProducts();
            for (int i = 0; i < products.size(); i++) {
                System.out.println(products.get(i).getProductId() + " | " + products.get(i).getProductName() + " | " + products.get(i).getUnitPrice() + " | " + products.get(i).getProductType() + " | " + products.get(i).getQuantity() + " | " + products.get(i).getProductDescription());
            }
            System.out.println("\n");
        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDProductsDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void updateProduct(ProductsDAO db) {
        try {
            System.out.print("Product ID: ");
            int productId = Integer.parseInt(in.nextLine());

            System.out.print("Product Name: ");
            String productName = in.nextLine();

            System.out.print("Product Unit Price: ");
            float unitPrice = Float.parseFloat(in.nextLine());

            System.out.print("Product Type: ");
            String productType = in.nextLine();

            System.out.print("Product quantity: ");
            int quantity = Integer.parseInt(in.nextLine());

            System.out.print("Product Description: ");
            String productDescription = in.nextLine();

            db.updateProductByID(productId, productName, unitPrice, productType, quantity, productDescription);
        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDProductsDB.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void deleteProduct(ProductsDAO db) {
        try {
            System.out.print("Product ID of the product to delete: ");
            int productId = Integer.parseInt(in.nextLine());
            db.deleteProduct(productId);
            System.out.println("Product with the ID '" + productId + "' has been deleted form the database.");

        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDProductsDB.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

}
