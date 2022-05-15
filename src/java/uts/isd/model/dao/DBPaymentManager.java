package uts.isd.model.dao;

import uts.isd.model.PaymentHistory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.text.DateFormat;
import uts.isd.model.dao.DBConnector;
import java.text.SimpleDateFormat;

/* 
* DBPaymentManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
 */
public class DBPaymentManager {

    private Statement st;
    private Connection PaymentConnection;
    private DBConnector DBCon;
    
    public DBPaymentManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }

    public PaymentHistory findPayment(String paymentID, String orderDate) throws SQLException {
        String fetch = "select * from PAYMENT where PAYMENTID = '" + paymentID + "' and orderDate = '" + orderDate + "'";
        ResultSet rs = st.executeQuery(fetch);
        while (rs.next()) {
            int pID = rs.getInt(1);
            String datePaid = rs.getString(9);
            if (paymentID.equals(pID) && datePaid.equals(orderDate)) {
                String paymentMethod = rs.getString(3);
                String nameOnCard = rs.getString(4);
                String cardNumber = rs.getString(5);
                String expiryDate = rs.getString(6);
                String CVV = rs.getString(7);
                double orderPrice = rs.getDouble(8);
            }
        }
        return null;
    }

    public void addPayment(String paymentMethod, String nameOnCard, String cardNumber, String expiryDate, String CVV, int orderID) throws SQLException {
        st.executeUpdate("INSERT INTO PAYMENT(PAYMENTMETHOD, NAMEONCARD, CARDNUMBER, EXPIRYDATE, CVV, ORDERID)" + "VALUES ('" + paymentMethod + "', '" + nameOnCard + "', '" + cardNumber + "','" + expiryDate + "','" + CVV + "'," + orderID + ")");
    }

    public void updatePayment(String paymentMethod, String nameOnCard, String cardNumber, String expiryDate, String CVV) throws SQLException {
        st.executeUpdate("UPDATE PAYMENT SET PAYMENTMETHOD = '" + paymentMethod + "',NAMEONCARD = '" + nameOnCard + "', CARDNUMBER = '" + cardNumber + "', EXPIRYDATE = '" + expiryDate + "', CVV = '" + CVV + "')");
    }

    public void deletePayment(int paymentID) throws SQLException {
        st.executeUpdate("DELETE FROM PAYMENT WHERE PAYMENTID = " + paymentID + "");
    }
    
    public int getID(String email, String password) throws SQLException {
       int ID;
       String fetch = "select ID FROM USERS where EMAIL = '" + email + "' and PASSWORD ='" + password + "'" ;
       ResultSet rs = st.executeQuery(fetch);
       if (rs.next()) {
           ID = rs.getInt(1);
            return ID;
       } else {  
            return 0;
       }
    } 
    public int getOrderID() throws SQLException {
       int orderID;
       String fetch = "select max(ORDERID) FROM ORDERS" ;
       ResultSet rs = st.executeQuery(fetch);
       if (rs.next()) {
            orderID = rs.getInt(1);
            return orderID;
       } else {
           return 0;
       }
    }
    public int getPaymentID() throws SQLException {
       int paymentID;
       String fetch = "select MAX(PAYMENTID) FROM PAYMENT" ;
       ResultSet rs = st.executeQuery(fetch);
       if (rs.next()) {
            paymentID = rs.getInt(1);
            return paymentID;
       } else {
           return 0;
       }
    }
    
    public ArrayList<String> fetchPayment(Integer ID) throws SQLException {
        String fetch = "SELECT PAYMENT.*, ORDERS.ORDERPRICE, ORDERS.ORDERDATE FROM PAYMENT JOIN ORDERS ON ORDERS.ORDERID = PAYMENT.ORDERID JOIN USERS ON USERS.ID = ORDERS.ID WHERE ORDERS.ID= " + ID + "";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<String> temp = new ArrayList();
        
        while(rs.next()) {
            DateFormat date = new SimpleDateFormat("dd-MM-yyyy");
            temp.add(Integer.toString(rs.getInt(1)));
            temp.add(rs.getString(2));
            temp.add(rs.getString(3));
            temp.add(rs.getString(4));
            temp.add(rs.getString(5));
            temp.add(rs.getString(6));
            temp.add(Integer.toString(rs.getInt(7)));
            temp.add(Double.toString(rs.getDouble(8)));
            temp.add(date.format(rs.getDate(9)));
        }
        return temp;
    }
}
