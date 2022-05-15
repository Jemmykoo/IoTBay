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
import uts.isd.model.dao.DBUserManagementManager;
import uts.isd.model.dao.DBManagerDavid;

/**
 *
 * @author Jemima
 */
public class TestUsermanagementDeleteUser {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBManagerDavid db = new DBManagerDavid(conn);

            System.out.print("User ID to: ");

            String id = in.nextLine();

            db.deleteUser(id);

            System.out.println("User is deleted from the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestDBUserManagementManager.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
