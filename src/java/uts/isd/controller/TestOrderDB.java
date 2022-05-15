/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.Order;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.OrdersDAO;


/**
 *
 * @author Jemima
 */
public class TestOrderDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            OrdersDAO db = new OrdersDAO(conn);

            System.out.print("Order ID: ");

            int orderID = Integer.parseInt(in.nextLine());

            System.out.print("Order Date: ");

            String orderDate = in.nextLine();

            Order order = db.findOrderbyID(orderID, orderDate);

            System.out.println(order);

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestOrderDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
