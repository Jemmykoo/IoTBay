/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package uts.isd.controller;

import java.sql.*;
import java.util.*;
import java.util.logging.*;
import uts.isd.model.Payment;
import uts.isd.model.Product;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBPaymentManager;

/**
 *
 * @author Jemima
 */
public class TestCRUDPaymentDB {

    private static Scanner in = new Scanner(System.in);

    public static void main(String[] args) {

        try {

            DBConnector connector = new DBConnector();
            Connection conn = connector.openConnection();
            DBPaymentManager db = new DBPaymentManager(conn);

            System.out.println("Please enter a number indicating which function you want to test: ");
            System.out.println("1. Create a new product to the database.\n2. Read the contents of the payments database.");
            System.out.println("3. Update a product in the database.\n4. Delete a product from the database.");
            System.out.println("5. Exit\n");

            int selectedNumber = Integer.parseInt(in.nextLine());

            switch (selectedNumber) {
                case 1:
                    createPayment(db);
                    readPayment(db);
                    main(null);
                    break;
                case 2:
                    readPayment(db);
                    main(null);
                    break;

                case 3:
                    updatePayment(db);
                    readPayment(db);
                    main(null);
                    break;

                case 4:
                    deletePayment(db);
                    readPayment(db);
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

            Logger.getLogger(TestCRUDPaymentDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    private static void createPayment(DBPaymentManager db) {
        try {
            System.out.print("Payment Method: ");

            String paymentMethod = in.nextLine();

            System.out.print("Name on Card: ");

            String nameOnName = in.nextLine();

            System.out.print("Card Number: ");

            String cardNumber = in.nextLine();

            System.out.print("Expiry Date: ");

            String expiryDate = in.nextLine();

            System.out.print("CVV: ");

            String CVV = in.nextLine();
            
            System.out.println("Order ID: ");
            
            int orderID = Integer.parseInt(in.nextLine());

            db.addPayment(paymentMethod, nameOnName, cardNumber, expiryDate, CVV, orderID);

            System.out.println("Payment with payment method " + paymentMethod + " has been added to the database.\n");
        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDPaymentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void readPayment(DBPaymentManager db) {
        try {
            System.out.println("The Payments in the database are: ");
            ArrayList<Payment> payments = db.fetchPayment();
            for (int i = 0; i < payments.size(); i++) {
                System.out.println(payments.get(i).getPaymentMethod() + " | " + payments.get(i).getNameOnCard() + " | " + payments.get(i).getCardNumber() + " | " + payments.get(i).getExpiryDate() + " | " + payments.get(i).getCVV());
            }
            System.out.println("\n");
        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDPaymentDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void updatePayment(DBPaymentManager db) {
        try {
            System.out.print("Payment Method: ");
            String paymentMethod = in.nextLine();

            System.out.print("Name On Card: ");
            String nameOnCard = in.nextLine();

            System.out.print("Card Number: ");
            String cardNumber = in.nextLine();

            System.out.print("Expiry Date: ");
            String expiryDate = in.nextLine();

            System.out.print("CVV: ");
            String CVV = in.nextLine();

            db.updatePayment(paymentMethod, nameOnCard, cardNumber, expiryDate, CVV);
        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDPaymentDB.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void deletePayment(DBPaymentManager db) {
        try {
            System.out.print("Payment ID of the payment to delete: ");
            int paymentID = Integer.parseInt(in.nextLine());
            db.deletePayment(paymentID);
            System.out.println("Payment with the ID '" + paymentID + "' has been deleted form the database.");

        } catch (SQLException ex) {
            Logger.getLogger(TestCRUDPaymentDB.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

}
