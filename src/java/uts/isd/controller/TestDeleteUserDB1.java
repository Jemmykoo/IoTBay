/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.sql.*;

import java.util.*;

import java.util.logging.*;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.UserManagementDAO;

/**
 *
 * @author Jemima
 */
public class TestDeleteUserDB1 {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            UserManagementDAO db = new UserManagementDAO(conn);

            System.out.print("Please enter one of the following options:");
            System.out.print("1. Delete a user by ID\n2. Delete a user by email address.");

            int selection = Integer.parseInt(in.nextLine());

            switch (selection) {
                case 1:
                    deleteByID(db);
                    main(null);
                    break;

                case 2:
                    deleteByEmail(db);
                    main(null);
                    break;

                case 3:
                    deleteByID(db);
                    main(null);
                    break;

                default:
                    System.out.println("Please one of the numbers suggested.");
                    main(null);
            }
            deleteByID(db);

//            System.out.println("User is added to the database.");
            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDeleteUserDB1.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public static void deleteByID(UserManagementDAO db) {
        try {
            System.out.print("User ID to delete: ");
            int id = Integer.parseInt(in.nextLine());
            db.deleteUserByID(id);
            System.out.println("User with the ID '" + id + "' has been deleted form the database.");

        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDProductsDB.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteByEmail(UserManagementDAO db) {
        try {
            System.out.print("User Email to delete: ");
            String email = in.nextLine();
            db.deleteUserByEmail(email);
            System.out.println("Product with the Email '" + email + "' has been deleted form the database.");

        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDProductsDB.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

}
