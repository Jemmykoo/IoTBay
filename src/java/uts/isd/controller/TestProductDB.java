/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author Jemima
 */
public class TestProductDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            System.out.print("Product Name: ");

            String productName = in.nextLine();

            System.out.print("Product Unit Price: ");

            String unitPrice = in.nextLine();

            System.out.print("Product Type: ");

            String productType = in.nextLine();

            System.out.print("Product quantity: ");

            String quantity = in.nextLine();

            System.out.print("Product Description: ");

            String productDescription = in.nextLine();

            db.addUser(productName, unitPrice, productType, quantity, productDescription);

            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestProductDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
