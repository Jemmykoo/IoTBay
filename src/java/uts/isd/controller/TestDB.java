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
public class TestDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManager db = new DBManager(conn);

            System.out.print("User email: ");
            String email = in.nextLine();

            System.out.print("User first name: ");
            String fname = in.nextLine();

            System.out.print("User last name: ");
            String lname = in.nextLine();

            System.out.print("User password: ");
            String password = in.nextLine();

            System.out.print("User phone: ");
            String phone = in.nextLine();

            System.out.print("User is staff? (0 or 1): ");
            int isStaff = in.nextInt();

            db.addUser(email, fname, lname, password, phone, isStaff);

            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
