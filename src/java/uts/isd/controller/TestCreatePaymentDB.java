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
import uts.isd.model.dao.DBPaymentManager;

/**
 *
 * @author Jemima
 */
public class TestCreatePaymentDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();

            Connection conn = connector.openConnection();

            DBPaymentManager db = new DBPaymentManager(conn);

            System.out.print("Payment Method: ");
            String paymentMethod = in.nextLine();

            System.out.print("Name on Card: ");

            String nameOnCard = in.nextLine();

            System.out.print("Card Number: ");

            String cardNumber = in.nextLine();

            System.out.print("Expiry Date: ");

            String expiryDate = in.nextLine();

            System.out.print("CVV: ");

            String CVV = in.nextLine();

            System.out.print("Order ID: ");

            int orderID = Integer.parseInt(in.nextLine());

            db.addPayment(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV, orderID);

            System.out.println("Payment added to the database.");

            connector.closeConnection();

        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(TestCreatePaymentDB.class.getName()).log(Level.SEVERE, null, ex);

        }

    }

}
