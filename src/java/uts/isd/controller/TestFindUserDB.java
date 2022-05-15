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
public class TestFindUserDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            UserManagementDAO db = new UserManagementDAO(conn);

            System.out.print("User email: ");

            String email = in.nextLine();

           System.out.print("User password: ");

            String password = in.nextLine();


            db.findUser(email, password);

//            System.out.println("User is added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestFindUserDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}