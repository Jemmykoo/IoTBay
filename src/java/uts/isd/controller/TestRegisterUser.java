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
import uts.isd.model.dao.UserManagementDAO;

/**
 *
 * @author Jemima
 */
public class TestRegisterUser {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            UserManagementDAO db = new UserManagementDAO(conn);

            System.out.print("User email: ");

            String email = in.nextLine();

            System.out.print("User Fname: ");

            String firstname = in.nextLine();
            
            System.out.print("User lname: ");

            String last = in.nextLine();

            System.out.print("User password: ");

            String password = in.nextLine();

            System.out.print("User phone: ");

            String phone = in.nextLine();

            System.out.print("User staff? (true or false) ");
            Scanner n = new Scanner(System.in);
            boolean isstaff = n.nextBoolean();
               

            db.addUser(email, firstname, last, password, phone, isstaff);

            System.out.println("User has been registered");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestRegisterUser.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}